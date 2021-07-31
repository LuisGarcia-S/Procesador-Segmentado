//**********************************************************************************************//

//  TITLE:                  LAGARTO II CONSTANTS FILE                                           //
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

`include "lagartoII_config.vh"

//======================================================================
//  Fetch
//======================================================================
`define INTQ_FETCHED                 1
`define FETCH_WIDTH                 [`INTQ_FETCHED-1:0]
`define PC_INCREMENT                `INTQ_FETCHED*4

`define ADDR_WIDTH                  40
`define ADDR_ZERO                   40'b0
`define ADDR                        [`ADDR_WIDTH-1:0]

`define INDEX_MSB                   12
`define ADDR_EXT                    `ADDR_WIDTH - `INDEX_MSB
`define BrOFF_EXT                   `ADDR_WIDTH - `INDEX_MSB - 1

`define CACHE_LINE_WIDTH            128
`define CACHE_LINE_ZERO             128'b0
`define CACHE_LINE                  [`CACHE_LINE_WIDTH-1:0]

`define WORD_WIDTH                  32
`define WORD_ZERO                   `WORD_WIDTH 'b0
`define WORD                        [`WORD_WIDTH-1:0]

`define DWORD_WIDTH                 2*`WORD_WIDTH
`define DWORD_ZERO                  `DWORD_WIDTH 'b0
`define DWORD                       [`DWORD_WIDTH-1:0]

`define VPN_WIDTH                   28
`define VPN                         [`VPN_WIDTH-1:0]
//======================================================================
//  Branch Prediction Unit
//======================================================================
`define BrINDEX_WIDTH               10
`define BrINDEX_ZERO                10'b0
`define BrINDEX                     [`BrINDEX_WIDTH-1:0]

`define BrOFFSET_WIDTH              40
`define BrOFFSET_ZERO               40'b0
`define BrOFFSET_INCREMENT          40'd4

`define BrTAG_WIDTH                 20
`define BrTAG                       [`BrTAG_WIDTH-1:0]

`define CONFIDENCE                  [1:0]
//======================================================================
//  Jump Module
//======================================================================
`define MSB_WIDTH                   4
`define MSB_ZERO                    4'b0
`define MSB                         [`MSB_WIDTH-1:0]

`define JUMP_INDEX_WIDTH            26
`define JUMP_INDEX_ZERO             25'b0
`define JUMP_INDEX                  [`JUMP_INDEX_WIDTH-1:0]
//======================================================================
//  Decode
//======================================================================
//Instruction Fields
`define vADDR_WIDTH                 5
`define vADDR_ZERO                  5'b0
`define vADDR                       [`vADDR_WIDTH-1:0]

`define OPCODE_WIDTH                7
`define OPCODE_ZERO                 7'b0
`define OPCODE                      [`OPCODE_WIDTH-1:0]

`define FUNC3_WIDTH                 3
`define FUNC3_ZERO                  3'b0
`define FUNC3                       [`FUNC3_WIDTH-1:0]

`define FUNC5_WIDTH                 5
`define FUNC5_ZERO                  5'b0
`define FUNC5                       [`FUNC5_WIDTH-1:0]

`define FUNC7_WIDTH                 7
`define FUNC7_ZERO                  7'b0
`define FUNC7                       [`FUNC7_WIDTH-1:0]

`define RS1_WIDTH                   5
`define RS1_ZERO                    5'b0
`define RS1                         [`RS1_WIDTH-1:0]

`define CLASS_WIDTH                 14
`define CLASS_ZERO                  14'b0
`define CLASS                       [`CLASS_WIDTH-1:0]
//----------------------------------------------------------------------
//Integer Control Vectors
`define OPVEC_WIDTH                 18
`define OPVEC_ZERO                  18'b0
`define OPVEC                       [`OPVEC_WIDTH-1:0]

`define EXEPATH_DEPTH               5
`define EXEPATH_ZERO                5'b0
`define EXEPATH                     [`EXEPATH_DEPTH-1:0]

`define CPUVEC_WIDTH                13
`define CPUVEC_ZERO                 13'b0
`define CPUVEC                      [`CPUVEC_WIDTH-1:0]
//----------------------------------------------------------------------
`define RNMVEC_WIDTH                3
`define RNMVEC_ZERO                 3'b0
`define RNMVEC                      [`RNMVEC_WIDTH-1:0]
//----------------------------------------------------------------------
`define RESVEC_WIDTH                7
`define RESVEC_ZERO                 7'b0
`define RESVEC                      [`RESVEC_WIDTH-1:0]

`define ADDER_BIT                   0
`define MULT_BIT                    1
`define LOGIC_BIT                   2
`define SHFT_BIT                    3
`define SLT_BIT                     4
`define BRANCH_BIT                  5
`define IMM_BIT                     6
//----------------------------------------------------------------------
`define SYSVEC_WIDTH                6
`define SYSVEC_ZERO                 6'b0
`define SYSVEC                      [`SYSVEC_WIDTH-1:0]

`define AMO_WIDTH                   2
`define AMO_ZERO                    2'b0
`define AMO                         [`AMO_WIDTH-1:0]

`define CTRLVECTORS_LENGHT          `OPVEC_WIDTH +`RNMVEC_WIDTH +`RESVEC_WIDTH +`SYSVEC_WIDTH
`define CTRLVECTORS                 [`CTRLVECTORS_LENGHT-1:0]
`define CTRLVECTORS_VALID           [`CTRLVECTORS_LENGHT:0]

`define OPVEC_SEGMENT               `OPVEC_WIDTH + `RNMVEC_WIDTH +`RESVEC_WIDTH +`SYSVEC_WIDTH
`define RNMVEC_SEGMENT              `RNMVEC_WIDTH +`RESVEC_WIDTH +`SYSVEC_WIDTH
`define RESVEC_SEGMENT              `RESVEC_WIDTH +`SYSVEC_WIDTH
//----------------------------------------------------------------------
//CSR and Exceptions
`define CSR_WIDTH                   12
`define CSR_ZERO                    12'b0
`define CSR                         [`CSR_WIDTH-1:0]

`define CSR_F2_WIDTH                2
`define CSR_F2                      [`CSR_F2_WIDTH-1:0]

`define CSR_IMM_WIDTH               5
`define CSR_IMM                     [`CSR_IMM_WIDTH-1:0]

`define XCPT_CAUSE_WIDTH            64
`define XCPT_CAUSE_ZERO             64'b0
`define XCPT_CAUSE                  [`XCPT_CAUSE_WIDTH-1:0]

`define XCPT_CODE_WIDTH             32
`define XCPT_CODE_ZERO              32'b0
`define XCPT_CODE                   [`XCPT_CODE_WIDTH-1:0]

`define PRIV_LVL_WIDTH              3
`define PRIV_LVL                    [`PRIV_LVL_WIDTH-1:0]

`define SYS_BIT                     13
`define WAIT_PIPELINE_BIT           3
`define WAIT_INTERRUPT_BIT          4
`define CSR_BIT                     9
`define CALL_BIT                    8
`define BREAK_BIT                   7
`define TRAP_BIT                    2
`define RET_BIT                     6
`define CLASSES                     11
//----------------------------------------------------------------------
//Format Fields

//----------------------------------------------------------------------
//Floating Point Control Vectors

//======================================================================
//  Free Register List
//======================================================================
`define FRL_WORD_WIDTH              7
`define FRL_WORD                    [`FRL_WORD_WIDTH-1:0]

`define FRL_ADDR_WIDTH              7
`define FRL_ADDR                    [`FRL_ADDR_WIDTH-1:0]

`define FRL_DEPTH                   128
`define FRL                         [0:`FRL_DEPTH-1]

`define FRL_STATUS_ZERO             8'b0
`define FRL_STATUS                  [`FRL_ADDR_WIDTH:0]

`define FRL_ISSUE_WITH              2
`define FRL_ISSUE_ZERO              2'b0
`define FRL_ISSUE                   [`FRL_ISSUE_WITH-1:0]
//======================================================================
//  Rename Unit
//======================================================================
`define pADDR_WIDTH                 7
`define pADDR_ZERO                  7'b0
`define pADDR                       [`pADDR_WIDTH-1:0]

`define RAT_WORD_WIDTH              7                                   //data width stored in RAT
`define RAT_WORD                    [`RAT_WORD_WIDTH-1:0]

`define RAT_DEPTH                   32                                  //Number of virtual registers
`define RAT                         [0:`RAT_DEPTH-1]

`define ZERO_REF_LENGTH             6
`define ZERO_REF                    [`ZERO_REF_LENGTH-1:0]
//======================================================================
//  Mapper Dispatch
//======================================================================
`define DISPATCH_WIDTH              2
`define DISP                        [`DISPATCH_WIDTH-1:0]

`define INTQ_DISPATCH_WIDTH         2
`define INTQ_ACTIVE_ZERO            2'b0
`define INTQ_ACTIVE                 [`INTQ_DISPATCH_WIDTH-1:0]

`define INTQ_LWORD_WIDTH            12
`define INTQ_LWORD_ZERO             12'b0
`define INTQ_LWORD                  [`INTQ_LWORD_WIDTH-1:0]

`define INTQ_HWORD_WIDTH            `BrROB_ADDR_WIDTH + `ROB_ADDR_WIDTH + `pADDR_WIDTH + `pADDR_WIDTH + `pADDR_WIDTH + `CPUVEC_WIDTH + `RESVEC_WIDTH + `OPCODE_WIDTH + `FUNC3_WIDTH
`define INTQ_HWORD_ZERO             57'b0
`define INTQ_HWORD                  [`INTQ_HWORD_WIDTH-1:0]

`define INTQ_WORD_WIDTH             `INTQ_HWORD_WIDTH + `INTQ_LWORD_WIDTH
`define INTQ_WORD_ZERO              69'b0
`define INTQ_WORD                   [`INTQ_WORD_WIDTH-1:0]

`define INTQ_INDEX_WIDTH            12
`define INTQ_INDEX_ZERO             12'b0
`define INTQ_INDEX                  [`INTQ_INDEX_WIDTH-1:0]
//----------------------------------------------------------------------
`define INTQ_BROB_ENTRY             `BrROB_ADDR_WIDTH + `INTQ_ROB_ENTRY
`define INTQ_ROB_ENTRY              `ROB_ADDR_WIDTH + `INTQ_PSRC1
`define INTQ_PSRC1                  `pADDR_WIDTH + `INTQ_PSRC2
`define INTQ_PSRC2                  `pADDR_WIDTH + `INTQ_PDEST
`define INTQ_PDEST                  `pADDR_WIDTH + `INTQ_CPUVEC
`define INTQ_CPUVEC                 `CPUVEC_WIDTH + `INTQ_RESVEC
`define INTQ_RESVEC                 `RESVEC_WIDTH + `INTQ_EXECODE0
`define INTQ_EXECODE0               `OPCODE_WIDTH + `INTQ_EXECODE1
`define INTQ_EXECODE1               `FUNC3_WIDTH + `INTQ_LWORD_WIDTH
//----------------------------------------------------------------------
`define MEMQ_DISPATCH_WIDTH         2
`define MEMQ_ACTIVE_ZERO            2'b0
`define MEMQ_ACTIVE                 [`MEMQ_DISPATCH_WIDTH-1:0]

`define MEMQ_LWORD_WIDTH            12
`define MEMQ_LWORD_ZERO             12'b0
`define MEMQ_LWORD                  [`MEMQ_LWORD_WIDTH-1:0]

`define MEMQ_HWORD_WIDTH            `ROB_ADDR_WIDTH +`pADDR_WIDTH + `pADDR_WIDTH + `pADDR_WIDTH + `SYSVEC_WIDTH + `AMO_WIDTH + `OPCODE_WIDTH + `FUNC3_WIDTH
`define MEMQ_HWORD_ZERO             47'b0
`define MEMQ_HWORD                  [`MEMQ_HWORD_WIDTH-1:0]

`define MEMQ_WORD_WIDTH             `MEMQ_HWORD_WIDTH + `MEMQ_LWORD_WIDTH
`define MEMQ_WORD_ZERO              58'b0
`define MEMQ_WORD                   [`MEMQ_WORD_WIDTH-1:0]

`define MEMQ_INDEX_WIDTH            12
`define MEMQ_INDEX_ZERO             12'b0
`define MEMQ_INDEX                  [`MEMQ_INDEX_WIDTH-1:0]
//----------------------------------------------------------------------
`define MEMQ_ROB_ENTRY              `ROB_ADDR_WIDTH + `MEMQ_PSRC1
`define MEMQ_PSRC1                  `pADDR_WIDTH + `MEMQ_PSRC2
`define MEMQ_PSRC2                  `pADDR_WIDTH + `SYSVEC_WIDTH + `AMO_WIDTH + `OPCODE_WIDTH + `FUNC3_WIDTH + `MEMQ_LWORD_WIDTH
//----------------------------------------------------------------------
`define CSRQ_DISPATCH_WIDTH         2
`define CSRQ_ACTIVE_ZERO            2'b0
`define CSRQ_ACTIVE                 [`CSRQ_DISPATCH_WIDTH-1:0]

`define CSRQ_WORD_WIDTH             `ROB_ADDR_WIDTH +`pADDR_WIDTH + `pADDR_WIDTH + `CSR_WIDTH + `FUNC3_WIDTH + `XCPT_CAUSE_WIDTH + `WORD_WIDTH
`define CSRQ_WORD_ZERO              132'b0
`define CSRQ_WORD		               [`CSRQ_WORD_WIDTH-1:0]

`define CSRQ_INDEX_WIDTH            12
`define CSRQ_INDEX_ZERO             12'b0
`define CSRQ_INDEX                  [`CSRQ_INDEX_WIDTH-1:0]
//----------------------------------------------------------------------
`define CSRQ_ROB_ENTRY              `ROB_ADDR_WIDTH + `CSRQ_PSRC1
`define CSRQ_PSRC1                  `pADDR_WIDTH + `pADDR_WIDTH + `CSRQ_ADDR_WIDTH + `FUNC3_WIDTH + `XCPT_CAUSE_WIDTH + `WORD_WIDTH
//======================================================================
//  Integer Instruction Queue
//======================================================================
//                                                    INTQ_WORD                                                 
//    [74:70]      [69:63]   [62:56]  [55:49]  [48:42]   [41:29]  [28:22]   [21:15]    [14:12]      [11:0]      
//|------------------------------------------------------------------------------------------------------------|
//| BrROB ENTRY | ROB ENTRY | PSrc1  | PSrc2  | PDest  | CPUVEC  | RESVEC | EXECODE0 | EXECODE1 |   INDEX12    |
//|---------------------------------------------------------------------------------------------|--------------|
//|   5-bits    |  7-bits   | 7-bits | 7-bits | 7-bits | 13-bits | 7-bits |  7-bits  |  3-bits  |    12-bits   |
//|---------------------------------------------------------------------------------------------|--------------|
`define INTQ_iFMT_AMOUNT            2
`define INTQ_iFMT                   [`INTQ_iFMT_AMOUNT-1:0]

`define INTQ_BLOCKS_NUMBER          4
`define INTQ_BLOCKS_ZERO            4'b0
`define INTQ_BLOCKS                 [`INTQ_BLOCKS_NUMBER-1:0]

`define INTQ_ADDR_WIDTH             3
`define INTQ_ADDR                   [`INTQ_ADDR_WIDTH-1:0]
//----------------------------------------------------------------------
`define INTQ_ASQ_ADDR_WIDTH         3
`define INTQ_ASQ_ADDR_ZERO          3'b0
`define INTQ_ASQ_ADDR               [`INTQ_ASQ_ADDR_WIDTH-1:0]

`define INTQ_ASQ_WORD_WIDTH         3                                       //word width stored in ASQ + dirty bit
`define INTQ_ASQ_WORD_ZERO          3'b0                                    //word width stored in ASQ + dirty bit
`define INTQ_ASQ_WORD               [`INTQ_ASQ_WORD_WIDTH-1:0]              //IQ address

`define INTQ_ASQ_DEPTH              8                                       //8 slots
`define INTQ_ASQ                    [0:`INTQ_ASQ_DEPTH-1]                   //Meory depth

`define INTQ_ASQ_LENGTH             [`INTQ_ASQ_DEPTH-1:0]
`define INTQ_ASQ_STATUS             [`INTQ_ASQ_ADDR_WIDTH:0]                //status counter
//----------------------------------------------------------------------
`define INTQ_CAM_ADDR_WIDTH         8
`define INTQ_CAM_ADDR_ZERO          8'b0
`define INTQ_CAM_ADDR               [`INTQ_CAM_ADDR_WIDTH-1:0]

`define INTQ_CAM_WORD_WIDTH         21                                      //PSrc1 | PSrc2 | RESVEC
`define INTQ_CAM_WORD_ZERO          21'b0
`define INTQ_CAM_WORD               [`INTQ_CAM_WORD_WIDTH-1:0]

`define INTQ_CAM_DEPTH              8
`define INTQ_CAM_ZERO               8'b0
`define INTQ_CAM                    [0:`INTQ_CAM_DEPTH-1]
//----------------------------------------------------------------------
`define INTQ_PAYLOAD_DEPTH          8                                       //8 slots
`define INTQ_PAYLOAD                [0:`INTQ_ASQ_DEPTH-1]                   //Meory depth
//----------------------------------------------------------------------
`define QUEUE_BLOCKS_NUM            4
`define QUEUE_BLOCKS                [`QUEUE_BLOCKS_NUM-1:0]

`define QUEUE_BMT_ZERO              128'b0
//======================================================================
//  Memory Instruction Queue
//======================================================================
//                                             MEMQ_WORD                                            
//   [57:51]   [50:44]  [43:37]  [36:30]  [29:24]    [23:22]    [21:15]    [14:12]       [11:0]     
//|---------------------------------------------------------------------------------|--------------|
//| ROB ENTRY | PSrc1  | PSrc2  | PDest  | SYSVEC | AMO-AQ,RL | EXECODE0 | EXECODE1 |   INDEX12    |
//|---------------------------------------------------------------------------------|--------------|
//|  7-bits   | 7-bits | 7-bits | 7-bits | 6-bits |  2-bits   |  7-bits  |  3-bits  |    12-bits   |
//|---------------------------------------------------------------------------------|--------------|
`define MEMQ_DEPTH                  32
`define MEMQ                        [`MEMQ_DEPTH-1:0]

`define MEM_iFMT_AMOUNT             4
`define MEM_iFMT                    [`MEMQ_iFMT_AMOUNT-1:0]

`define MEMQ_BLOCKS_NUMBER          4
`define MEMQ_BLOCKS_ZERO            4'b00
`define MEMQ_BLOCKS                 [`MEMQ_BLOCKS_NUMBER-1:0]

`define MEMQ_ADDR_WIDTH             3
`define MEMQ_ADDR_ZERO              3'b000
`define MEMQ_ADDR                   [`MEMQ_ADDR_WIDTH-1:0]

`define MEMQ_STATUS_WIDTH           6
`define MEMQ_STATUS                 [`MEMQ_STATUS_WIDTH:0]
//------------------------------------------------------
`define MEMQ_ASQ_ADDR_WIDTH         3
`define MEMQ_ASQ_ADDR_ZERO          3'b0
`define MEMQ_ASQ_ADDR               [`MEMQ_ASQ_ADDR_WIDTH-1:0]

`define MEMQ_ASQ_WORD_WIDTH         3
`define MEMQ_ASQ_WORD               [`MEMQ_ASQ_WORD_WIDTH-1:0]

`define MEMQ_ASQ_DEPTH              8
`define MEMQ_ASQ                    [0:`MEMQ_ASQ_DEPTH-1]

`define MEMQ_ASQ_LENGTH             [`MEMQ_ASQ_DEPTH-1:0]
`define MEMQ_ASQ_STATUS             [`MEMQ_ASQ_ADDR_WIDTH:0]
//------------------------------------------------------
`define MEMQ_CAM_ADDR_WIDTH         8
`define MEMQ_CAM_ADDR_ZERO          8'b0
`define MEMQ_CAM_ADDR               [`MEMQ_CAM_ADDR_WIDTH-1:0]
    
`define MEMQ_CAM_WORD_WIDTH         14
`define MEMQ_CAM_WORD_ZERO          14'b0
`define MEMQ_CAM_WORD               [`MEMQ_CAM_WORD_WIDTH-1:0]

`define MEMQ_CAM_DEPTH              8
`define MEMQ_CAM_ZERO               8'b0
`define MEMQ_CAM                    [0:`MEMQ_CAM_DEPTH-1]
//------------------------------------------------------
`define MEMQ_PAYLOAD_DEPTH          8
`define MEMQ_PAYLOAD                [0:`MEMQ_ASQ_DEPTH-1]
//------------------------------------------------------
`define MEMQ_FU_STATUS_WIDTH        1
`define MEMQ_FU_STATUS_ZERO         1'b0
`define MEMQ_FU_STATUS              [`MEMQ_FU_STATUS_WIDTH-1:0]
//======================================================================
//  CSR Instruction Queue
//======================================================================
//                              CSRQ_WORD                                
//  [131:125] [124:118] [117:111] [110:99]  [98:96]   [95:32]    [31:0]  
//|---------------------------------------------------------------------|
//| ROB ENTRY | PSrc1  | PDest  | CSR ADDR |  CMD   |  CAUSE  | INDEX32 |
//|---------------------------------------------------------------------|
//|  7-bits   | 7-bits | 7-bits | 12-bits  | 3-bits | 64-bits | 32-bits |
//|---------------------------------------------------------------------|
`define CSRQ_DEPTH                  32
`define CSRQ                        [`CSRQ_DEPTH-1:0]

`define CSRQ_BLOCKS_NUMBER          4
`define CSRQ_BLOCKS_ZERO            4'b00
`define CSRQ_BLOCKS                 [`CSRQ_BLOCKS_NUMBER-1:0]

`define CSRQ_ADDR_WIDTH             3
`define CSRQ_ADDR_ZERO              3'b000
`define CSRQ_ADDR                   [`CSRQ_ADDR_WIDTH-1:0]

`define CSRQ_STATUS_WIDTH           6
`define CSRQ_STATUS                 [`CSRQ_STATUS_WIDTH:0]
//------------------------------------------------------
`define CSRQ_ASQ_ADDR_WIDTH         3
`define CSRQ_ASQ_ADDR_ZERO          3'b0
`define CSRQ_ASQ_ADDR               [`CSRQ_ASQ_ADDR_WIDTH-1:0]

`define CSRQ_ASQ_WORD_WIDTH         3
`define CSRQ_ASQ_WORD               [`CSRQ_ASQ_WORD_WIDTH-1:0]

`define CSRQ_ASQ_DEPTH              8
`define CSRQ_ASQ                    [0:`CSRQ_ASQ_DEPTH-1]

`define CSRQ_ASQ_LENGTH             [`CSRQ_ASQ_DEPTH-1:0]
`define CSRQ_ASQ_STATUS             [`CSRQ_ASQ_ADDR_WIDTH:0]
//------------------------------------------------------
`define CSRQ_CAM_ADDR_WIDTH         8
`define CSRQ_CAM_ADDR_ZERO          8'b0
`define CSRQ_CAM_ADDR               [`CSRQ_CAM_ADDR_WIDTH-1:0]
    
`define CSRQ_CAM_WORD_WIDTH         7
`define CSRQ_CAM_WORD_ZERO          7'b0
`define CSRQ_CAM_WORD               [`CSRQ_CAM_WORD_WIDTH-1:0]

`define CSRQ_CAM_DEPTH              8
`define CSRQ_CAM_ZERO                8'b0
`define CSRQ_CAM                    [0:`CSRQ_CAM_DEPTH-1] 
//------------------------------------------------------
`define CSRQ_PAYLOAD_DEPTH          8
`define CSRQ_PAYLOAD                [0:`CSRQ_ASQ_DEPTH-1]
//------------------------------------------------------
`define CSRQ_FU_STATUS_WIDTH        1
`define CSRQ_FU_STATUS_ZERO         1'b0
`define CSRQ_FU_STATUS              [`CSRQ_FU_STATUS_WIDTH-1:0]
//======================================================================
//  Issue
//======================================================================
`define ISSUE_WIDTH                 3
`define ISSUE                       [`ISSUE_WIDTH-1:0]
//======================================================================
//  Register File
//======================================================================
`define REGFILE_SWORD_WIDTH         32
`define REGFILE_SWORD_ZERO          32'b0
`define REGFILE_SWORD               [`REGFILE_SWORD_WIDTH-1:0]

//`define DWORD_WIDTH                 64
//`define DWORD_ZERO                  64'b0
//`define DWORD                       [`DWORD_WIDTH-1:0]

`define REGRDY_WIDTH                2
`define REGRDY                      [`REGFILE_WORD_WIDTH-1:0]

`define REGFILE_DEPTH               128
`define REGFILE                     [0:`REGFILE_DEPTH-1]

`define RDYVEC_ZEROS                127'b0
`define RDYVEC                      [0:`REGFILE_DEPTH-1]

`define REGFILE_WRPORTS_NUM         3
`define REGFILE_WRPORTS             [`REGFILE_WRPORTS_NUM-1:0]

`define REGFILE_RDPORTS_NUM         6
`define REGFILE_RDPORTS             [`REGFILE_RDPORTS_NUM-1:0]

// Table pointing to which bank holds live register value
`define LVT_ENTRY_WIDTH             1
`define LVT_ENTRY                   [`LVT_ENTRY_WIDTH-1:0]
// One entry for each register
`define LVT_DEPTH                   (1 << `MEMQ_ADDR_WIDTH)
`define LVT                         [`LVT_DEPTH-1:0]
//======================================================================
//  Execution
//======================================================================
`define BYTE_WIDTH                  8
`define BYTE_ZERO                   8'b0
`define BYTE                        [`BYTE_WIDTH-1:0]

`define RESULT_SINGLE_WIDTH         33
`define RESULT_SINGLE_ZERO          33'b0
`define RESULT_SINGLE               [`RESULT_SINGLE_WIDTH-1:0]

`define RESULT_DOUBLE_WIDTH         65
`define RESULT_DOUBLE_ZERO          65'b0
`define RESULT_DOUBLE               [`RESULT_DOUBLE_WIDTH-1:0]

`define OPERATOR_WIDTH              64
`define OPERATOR_ZERO               64'b0
`define OPERATOR                    [`DWORD_WIDTH-1:0]

`define INTQ_RES_STATUS_WIDTH       6
`define INTQ_RES_STATUS             [`INTQ_RES_STATUS_WIDTH-1:0]

`define INTQ_FU_STATUS_WIDTH        2
`define INTQ_FU_STATUS_ZERO         2'b0
`define INTQ_FU_STATUS              [`INTQ_FU_STATUS_WIDTH-1:0]

`define INTQ_FU_AVAILABLE_WITH      2
`define INTQ_FU_AVAILABLE_ZERO      2'b0
`define INTQ_FU_AVAILABLE           [`INTQ_FU_AVAILABLE_WITH-1:0]

`define INTQ_FU_OPERATION_WITH      6
`define INTQ_FU_OPERATION_ZERO      6'b0
`define INTQ_FU_OPERATION           [`INTQ_FU_OPERATION_WITH-1:0]
//-----------------------------
// SHIFTER
//-----------------------------
`define SHFT_DWORD_WIDTH            128
`define SHFT_DWORD                  [`SHFT_DWORD_WIDTH-1:0]

`define SHFT_DSHAM_WIDTH            7
`define SHFT_DSHAM                  [`SHFT_DSHAM_WIDTH-1:0]

`define SHFT_WORD_WIDTH             64
`define SHFT_WORD                   [`SHFT_WORD_WIDTH-1:0]

`define SHFT_SHAM_WIDTH             6
`define SHFT_SHAM                   [`SHFT_SHAM_WIDTH-1:0]

`define SHAM_MSB                    5

`define SHFT_HWORD_WIDTH            32
`define SHFT_HWORD                  [`SHFT_HWORD_WIDTH-1:0]

`define SHFT_HSHAM_WIDTH            5
`define SHFT_HSHAM                  [`SHFT_HSHAM_WIDTH-1:0]
//-----------------------------
// MULTIPLIER
//-----------------------------
`define MULT_WORD_WIDTH             128
`define MULT_WORD                   [`MULT_WORD_WIDTH-1:0]
//-----------------------------
// BYPASSING
//-----------------------------
`define BYPASSING_COMP_NUM          3
`define BYPASSING_COMP              [`BYPASSING_COMP_NUM-1:0]

`define FUNC_UNITS                  3
`define EXEAV                       [`FUNC_UNITS-1:0]
//======================================================================
//  Reorder Buffer
//======================================================================
`define ROB_ADDR_WIDTH              7
`define ROB_ADDR_ZERO               7'b0
`define ROB_ADDR                    [`ROB_ADDR_WIDTH-1:0]

`define ROB_POINTER_WIDTH           7
`define ROB_POINTER_ZERO            7'b0
`define ROB_POINTER_INC             7'd2
`define ROB_POINTER                 [`ROB_ADDR_WIDTH-1:0]

`define ROB_SATATUS_INC             8'd2
`define ROB_SATATUS_ZERO            8'b0

`define ROB_DEPTH                   128
`define ROB                         [0:`ROB_DEPTH-1]
`define ROB_VEC                     [`ROB_DEPTH-1:0]

`define ROB_STATUS                  [`ROB_ADDR_WIDTH:0]

`define ROBVEC_ADDR_WIDTH           6
`define ROBVEC_ADDR_ZERO            6'b0
`define ROBVEC_ADDR                 [`ROB_ADDR_WIDTH-1:0]

`define ROBVEC_DEPTH                128
`define ROBVEC                      [0:`ROB_DEPTH-1]

`define ROB_FLAG_WIDTH              1
`define ROB_FLAG                    [`ROB_FLAG_WIDTH-1:0]

//Branch
`define BrROB_DEPTH                 32
`define BrROB_ZERO                  32'b0
`define BrROB                       [0:`BrROB_DEPTH-1]
`define BrROB_VEC                   [`BrROB_DEPTH-1:0]

`define BrROB_ADDR_WIDTH            5
`define BrROB_ADDR_ZERO             5'b0
`define BrROB_ADDR                  [`BrROB_ADDR_WIDTH-1:0]

//Rename
`define ROB_RNM_WORD_WIDTH          7
`define ROB_RNM_WORD                [`ROB_RNM_WORD_WIDTH-1:0]

//Recovery
`define SHADOW_DEPTH                64
`define SHADOW                      [`SHADOW_DEPTH-1:0]

//Counters
`define ROB_COUNT_WIDTH             7
`define ROB_COUNT                   [`ROB_COUNT_WIDTH-1:0]
//======================================================================
//  Shadow Mechanism
//======================================================================
`define BACKUP_ADDR_WIDTH           7
`define BACKUP_ADDR                 [`BACKUP_ADDR_WIDTH-1:0]

`define RDYVEC_SHADOW_PAGES         32

`define RDYVEC_SHADOW               [`RDYVEC_SHADOW_PAGES-1:0]
`define RDYVEC_PAGES                [0:`RDYVEC_SHADOW_PAGES-1]

`define RDYVEC_WRPORTS              3
`define WRPORTS_VALID               [`RDYVEC_WRPORTS-1:0]
`define ENTRIES_COMPUTED            [0:`RDYVEC_WRPORTS-1]
//======================================================================
//  CSR
//======================================================================
`define CAUSE_WIDTH                 64
`define CAUSE_ZERO                  64'b0
`define CAUSE                       [`CAUSE_WIDTH-1:0]

`define MISALIGNED_FETCH            64'h0000000000000000
`define FAULT_FETCH                 64'h0000000000000001
`define ILLEGAL_INSTRUCTION         64'h0000000000000002
`define BREAKPOINT                  64'h0000000000000003
`define MISALIGNED_LOAD             64'h0000000000000004
`define FAULT_LOAD                  64'h0000000000000005
`define MISALIGNED_STORE            64'h0000000000000006
`define FAULT_STORE                 64'h0000000000000007
`define USER_ECALL                  64'h0000000000000008
`define SUPERVISOR_ECALL            64'h0000000000000009
`define HYPERVISOR_ECALL            64'h000000000000000A
`define MACHINE_ECALL               64'h000000000000000B
//======================================================================
//  Others
//======================================================================
`define LOW                         1'b0
`define HIGH                        1'b1
