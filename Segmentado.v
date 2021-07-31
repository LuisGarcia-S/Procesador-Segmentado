//**********************************************************************************************//
//  TITLE:                  Segmentado Main														//
//                                                                                              //
//  PROJECT:                Segmentado                                                          //
//  LANGUAGE:               Verilog, SystemVerilog                                                //
//                                                                                              //
//  AUTHOR:                 Luis Martin Garcia Sebastian - luis.garcia9408@gmail.com 			//
//                                                                                              //
//  REVISION:               0.1 - Segmentado//
//                                                                                              //
//**********************************************************************************************//

`include "include/lagartoII_const.vh"

module	Segmentado(
//===============================================================================================
//	General
//===============================================================================================
	input 						clk_i,
	input						rst_i,
//===============================================================================================
//	WB
//===============================================================================================
	output				`WORD	wb_dato_o
);
	wire				`WORD	if_inst_i_w;
//===============================================================================================

//===============================================================================================
//	PC Generation
//===============================================================================================
	wire						mem_brSelect_w	;
	wire						id_stall_w		;
	wire				`WORD	ex_mem_imm_w	;
	wire				`WORD	if_id_PCInst_w	;
	wire				`WORD	ex_mem_PCInst_w	;

	PCGen PCGen_U0 (
		.clk_i 					(clk_i			),
		.stall_i				(id_stall_w		),
		.rst_i					(rst_i			),
		.brBit					(mem_brSelect_w	),
		.PCBr_i					(ex_mem_PCInst_w),
		.addrOffset_i			(ex_mem_imm_w	),
		.nextPC_o				(if_inst_i_w	)
	);
	
//===============================================================================================
//	IF Stage
//===============================================================================================
	wire				`WORD	if_inst_o_w;
	
	InstMem	InstMem_U0 (
		.clk_i					(clk_i				),
		.WE_i					(1'b0				),
		.AddrR_i				(if_inst_i_w[13:2]	),
		.AddrW_i				(12'b0				),
		.DataW_i				(32'b0				),
		.DataR_o		 		(if_inst_o_w		)
	);
	
//===============================================================================================
//	Latch IF/ID
//===============================================================================================
	wire 				`WORD	if_id_inst_w;
	wire						id_flush_w	;

	latch_IF_ID latch_IF_ID_U0(
		.flush_i				(id_flush_w		),
		.instruction_i			(if_inst_o_w	),
		.stall_i				(id_stall_w		),
		.CLK_i					(clk_i			),
		.PCInst_i				(if_inst_i_w	),
		.PCInst_o				(if_id_PCInst_w	),
		.instruction_o			(if_id_inst_w	)
	);
//===============================================================================================
//	Deco Stage
//===============================================================================================

	wire				`WORD	id_datars1_o_w		;
	wire				`WORD	id_datars2_o_w		;
	wire						mem_wb_regWrite_w	;
	wire 				[4:0]	mem_wb_regDest_w	;

	RegisterFile	ReadRegister_U0	(
		.clk_i					(clk_i				),
		.WE_i					(mem_wb_regWrite_w	),
		.addrSrc1_i				(if_id_inst_w[19:15]),
		.addrSrc2_i				(if_id_inst_w[24:20]),
		.addrDest_i				(mem_wb_regDest_w	),
		.dataDest_i				(wb_dato_o			),
		.dataSrc1_o				(id_datars1_o_w		),
		.dataSrc2_o				(id_datars2_o_w		)
	);

	wire 						id_aluSrc_w			;
	wire 			[1:0]		id_aluOp_w			;
	wire 			[1:0] 		id_WBackVector_w	;
	wire 			[2:0]		id_memVector_w		;
	wire			[2:0]		id_ex_memVector_w	;
	wire 			[4:0]		id_ex_regDest_w		;
	wire						ex_mem_branchBit_w	;
	wire						id_ctrlHazard_w		;
	wire						id_stallCtrl_w		;

	hazard_detection	hazard_detection_U0(
		.brCode_i				(if_id_inst_w[6:0]		),
		.brBranch_i				(ex_mem_branchBit_w		),
		.brSelect_i				(mem_brSelect_w			),
		.id_ex_memRead_i		(id_ex_memVector_w[2]	),
		.id_ex_regDest_i		(id_ex_regDest_w		),
		.if_id_addrScr1_i		(if_id_inst_w[19:15]	),
		.if_id_addrScr2_i		(if_id_inst_w[24:20]	),
		.stall_o				(id_stall_w				),
		.ctrlHazard_o			(id_CtrlHazard_w		),
		.flush_o				(id_flush_w				)
	);

	assign	id_stallCtrl_w	=	(!id_CtrlHazard_w & id_stall_w) ? 1'b1 : 1'b0;

	CtrlModule	CtrlModule_U0	(
		.instruction_i			(if_id_inst_w[6:0]	),
		.stall_i				(id_stallCtrl_w		),
		.aluSrc_o				(id_aluSrc_w		),
		.ALUOp_o				(id_aluOp_w			),
		.memVector_o			(id_memVector_w		),
		.WBackVector_o			(id_WBackVector_w	)
	);

	wire 			`WORD		id_imm_o_w	;

	ImmGen	ImmGen_U0(
		.instruction_i			(if_id_inst_w	),
		.data_o					(id_imm_o_w		)
	);

//===============================================================================================
//	Latch ID/EX
//===============================================================================================
	wire			`WORD		id_ex_dataSrc1_w	;
	wire			`WORD		id_ex_dataSrc2_w	;
	wire						id_ex_aluSrc_w		;
	wire			[1:0]		id_ex_aluOp_w		;
	wire			[1:0]		id_ex_WBack_w		;
	wire			`WORD		id_ex_imm_w		;
	wire 			[2:0]		id_ex_func3_w		;
	wire 						id_ex_func3b_w		;
	wire			[4:0]		id_ex_addrSrc1_w	;
	wire			[4:0]		id_ex_addrSrc2_w	;
	wire			`WORD		id_ex_PCInst_w		;

	latch_ID_EX latch_ID_EX_U0(
		.flush_i				(id_flush_w			),
		.PCInst_i				(if_id_PCInst_w		),
		.CLK_i					(clk_i				),
		.dataSrc1_i				(id_datars1_o_w		),
		.dataSrc2_i				(id_datars2_o_w		),
		.aluSrc_i				(id_aluSrc_w		),
		.aluOP_i				(id_aluOp_w			),
		.WBackVector_i			(id_WBackVector_w	),
		.memVector_i			(id_memVector_w		),
		.id_imm_i				(id_imm_o_w			),
		.func3_i				(if_id_inst_w[14:12]),
		.func3b_i				(if_id_inst_w[30]	),
		.regDest_i				(if_id_inst_w[11: 7]),
		.addrSrc1_i				(if_id_inst_w[19:15]),
		.addrSrc2_i				(if_id_inst_w[24:20]),

		.PCInst_o				(id_ex_PCInst_w		),
		.dataSrc1_o				(id_ex_dataSrc1_w	),
		.dataSrc2_o				(id_ex_dataSrc2_w	),
		.aluSrc_o				(id_ex_aluSrc_w		),
		.aluOP_o				(id_ex_aluOp_w		),
		.WBackVector_o			(id_ex_WBack_w		),
		.memVector_o			(id_ex_memVector_w	),
		.id_imm_o				(id_ex_imm_w		),
		.func3_o				(id_ex_func3_w		),
		.func3b_o				(id_ex_func3b_w		),
		.regDest_o				(id_ex_regDest_w	),
		.addrSrc1_o				(id_ex_addrSrc1_w	),
		.addrSrc2_o				(id_ex_addrSrc2_w	)
	);
	
//==============================================================================
//	Execution Stage
//================================================================================================
	wire			[3:0]		ex_aluCtrl_o_w	;
	wire			`WORD		ex_aluOpB_w		;
	wire						ex_aluZero_w	;

	ALUCtrl	ALUCtrl_U0(
		.func3_i				(id_ex_func3_w		),
		.func7bit_i				(id_ex_func3b_w		),
		.aluOP_i				(id_ex_aluOp_w		),
		.ALUCtrl_o				(ex_aluCtrl_o_w		)
	);	

	wire			[1:0]		ex_selFwdA_w;
	wire			[1:0]		ex_selFwdB_w;
	wire			[1:0]		ex_mem_WBackVector_w	;
	wire			[4:0]		ex_mem_regDest_w		;

	forwarding forwarding_U0(
		.ex_mem_regWrite_i		(ex_mem_WBackVector_w[0]),
		.ex_mem_regDest_i		(ex_mem_regDest_w		),
		.mem_wb_regWrite_i		(mem_wb_regWrite_w		),
		.mem_wb_regDest_i		(mem_wb_regDest_w		),
		.id_ex_regRdSrc1_i		(id_ex_addrSrc1_w		),
		.id_ex_regRdSrc2_i		(id_ex_addrSrc2_w		),

		.forwardA_o				(ex_selFwdA_w			),
		.forwardB_o				(ex_selFwdB_w			)
	);

	wire 			`WORD		ex_dataFwdA_w		;
	wire 			`WORD		ex_dataFwdB_w		;
	wire			`WORD		ex_mem_aluOut_w		;

	forwarding_selector forwarding_select_UA(
		.fwdSelect_i			(ex_selFwdA_w		),
		.dataSrc_i				(id_ex_dataSrc1_w	),
		.dataWb_i				(wb_dato_o			),
		.dataMem_i				(ex_mem_aluOut_w	),
		.dataFWD_o				(ex_dataFwdA_w		)
	);

	forwarding_selector forwarding_select_UB(
		.fwdSelect_i			(ex_selFwdB_w		),
		.dataSrc_i				(id_ex_dataSrc2_w	),
		.dataWb_i				(wb_dato_o			),
		.dataMem_i				(ex_mem_aluOut_w	),
		.dataFWD_o				(ex_dataFwdB_w		)
	);

	wire 			`WORD		ex_aluOut_w;

	assign	ex_aluOpB_w	=	(id_ex_aluSrc_w == 0) ? ex_dataFwdB_w : id_ex_imm_w;

	ALU	ALU_U0(
		.A						(ex_dataFwdA_w	), 
		.B						(ex_aluOpB_w	), 
		.ctrl					(ex_aluCtrl_o_w	), 
		.outALU					(ex_aluOut_w	),
		.overflow				(				),
		.zero					(ex_aluZero_w	)
		);
	
//===============================================================================================
//	Latch EX/MEM
//===============================================================================================
	
	wire						ex_mem_memRead_w	;
	wire						ex_mem_memWrite_w	;
	wire 						ex_mem_aluZero_w	;
	wire			`WORD		ex_mem_dataSrc2_w	;

	latch_EX_MEM latch_EX_MEM_U0(
		.flush_i				(id_flush_w				),
		.PCInst_i				(id_ex_PCInst_w			),
		.CLK_i					(clk_i					),
		.WBackVector_i			(id_ex_WBack_w			),
		.memVector_i			(id_ex_memVector_w		),
		.imm_i					(id_ex_imm_w			),
		.aluZero_i				(ex_aluZero_w			),
		.outALU_i				(ex_aluOut_w			),
		.dataSrc2_i				(id_ex_dataSrc2_w		),
		.regDest_i				(id_ex_regDest_w		),

		.PCInst_o				(ex_mem_PCInst_w		),
		.WBackVector_o			(ex_mem_WBackVector_w	),
		.imm_o					(ex_mem_imm_w			),
		.memRead_o				(ex_mem_memRead_w		),
		.memWrite_o				(ex_mem_memWrite_w		),
		.branchBit_o			(ex_mem_branchBit_w		),
		.outALU_o				(ex_mem_aluOut_w		),
		.aluZero_o				(ex_mem_aluZero_w		),
		.dataSrc2_o				(ex_mem_dataSrc2_w		),
		.regDest_o				(ex_mem_regDest_w		)
	);

//==============================================================================
//	Data Accesss Stage
//==============================================================================
	assign	mem_brSelect_w	=	(ex_mem_branchBit_w & ex_mem_aluZero_w);

	wire 			`WORD	mem_dato_w;

	DataMem		DataMem_U0(
		.clk_i					(clk_i				),
		.WE_i					(ex_mem_memWrite_w		),
		.RE_i					(ex_mem_memRead_w		),
		.Addr_i					(ex_mem_aluOut_w[13:2]	),
		.DataW_i				(ex_mem_dataSrc2_w		),
		.DataR_o				(mem_dato_w			)
	);
//===============================================================================================
//	Latch MEM/WB
//===============================================================================================
	wire						mem_wb_memToReg_w	;
	wire			`WORD		mem_wb_wbDato_w		;
	wire			`WORD		mem_wb_aluOut_w		;

	latch_MEM_WB latch_MEM_WB_U0(
		.CLK_i					(clk_i					),
		.WBackVector_i			(ex_mem_WBackVector_w	),
		.wbDato_i				(mem_dato_w				),
		.aluOut_i				(ex_mem_aluOut_w		),
		.regDest_i				(ex_mem_regDest_w		),

		.memToReg_o				(mem_wb_memToReg_w		),
		.regWrite_o				(mem_wb_regWrite_w		),
		.wbDato_o				(mem_wb_wbDato_w		),
		.aluOut_o				(mem_wb_aluOut_w		),
		.regDest_o				(mem_wb_regDest_w		)
	);

//==============================================================================
//	Write Back Stage
//==============================================================================

	assign 		wb_dato_o	=	(mem_wb_memToReg_w) ? mem_wb_wbDato_w : mem_wb_aluOut_w;

endmodule 
