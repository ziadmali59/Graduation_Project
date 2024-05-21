/*
Project        : NB-IOT UPLINK
Standard doc.  : 
Module name    : ram_est
Dependancy     :
Design doc.    : 
References     : 
Description    : memory 12*32 used in the channel equalization.
Owner          : Martina Magued
*/

module ram_equ
#(parameter             DATA_WIDTH=16,  
parameter 				DOUBLE_DATA_WIDTH=32)
(
    input                                   	 i_clk_ram,
                                            	 i_wr_en_ram,
											
	input logic[DOUBLE_DATA_WIDTH-1:0]           i_data_ram,  //one or 2 portsssssss??????/
	input logic[3:0]                       		 i_rd_add_ram, 
    input logic[3:0]                          	 i_wr_add_ram,

	output logic [DOUBLE_DATA_WIDTH-1:0]         o_data_ram

);

	// Declare the RAM variable
	logic[DOUBLE_DATA_WIDTH-1:0] mem[0:11]; 
		
	
	always_ff @ (posedge i_clk_ram)
   begin
	 if (i_wr_en_ram)
		begin
			mem[i_wr_add_ram]       <= i_data_ram;
		end
		
	o_data_ram       <= mem[i_rd_add_ram];
	end

endmodule
    