// **********************************************************************************************//
//	TITLE:					Latch ID/EX															//
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

module latch_ID_EX(
	input					flush_i			,
	input		`WORD		PCInst_i		,
	input					CLK_i			,
	input		`WORD		dataSrc1_i		,
	input		`WORD		dataSrc2_i		,
	input					aluSrc_i		,
	input		[1:0]		aluOP_i			,
	input		[1:0]		WBackVector_i	,
	input		[2:0]		memVector_i		,
	input		`WORD		id_imm_i		,
	input		[2:0]		func3_i			,
	input					func3b_i		,
	input		[4:0]		regDest_i		,
	input		[4:0]		addrSrc1_i		,
	input		[4:0]		addrSrc2_i		,

	output reg	`WORD		PCInst_o		,
	output reg	`WORD		dataSrc1_o		,
	output reg	`WORD		dataSrc2_o		,
	output reg				aluSrc_o		,
	output reg	[1:0]		aluOP_o			,
	output reg	[1:0]		WBackVector_o	,
	output reg	[2:0]		memVector_o		,
	output reg	`WORD		id_imm_o		,
	output reg	[2:0]		func3_o			,
	output reg				func3b_o		,
	output reg	[4:0]		regDest_o		,
	output reg	[4:0]		addrSrc1_o		,
	output reg	[4:0]		addrSrc2_o
);	
	initial begin
		dataSrc1_o		<=		0;
		dataSrc2_o		<=		0;
		aluSrc_o		<=		0;
		aluOP_o			<=		0;
		WBackVector_o	<=		0;
		memVector_o		<=		0;
		id_imm_o		<=		0;
		func3_o			<=		0;
		func3b_o		<=		0;
		regDest_o		<=		0;
		addrSrc1_o		<=		0;
		addrSrc2_o		<=		0;
		PCInst_o		<=		0;
	end

	always @(posedge CLK_i) begin
		if (!flush_i) begin
			dataSrc1_o		<=	dataSrc1_i		;
			dataSrc2_o		<=	dataSrc2_i		;
			aluSrc_o		<=	aluSrc_i		;
			aluOP_o			<=	aluOP_i			;
			WBackVector_o	<=	WBackVector_i	;
			memVector_o		<=	memVector_i		;
			id_imm_o		<=	id_imm_i		;
			func3_o			<=	func3_i			;
			func3b_o		<=	func3b_i		;
			regDest_o		<=	regDest_i		;
			addrSrc1_o		<=	addrSrc1_i		;
			addrSrc2_o		<=	addrSrc2_i		;
			PCInst_o		<=	PCInst_i		;
		end else begin
			dataSrc1_o		<=	0;
			dataSrc2_o		<=	0;
			aluSrc_o		<=	0;
			aluOP_o			<=	0;
			WBackVector_o	<=	0;
			memVector_o		<=	0;
			id_imm_o		<=	0;
			func3_o			<=	0;
			func3b_o		<=	0;
			regDest_o		<=	0;
			addrSrc1_o		<=	0;
			addrSrc2_o		<=	0;
			PCInst_o		<=	0;
		end
	end

endmodule