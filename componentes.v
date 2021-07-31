

module full_adder (i_A, i_B, i_carryIn, o_sum, o_carryOut);

    input   i_A, i_B, i_carryIn;
    output  o_sum, o_carryOut;
	 
    assign  o_sum       =   (i_A ^ i_B) ^ i_carryIn;											//Compute output
    assign  o_carryOut  =   (i_carryIn & i_B) | (i_carryIn & i_A) | (i_A & i_B);	    //Compute carry
	 
endmodule

module half_adder (i_A, i_B, o_sum, o_carryOut);

    input   i_A, i_B;
    output  o_sum, o_carryOut;
	 
    assign  o_sum        =   i_A ^ i_B;										    	//Compute output
    assign  o_carryOut   =   i_A & i_B;	                                        //Compute carry
	 
endmodule

//Processing unit

module processUnit (i_p1, i_g1, i_p2, i_g2, o_p, o_g);
    input   i_g1, i_p1, i_g2, i_p2;
    output  o_g, o_p;

    assign  o_g =   i_g1 | i_p1 & i_g2;
    assign  o_p =   i_p1 & i_p2;         
endmodule

module processUnitLastLayer (i_p1, i_g1, i_g2,o_g);
    input   i_g1, i_p1, i_g2;
    output  o_g;

    assign  o_g =   i_g1 | i_p1 & i_g2;
    
endmodule

//Inverter to substraction operation and NOR operation
module inverter (i_inv, i_ctrl, o_inv);
    input i_inv;
	input [3:0]i_ctrl;
    output o_inv;
	 
    assign o_inv = ( ( i_ctrl == 4'b0110) | (i_ctrl == 4'b1100) | (i_ctrl == 4'b0111)) ? ~i_inv : i_inv;		//Invert input if is  a substraction  or NOR operation
	 
endmodule


module inverterA (i_A, i_ctrl, o_invA);
    input i_A; 
	 input [3:0]i_ctrl;
    output o_invA;
	 
    assign o_invA = (i_ctrl == 4'b1100) ? ~i_A : i_A;											//Invert input if is a NOR operation
	 
endmodule
 

//ALU 1-bit

module ALU_1bit (A, B, ctrl, carry_in, i_less, outALU, carry_out);

    input  [3:0]ctrl;
    input  A, B, carry_in, i_less;
    output reg outALU;
	 output reg carry_out;
	 wire w_outAdder, w_carryOut, w_invA, w_invB;
	 
	 inverter  inv (B, ctrl, w_invB);
	 inverterA invA (A, ctrl, w_invA);
	 
	 full_adder adder (w_invA, w_invB, carry_in, w_outAdder, w_carryOut);
    	 
	 always @(w_invA, w_invB, w_outAdder, ctrl, w_carryOut, i_less) begin
        case (ctrl)
            4'b0000: outALU <= w_invA & w_invB; //AND operation
            4'b0001: outALU <= w_invA | w_invB;	//OR operation
            4'b0010: outALU <= w_outAdder;		//ADD operation	
            4'b0110: outALU <= w_outAdder;		//Substraction operation
            4'b0111: outALU <= i_less;				//Set Less Than operation
            4'b1100: outALU <= w_invA | w_invB;	//NOR operation
            default: outALU <= 0;
        endcase
		  carry_out <= w_carryOut;
    end
endmodule

