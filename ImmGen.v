`include "include/lagartoII_const.vh"

module ImmGen(
	input			`WORD	instruction_i,
	output reg		`WORD	data_o
);

	wire 			`OPCODE	opCode_w;

	assign	opCode_w	= 	instruction_i[`OPCODE_WIDTH-1:0];

	always @(*)begin
		case (opCode_w)
			7'b0010011: data_o	=	{{`WORD_WIDTH-12{instruction_i[`WORD_WIDTH-1]}},	//Type I instructions 
									instruction_i[`WORD_WIDTH-1:`WORD_WIDTH-12]};

			7'b0000011: data_o	=	{{`WORD_WIDTH-12{instruction_i[`WORD_WIDTH-1]}},	//Type L instructions 
									instruction_i[`WORD_WIDTH-1:`WORD_WIDTH-12]};	

			7'b0100011: data_o	=	{{20{instruction_i[31]}},
									instruction_i[11:7 ],								//Type S instructions
									instruction_i[31:25]}; 

			7'b1100011: data_o	=	{{20{instruction_i[31]}},
									instruction_i[31	],
									instruction_i[7	],									//Type B instructions
									instruction_i[30:25],
									instruction_i[11 :8 ]};
			default: data_o	=	{`WORD_WIDTH{1'b0}};
		endcase
	end
	
endmodule 

