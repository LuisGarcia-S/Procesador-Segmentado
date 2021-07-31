//**********************************************************************************************//
//  TITLE:                  PCGen                              						         //
//                                                                                              //
//  PROJECT:                Monciclo                                                            //
//  LANGUAGE:               Verilog
//                                                                                              //
//  AUTHOR:                 Luis Martin Garcia Sebastian - luis.garcia9408@gmail.com 				//
//                                                                                              //
//  REVISION:               0.1 - Monociclo									                           //
//                                                                                              //
//**********************************************************************************************//

`include "include/lagartoII_const.vh"
 
module PCGen(
 //==============================================================
 //	General
 //==============================================================
	input				clk_i		,
	input				stall_i		,
	input		`WORD	addrOffset_i,
	input				rst_i		,
	input				brBit		,
	input		`WORD	PCBr_i		,
 //==============================================================
 //	PC
 //==============================================================
 
	output reg		`WORD	nextPC_o
);
	wire 	`WORD	nextPC_w;
	wire	`WORD	PC_increment_w;
	wire	`WORD	PC_w;

	assign		PC_increment_w	=	( brBit )	?	(addrOffset_i << 1)	:	`PC_INCREMENT	;
	assign		PC_w			= 	( brBit )	?	PCBr_i 				:	 nextPC_o		;

	HCAdder HCAdder_U0	(
		.i_A			( PC_w			),
		.i_B			( PC_increment_w),
		.i_carryIn		( 1'b0			),
		.o_Out			( nextPC_w		)
	);

	always	@(posedge clk_i)
		begin
			if (!rst_i)
				nextPC_o	<=	`WORD_ZERO;
			else
				if (stall_i) 
					nextPC_o	<=	nextPC_o;
				else
					nextPC_o	<=	nextPC_w;				
		end
endmodule
