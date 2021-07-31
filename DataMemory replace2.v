`include "include/lagartoII_const.vh"
module	DataMem (
	input								clk_i	,
	input								WE_i	,
	input								RE_i	,
	input 			[`INDEX_MSB-1:0]	Addr_i	,
	input 			`WORD				DataW_i	,
	output			`WORD				DataR_o
	);

	reg				`WORD				dataMemory[2**`INDEX_MSB-1:0];

	initial
	begin
		$readmemh("dataMem.text", dataMemory);
	end

	//Write seccion
	always @(posedge clk_i) begin 
		if (WE_i)
			dataMemory[Addr_i]	<=	DataW_i;
	end

	//Read seccion
	assign	DataR_o	=	(RE_i) ? dataMemory[Addr_i] : `WORD_ZERO ;
	
	
endmodule

