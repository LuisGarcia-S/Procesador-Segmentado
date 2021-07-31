//**********************************************************************************************//
//  TITLE:					Instruction Memory													//
//                                                                                              //
//  PROJECT:                Segmentado                                                          //
//  LANGUAGE:               Verilog, SystemVerilog                                                //
//                                                                                              //
//  AUTHOR:                 Luis Martin Garcia Sebastian - luis.garcia9408@gmail.com 			//
//                                                                                              //
//  REVISION:               0.1 - Monociclo														//
//                                                                                              //
//**********************************************************************************************//

`include "include/lagartoII_const.vh"
module	InstMem (
	input								clk_i	,
	input								WE_i	,
	input 			[`INDEX_MSB-1:0]	AddrR_i	,
	input 			[`INDEX_MSB-1:0]	AddrW_i	,
	input 			`WORD				DataW_i	,
	output reg		`WORD				DataR_o
	);

	reg				`WORD				instMemory[2**`INDEX_MSB-1:0];
	
	initial
	begin
		$readmemh("instMem.text", instMemory);
	end
	
	
	always @(posedge clk_i) begin 
		if (WE_i)
			instMemory[AddrW_i]		<=	DataW_i;
	end

	always @(negedge clk_i) begin
			DataR_o				<=	instMemory[AddrR_i ];	
	end

	
endmodule