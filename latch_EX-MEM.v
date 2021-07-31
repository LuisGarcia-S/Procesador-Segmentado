// **********************************************************************************************/
//	TITLE:					Latch EX/MEM														//
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
module latch_EX_MEM(
	input						flush_i			,
	input			`WORD		PCInst_i		,
	input						CLK_i			,
	input			[1:0]		WBackVector_i	,
	input			[2:0]		memVector_i		,
	input			`WORD		imm_i			,
	input			`WORD		outALU_i		,
	input						aluZero_i		,
	input			`WORD		dataSrc2_i		,
	input			[4:0]		regDest_i		,

	output reg		`WORD		PCInst_o		,
	output reg		[1:0]		WBackVector_o	,
	output reg					memRead_o		,
	output reg					memWrite_o		,
	output reg					branchBit_o		,
	output reg		`WORD		imm_o			,
	output reg		`WORD		outALU_o		,
	output reg					aluZero_o		,
	output reg		`WORD		dataSrc2_o		,
	output reg		[4:0]		regDest_o
);
	initial begin
		WBackVector_o	<=		0;
		memRead_o		<=		0;
		memWrite_o		<=		0;
		branchBit_o		<=		0;
		imm_o			<=		0;
		outALU_o		<=		0;
		aluZero_o		<=		0;
		dataSrc2_o		<=		0;
		regDest_o		<=		0;
		PCInst_o		<=		0;
	end

	always @(posedge CLK_i) begin
		if (!flush_i) begin
			WBackVector_o	<=		WBackVector_i	;
			memRead_o		<=		memVector_i[2]	;
			memWrite_o		<=		memVector_i[1]	;
			branchBit_o		<=		memVector_i[0]	;
			imm_o			<=		imm_i			;
			outALU_o		<=		outALU_i		;
			aluZero_o		<=		aluZero_i		;
			dataSrc2_o		<=		dataSrc2_i		;
			regDest_o		<=		regDest_i		;
			PCInst_o		<=		PCInst_i		;
		end else begin
			WBackVector_o	<=	0;
			memRead_o		<=	0;
			memWrite_o		<=	0;
			branchBit_o		<=	0;
			imm_o			<=	0;
			outALU_o		<=	0;
			aluZero_o		<=	0;
			dataSrc2_o		<=	0;
			regDest_o		<=	0;
			PCInst_o		<=	0;
		end
	end

endmodule