// **********************************************************************************************/
//	TITLE:					Latch MEM/WB														//
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

module latch_MEM_WB(
	input						CLK_i,
	input			[1:0]		WBackVector_i,
	input			`WORD		wbDato_i,
	input			`WORD		aluOut_i,
	input			[4:0]		regDest_i,

	output reg					memToReg_o,
	output reg					regWrite_o,
	output reg		`WORD		wbDato_o,
	output reg		`WORD		aluOut_o,
	output reg		[4:0]		regDest_o
);
	initial begin
		memToReg_o		<=		0;
		regWrite_o		<=		0;
		wbDato_o		<=		0;
		aluOut_o		<=		0;
		regDest_o		<=		0;	
	end

	always @(posedge CLK_i) begin
		memToReg_o		<=		WBackVector_i[1];
		regWrite_o		<=		WBackVector_i[0];
		wbDato_o		<=		wbDato_i		;
		aluOut_o		<=		aluOut_i		;
		regDest_o		<=		regDest_i		;
	end

	
endmodule