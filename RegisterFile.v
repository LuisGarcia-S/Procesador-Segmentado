`include "include/lagartoII_const.vh"

module	RegisterFile (
	input				clk_i		,
	input				WE_i		,
	input 		`vADDR	addrSrc1_i	,
	input 		`vADDR	addrSrc2_i	,
	input 		`vADDR	addrDest_i	,
	input 		`WORD	dataDest_i	,
	output reg	`WORD 	dataSrc1_o	,
	output reg	`WORD 	dataSrc2_o
);

	reg			`WORD	RegFile	[2**`vADDR_WIDTH-1:0];
	integer				i;

	initial begin
		for(i = 0; i < `WORD_WIDTH; i = i + 1) begin
			RegFile[i] = `WORD_ZERO;
		end
	end
	
	always @(posedge clk_i)
		begin 
			if (WE_i & (addrDest_i != `vADDR_ZERO))
				RegFile[addrDest_i]	<=	dataDest_i;
		end
		
	//Puertos de lectura
	always @(negedge clk_i) begin
		dataSrc1_o	<=	RegFile[addrSrc1_i];
		dataSrc2_o	<=	RegFile[addrSrc2_i];
	end

		
		
endmodule
