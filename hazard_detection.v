//**********************************************************************************************//
//  TITLE:                  Forwarding selector													//
//                                                                                              //
//  PROJECT:                Segmentado                                                          //
//  LANGUAGE:               Verilog, SystemVerilog												//
//                                                                                              //
//  AUTHOR:                 Luis Martin Garcia Sebastian - luis.garcia9408@gmail.com 			//
//                                                                                              //
//  REVISION:               0.1 - Monociclo														//
//                                                                                              //
//**********************************************************************************************//

`include "include/lagartoII_const.vh"
 module hazard_detection(
	input		`OPCODE		brCode_i		,
	input					brBranch_i		,
	input					brSelect_i		,
	input					id_ex_memRead_i	,
	input		[4:0]		id_ex_regDest_i	,
	input		[4:0]		if_id_addrScr1_i,
	input		[4:0]		if_id_addrScr2_i,

	output reg				stall_o			,
	output reg				flush_o			,
	output					ctrlHazard_o
	);

	always @(*) begin
		if (id_ex_memRead_i
			&((id_ex_regDest_i == if_id_addrScr1_i)
				| (id_ex_regDest_i == if_id_addrScr2_i))) begin
			stall_o		=	1'b1; 
		end else begin
			stall_o		=	1'b0;
		end

		if (brSelect_i) begin
			flush_o			<=	1'b1;
		end	else begin
			flush_o			<=	1'b0;	
		end
	end

	assign ctrlHazard_o = (!brBranch_i & (brCode_i == 7'b1100011)) ? 1'b1 : 1'b0; 
 endmodule