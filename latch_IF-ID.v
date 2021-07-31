// **********************************************************************************************//
//	TITLE:					Latch IF/ID															//
//																								//
//	PROJECT:				Segmentado															//
//	LANGUAGE:				Verilog																//
//																								//
//	AUTHOR:                 Luis Martin Garcia Sebastian - luis.garcia9408@gmail.com 			//
//																								//
//	REVISION:               0.1 - Segmentado													//
//																								//
//**********************************************************************************************//


`include "include/lagartoII_const.vh"

module latch_IF_ID( 
	input				flush_i			,
	input		`WORD	instruction_i	,
	input				CLK_i			,
	input				stall_i			,
	input		`WORD	PCInst_i		,
	output reg	`WORD	PCInst_o		,
	output reg	`WORD	instruction_o
);
	initial begin
		instruction_o	<=	`WORD_ZERO;	
		PCInst_o		<=	`WORD_ZERO;
	end

	always @(posedge CLK_i) begin
		if(!flush_i)begin
			if (!stall_i) begin
				instruction_o	<=	instruction_i	;
				PCInst_o		<=	PCInst_i		;
			end
		end else begin
			instruction_o	<=	`WORD_ZERO;
			PCInst_o		<=	`WORD_ZERO;
		end
	end

endmodule
 