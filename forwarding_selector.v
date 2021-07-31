//**********************************************************************************************//
//  TITLE:                  Forwarding selector													//
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

module forwarding_selector(
	input		[1:0]	fwdSelect_i,
	input		`WORD	dataSrc_i,
	input		`WORD	dataWb_i,
	input		`WORD	dataMem_i,

	output reg	`WORD	dataFWD_o
);
	always @(*) begin
		case (fwdSelect_i)
			2'b00: dataFWD_o	<=	dataSrc_i	;
			2'b01:	dataFWD_o	<=	dataWb_i	;
			2'b10: dataFWD_o	<=	dataMem_i	;
			default: 
			dataFWD_o	<=	`WORD_ZERO;
		endcase	
	end
endmodule