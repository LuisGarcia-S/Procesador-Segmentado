//**********************************************************************************************//
//  TITLE:                  LAGARTO II CONFIGURATION FILE                                       //
//                                                                                              //
//  PROJECT:                LAGARTO                                                             //
//  LANGUAGE:               Verilog, SystemVerilog                                              //
//                                                                                              //
//  AUTHOR:                 César Alejandro Hernández Calderón - cesar.hernandez@hpcores.org    //
//                                                                                              //
//  REVISION:               0.1 - OoO microarchitecture for MIPS64 R6                           //
//                          0.2 - OoO microarchitecture ported to RISC-V                        //
//                                                                                              //
//**********************************************************************************************//

//===============================================================================================
//  Fetch
//===============================================================================================
`define LAGARTOII_FETCH_MODULE                  lagartoII_core_fetch
`define LAGARTOII_BPU_MODULE                    lagartoII_core_bpu

`define LAGARTOII_BPU_BHT                       lagartoII_core_bpu_bht
`define LAGARTOII_BPU_FSM                       lagartoII_core_bpu_fsm
`define LAGARTOII_BPU_PHT                       lagartoII_core_bpu_pht
`define LAGARTOII_BPU_BTB                       lagartoII_core_bpu_btb
`define LAGARTOII_BPU_COMPARATOR                lagartoII_core_bpu_comparator
`define LAGARTOII_BPU_MUX                       lagartoII_core_bpu_mux
`define LAGARTOII_BPU_CORRECT_ADDR              lagartoII_core_bpu_correct_addr

`define LAGARTOII_JUMP_MODULE                   lagartoII_core_jump
//===============================================================================================
//  Instruction Fetch Queue
//===============================================================================================

//===============================================================================================
//  Decode
//===============================================================================================
`define LAGARTOII_DECODE_MODULE                 lagartoII_decode

`define LAGARTOII_DECODE_IVECTORS_MODULE        lagartoII_decode_ivectors
`define LAGARTOII_DECODE_ICLASS_MODULE          lagartoII_decode_iclass
`define LAGARTOII_DECODE_IVDEF_MODULE           lagartoII_decode_ivdef
`define LAGARTOII_DECODE_IVSEL_MODULE           lagartoII_decode_ivsel
`define LAGARTOII_DECODE_CSR_TRANS_MODULE       lagartoII_decode_csr_trans

`define LAGARTOII_DECODE_XCPT_MODULE            lagartoII_decode_xcpt
`define LAGARTOII_DECODE_XCPT_CNTRL_MODULE      lagartoII_decode_xcpt_ctrl
//===============================================================================================
//  Free Register List
//===============================================================================================
`define LAGARTOII_FREE_REGISTER_LIST_MODULE     lagartoII_core_free_reg_list
`define LAGARTOII_FRL_FIFO_MODULE               lagartoII_core_free_reg_list_fifo
//===============================================================================================
//  Rename Unit
//===============================================================================================
`define LAGARTOII_RENAMING_MODULE               lagartoII_core_rename_unit
`define LAGARTOII_RENAMING_ZREF_MODULE          lagartoII_core_rename_unit_zref
`define LAGARTOII_RENAMING_WR_MPORT_MODULE      lagartoII_core_rename_mport_wr
`define LAGARTOII_RENAMING_RAT_MODULE           lagartoII_core_rename_rat
`define LAGARTOII_RENAMING_TD_MODULE            lagartoII_core_rename_true_dep
`define LAGARTOII_RENAMING_TD_COMP_MODULE       lagartoII_core_rename_true_dep_comp
`define LAGARTOII_RENAMING_TD_SEL_MODULE        lagartoII_core_rename_true_dep_sel
`define LAGARTOII_RENAMING_EOD_MODULE           lagartoII_core_rename_early_old_dest
`define LAGARTOII_RENAMING_EOD_COMP_MODULE      lagartoII_core_rename_early_old_dest_comp
`define LAGARTOII_RENAMING_EOD_SEL_MODULE       lagartoII_core_rename_early_old_dest_sel
//===============================================================================================
//  Mapper Dispatch
//===============================================================================================
`define LAGARTOII_MAPPER_MODULE                 lagartoII_core_mapper

`define LAGARTOII_MAPPER_INTQ_MODULE            lagartoII_core_mapper_int
`define LAGARTOII_MAPPER_INTQ_HWORD_MODULE      lagartoII_core_mapper_hword
`define LAGARTOII_MAPPER_INTQ_LWORD_MODULE      lagartoII_core_mapper_lword

`define LAGARTOII_MAPPER_MEMQ_MODULE            lagartoII_core_mapper_mem
`define LAGARTOII_MAPPER_MEMQ_HWORD_MODULE      lagartoII_core_mapper_mem_hword
`define LAGARTOII_MAPPER_MEMQ_LWORD_MODULE      lagartoII_core_mapper_mem_lword

`define LAGARTOII_MAPPER_CSRQ_MODULE            lagartoII_core_mapper_csr
`define LAGARTOII_MAPPER_CSRQ_WORD              lagartoII_core_mapper_csrq_word
//===============================================================================================
//  Integer Instruction Queue
//===============================================================================================
`define LAGARTOII_INTQ_MODULE                   lagartoII_core_intq
`define LAGARTOII_INTQ_ALLOCATION_MODULE        lagartoII_core_intq_allocation
`define LAGARTOII_INTQ_DATA_ASSIGNATION_MODULE  lagartoII_core_intq_data_assignation
`define LAGARTOII_INTQ_BMP_MODULE               lagartoII_core_intq_block_mapping_table

`define LAGARTOII_QUEUE_BMP_MODULE              lagartoII_core_queue_bmp

`define LAGARTOII_INTQ_ASQ_MODULE               lagartoII_core_intq_available_slots_queue
`define LAGARTOII_INTQ_WAKEUP_MODULE            lagartoII_core_intq_wakeup
`define LAGARTOII_INTQ_CAM_MODULE               lagartoII_core_intq_cam
`define LAGARTOII_INTQ_PAYLOAD_MODULE           lagartoII_core_intq_payload
`define LAGARTOII_INTQ_PRIORITY_L1_MODULE       lagartoII_core_intq_priority_l1
`define LAGARTOII_INTQ_PRIORITY_L2_MODULE       lagartoII_core_intq_priority_l2
`define LAGARTOII_INTQ_DEMUX_4TO2_MODULE        lagartoII_core_intq_demux_4to2
//===============================================================================================
//  Memory Instruction Queue
//===============================================================================================
`define LAGARTOII_MEMQ_MODULE                   lagartoII_core_memq
`define LAGARTOII_MEMQ_ALLOCATION_MODULE        lagartoII_core_memq_allocation
`define LAGARTOII_MEMQ_DATA_ASSIGNATION_MODULE  lagartoII_core_memq_data_assignation
`define LAGARTOII_MEMQ_BMP_MODULE               lagartoII_core_memq_block_mapping_table
`define LAGARTOII_MEMQ_ASQ_MODULE               lagartoII_core_memq_available_slots_queue
`define LAGARTOII_MEMQ_WAKEUP_LINE_MODULE       lagartoII_core_memq_wakeup_line
`define LAGARTOII_MEMQ_WAKEUP_MODULE            lagartoII_core_memq_wakeup
`define LAGARTOII_MEMQ_CAM_MODULE               lagartoII_core_memq_cam
`define LAGARTOII_MEMQ_PAYLOAD_MODULE           lagartoII_core_memq_payload
`define LAGARTOII_MEMQ_PRIORITY_MODULE          lagartoII_core_memq_priority
//===============================================================================================
//  CSR Queue
//===============================================================================================
`define LAGARTOII_CSRQ_MODULE                   lagartoII_core_csrq
`define LAGARTOII_CSRQ_ALLOCATION_MODULE        lagartoII_core_csrq_allocation
`define LAGARTOII_CSRQ_DATA_ASSIGNATION_MODULE  lagartoII_core_csrq_data_assignation
`define LAGARTOII_CSRQ_BMP_MODULE               lagartoII_core_csrq_block_mapping_table
`define LAGARTOII_CSRQ_ASQ_MODULE               lagartoII_core_csrq_available_slots_queue
`define LAGARTOII_CSRQ_WAKEUP_LINE_MODULE       lagartoII_core_csrq_wakeup_line
`define LAGARTOII_CSRQ_WAKEUP_MODULE            lagartoII_core_csrq_wakeup
`define LAGARTOII_CSRQ_CAM_MODULE               lagartoII_core_csrq_cam
`define LAGARTOII_CSRQ_PAYLOAD_MODULE           lagartoII_core_csrq_payload
`define LAGARTOII_CSRQ_PRIORITY_MODULE          lagartoII_core_csrq_priority
//===============================================================================================
//  Register File
//===============================================================================================
`define LAGARTOII_RDYVEC_MODULE                 lagartoII_core_reg_file_rdyvec
`define LAGARTOII_REGFILE_MODULE                lagartoII_core_reg_file
`define LAGARTOII_REGFILE_BYPASSING_MODULE      lagartoII_core_reg_file_bypassign
//===============================================================================================
//  Execution
//===============================================================================================
`define LAGARTOII_EXECUTE_MODULE                lagartoII_core_execute
`define LAGARTOII_EXECUTE_FU_ASSIGN_MODULE      lagartoII_core_execute_fu_assignment
`define LAGARTOII_EXECUTE_FU_MODULE             lagartoII_core_execute_fu
`define LAGARTOII_EXECUTE_FU_OPERATION_MODULE   lagartoII_core_execute_fu_operation
`define LAGARTOII_EXECUTE_FU_ADDER_MODULE       lagartoII_core_execute_fu_adder
`define LAGARTOII_EXECUTE_FU_MULTIPLIER_MODULE  lagartoII_core_execute_fu_multiplier
`define LAGARTOII_EXECUTE_FU_LOGICAL_MODULE     lagartoII_core_execute_fu_logic
`define LAGARTOII_EXECUTE_FU_SHIFTER_MODULE     lagartoII_core_execute_fu_shifter
`define LAGARTOII_EXECUTE_FU_COMP_MODULE        lagartoII_core_execute_fu_comparison
`define LAGARTOII_EXECUTE_FU_BDU_MODULE         lagartoII_core_execute_fu_bdu

`define LAGARTOII_EXECUTE_BYPASSING_MODULE      lagartoII_core_execute_bypassing_logic
//===============================================================================================
//  Memory Access
//===============================================================================================
`define LAGARTOII_MEMACCESS_MANAGER_MODULE      lagartoII_core_memaccess_manager
`define LAGARTOII_MEMACCESS_AGU_MODULE          lagartoII_core_memaccess_agu
//===============================================================================================
//  Reorder Buffer
//===============================================================================================
`define LAGARTOII_ROB_CNTRL_MODULE              lagartoII_core_rob_cntrl
`define LAGARTOII_ROB_STATUS_MODULE             lagartoII_core_rob_status
`define LAGARTOII_ROB_RECOVERY_MODULE           lagartoII_core_rob_recovery

`define LAGARTOII_ROBVEC_NONSPEC_MODULE         lagartoII_core_rob_nonspec
`define LAGARTOII_ROBVEC_BRANCH_MODULE          lagartoII_core_rob_branch
`define LAGARTOII_ROBVEC_PDEST_MODULE           lagartoII_core_rob_pdest
`define LAGARTOII_ROBVEC_ODEST_MODULE           lagartoII_core_rob_odest
`define LAGARTOII_ROBVEC_PC_MODULE              lagartoII_core_rob_pc
`define LAGARTOII_ROBVEC_DISPATCH_MODULE        lagartoII_core_rob_dispatch

`define LAGARTOII_ROBVEC_ISSUE_MODULE           lagartoII_core_rob_issue
`define LAGARTOII_ROBVEC_EXECUTE_MODULE         lagartoII_core_rob_execute

`define LAGARTOII_ROBVEC_DMEM_MODULE            lagartoII_core_rob_dmem

`define LAGARTOII_BROB_MODULE                   lagartoII_core_brob
//===============================================================================================
//  Shadow Mechanism
//===============================================================================================
`define LAGARTOII_BACKUP_BIT_MODULE             lagartoII_core_srm_backup_rec_bit

`define LAGARTOII_RNM_SRM_REGISTER_MAP_MODULE   lagartoII_core_rename_shadow_reg_map
`define LAGARTOII_RNM_SRM_BKUP_WORD_MODULE      lagartoII_core_rename_srm_backup_rec_word

`define LAGARTOII_FRL_SRM_MODULE                lagartoII_core_free_reg_list_shadow_reg_map
`define LAGARTOII_FRL_SRM_BKUP_WORD_MODULE      lagartoII_core_frl_srm_backup_rec_word
`define LAGARTOII_FRL_SRM_BKUP_PTR_MODULE       lagartoII_core_frl_pointer_srm_backup_rec_word
`define LAGARTOII_FRL_SRM_BKUP_STATUS_MODULE    lagartoII_core_frl_status_srm_backup_rec_word

`define LAGARTOII_RDYVEC_SRM_MODULE             lagartoII_core_rdyvec_shadow_reg_map
`define LAGARTOII_RDYVEC_SRM_BKUP_PAGE_MODULE   lagartoII_core_rdyvec_shadow_page
`define LAGARTOII_RDYVEC_SRM_SEL_PAGE_MODULE    lagartoII_core_rdyvec_shadow_page_sel
//===============================================================================================
//  FUNCTIONAL UNITS
//===============================================================================================
`define SHIFTER128_MODULE                       shifter128b
`define SHIFTER128_PRESHIFT_MODULE              shifter128b_preshift
`define SHIFTER128_PERMUT_MODULE                shifter128b_permut

`define SHIFTER128_ROTATOR_MODULE               shifter128b_right_rotator_muxes
`define SHIFTER128_ROTATOR_MUX_MODULE           shifter128b_rotator_mux
`define SHIFTER128_MASK_MODULE                  shifter128b_mask
`define SHIFTER128_MASK_GENERATOR_MODULE        shifter128b_mask_generator
`define SHIFTER128_MASK_PERMUT_MODULE           shifter128b_mask_permut

`define SHIFTER128_MASK_INVERTER_MODULE         shifter128b_mask_inverter
`define SHIFTER128_MASK_RESULT_MODULE           shifter128b_mask_result