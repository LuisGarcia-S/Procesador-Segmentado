`include "include/lagartoII_const.vh"

module CtrlModule (
	input		`OPCODE		instruction_i	,
	input					stall_i			,
	output					aluSrc_o		,
	output		[2:0]		memVector_o		,
	output		[1:0]		ALUOp_o			,
	output		[1:0]		WBackVector_o
	);
	
	wire		`OPCODE		opCode_w;
	assign	opCode_w	=	(!stall_i) ? instruction_i : 7'b1111111;
	
	reg 			[7:0]	FuncCat;		

	always @(*) begin
		case (opCode_w)
			7'b0010011:	FuncCat	<=	8'b10100010;//OP-IMM
			7'b0110011:	FuncCat	<= 	8'b00100010;//R-Type
			7'b0000011:	FuncCat	<= 	8'b11110000;//Load	
			7'b0100011:	FuncCat	<= 	8'b1X001000;//Store
			7'b1100011:	FuncCat	<= 	8'b0X000101;//Branch
			default:	FuncCat	<=	8'b00000000;
		endcase
	end
	
	assign aluSrc_o			=	FuncCat[7];		//Execution
	assign ALUOp_o			=	FuncCat[1:0];	//Execution
	
	assign WBackVector_o	=	{FuncCat[6],	//memToReg
								FuncCat[5]};	//regWrite

	assign memVector_o		=	{FuncCat[4],	//memRead
								FuncCat[3],		//memWrite
								FuncCat[2]};	//branchBit

endmodule