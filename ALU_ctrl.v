`include "include/lagartoII_const.vh"

module ALUCtrl(
	input		`FUNC3	func3_i,
	input				func7bit_i,
	input		[1:0]	aluOP_i,
	output reg	[3:0]	ALUCtrl_o
);

	always @(*)begin
		case (aluOP_i)
			2'b00:	ALUCtrl_o	<=	4'b0010;	//ld  or store
			2'b01:								//Branch
				case (func3_i)
					3'b000: ALUCtrl_o	<=	4'b0110;//Branch if equal
					3'b001: ALUCtrl_o	<=	4'b0101;//Branch if no equal
					default: ALUCtrl_o	<= 4'b111; 
				endcase
			2'b10:							//R-Type	
				case (func3_i)
					3'b000: ALUCtrl_o	<=	(func7bit_i == 1'b0) ? 4'b0010 : 4'b0110;// add or sub
					3'b001: ALUCtrl_o	<=	4'b0100;//SLL
					3'b010: ALUCtrl_o	<=	4'b0111;//SLT
					//3'b110: ALUCtrl_o	<=	4'b0001;//SLTU
					3'b111: ALUCtrl_o	<=	4'b0000;//and operation
					3'b110: ALUCtrl_o	<=	4'b0001;//or operation	
					3'b100: ALUCtrl_o	<=	4'b0011;//XOR
					default: ALUCtrl_o	<= 4'b111;
				endcase
			2'b11:							//I-Type	
				case (func3_i)
					3'b000: ALUCtrl_o	<=	4'b0010;// add
					3'b001: ALUCtrl_o	<=	4'b0100;//SLLI
					3'b010: ALUCtrl_o	<=	4'b0111;//SLT
					//3'b110: ALUCtrl_o	<=	4'b0001;//SLTU
					3'b111: ALUCtrl_o	<=	4'b0000;//and operation
					3'b110: ALUCtrl_o	<=	4'b0001;//or operation	
					3'b100: ALUCtrl_o	<=	4'b0011;//XOR
					default: ALUCtrl_o	<= 4'b111;
				endcase
			default:	ALUCtrl_o	<= 4'b111;
		endcase
		
	end
	
endmodule 
