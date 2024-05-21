
module ram_fft16
#(parameter             DATA_WIDTH=16,  
parameter 				DOUBLE_DATA_WIDTH=32,
parameter               ADD_SIZE=1)
(
    input                                   	i_clk_ram_fft16,
                                            	i_wr_en_ram_fft16,
											
	input logic[DOUBLE_DATA_WIDTH-1:0]           i_data_ram_fft16,
	input logic                         		 i_rd_add_ram_fft16, 
                                            	 i_wr_add_ram_fft16,

	output logic [DOUBLE_DATA_WIDTH-1:0]         o_data_ram_fft16

);

	// Declare the RAM variable
	logic[DOUBLE_DATA_WIDTH-1:0] mem[0:1]; 
		
	
	always_ff @ (posedge i_clk_ram_fft16)
   begin
	 if (i_wr_en_ram_fft16)
		begin
			mem[i_wr_add_ram_fft16]       <= i_data_ram_fft16;
		end
		
	o_data_ram_fft16        <= mem[i_rd_add_ram_fft16];
	end

endmodule
    