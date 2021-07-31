`include "include/lagartoII_const.vh"

module HCAdder (
    input   `WORD   i_A, 
	input	`WORD	i_B,
    input           i_carryIn,
    output  `WORD   o_Out,
    output          o_set, 
	output 			overflow);

    function integer log2;
        input [6:0] VALUE;
        for (log2 = 0; VALUE > 0; log2 = log2 + 1)
            VALUE = VALUE >> 1;
    endfunction

    genvar	index, s; 
    `define	stages  log2(`WORD_WIDTH)

    //Stage 0
    wire    `WORD   w_outAdder_0,   w_carryOut_0,   w_propagate_0;
    

    assign w_propagate_0 = i_A | i_B;

    full_adder  full_adder_U0   (i_A[0 ],   i_B[0 ],    i_carryIn,  w_outAdder_0[0],    w_carryOut_0[0]);

    generate
        for (index = 1; index < `WORD_WIDTH; index = index + 1) begin: HAStage0
            half_adder  adder_0 (
                i_A[index]          ,
                i_B[index]          ,
                w_outAdder_0[index] ,
                w_carryOut_0[index]
            );
        end
    endgenerate

    //Stage 1
    wire    `WORD    w_propagate_1,  w_generate_1;
 
    generate
        for (index = 0; index < `WORD_WIDTH; index = index + 2) begin : PUStage1
            processUnit processUnit_1 (
                w_propagate_0   [index + 1] ,
                w_carryOut_0    [index + 1] ,
                w_propagate_0   [index]     ,
                w_carryOut_0    [index]     ,
                w_propagate_1   [index + 1] ,
                w_generate_1    [index + 1]
            );
				if (index == 0) begin
					assign	w_propagate_1[index]	=	w_propagate_0[index];		
					assign	w_generate_1 [index]	=	w_carryOut_0 [index];	
				end
        end
    endgenerate

    //Stages main body
    generate
        for (s = 2; s<=`stages; s = s + 1) begin : Lvl
            wire    `WORD   propagatePre_w,   generatePre_w   ;
            wire    `WORD   propagatePost_w,  generatePost_w  ;

            if(s == 2) begin
                assign Lvl[s].propagatePre_w   =   w_propagate_1   ;
                assign Lvl[s].generatePre_w    =   w_generate_1    ;
				end
            else begin
				assign	Lvl[s].propagatePre_w   =   Lvl[s-1].propagatePost_w ;
				assign	Lvl[s].generatePre_w    =   Lvl[s-1].generatePost_w  ;
            end
                
			for (index = (2**(s-1)+1); index < `WORD_WIDTH; index = index + 2) begin : PUBodyStages
				processUnit processUnit_U (
				Lvl[s].propagatePre_w     [index]				,
				Lvl[s].generatePre_w      [index]				,
				Lvl[s].propagatePre_w     [index - 2**(s-1)]	,
				Lvl[s].generatePre_w      [index - 2**(s-1)]	,
				Lvl[s].propagatePost_w    [index]				,
				Lvl[s].generatePost_w     [index]
				);

				if (((2**s)+1) > index) begin
					assign	Lvl[s].propagatePost_w[index - 2**(s-1)]	= 	Lvl[s].propagatePre_w[index - 2**(s-1)];
					assign	Lvl[s].generatePost_w [index - 2**(s-1)]	= 	Lvl[s].generatePre_w [index - 2**(s-1)];
				end

            end
        end
    endgenerate

    //Last Stage 
    wire    `WORD   w_generate_last;
    generate
        for (index = 2; index < `WORD_WIDTH; index = index + 2) begin : PULastStage
			processUnitLastLayer processUnit_lastLayer (
				w_propagate_0   				[index]		,
				w_carryOut_0    				[index]		,
				Lvl[`stages-1].generatePost_w	[index-1]	,
				w_generate_last    				[index]
            );
			assign	w_generate_last[index-1] = Lvl[`stages-1].generatePost_w[index-1];
        end
    endgenerate

	assign  w_generate_last[0]	=	w_carryOut_0[0];

    //Sum

    assign  o_Out[0 ]   =   w_outAdder_0[0];
    assign  o_Out[`WORD_WIDTH-1:1]   =   w_outAdder_0[`WORD_WIDTH-1:1] ^ w_generate_last[`WORD_WIDTH-2:0];   
    
    
    assign  o_set			=	o_Out[`WORD_WIDTH-1];
    assign  overflow 	=	Lvl[`stages-1].generatePost_w[`WORD_WIDTH-1];  
    
endmodule