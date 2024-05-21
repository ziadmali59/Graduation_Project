module serial_to_parallel_Channel_Interleaver #(parameter DATA_WIDTH = 12) (
  input	 logic 	i_clk,
  input	 logic 	i_serial_in,
  input	 logic	i_start,
  input	 logic 	i_rst_n,
  //input   logic   i_enable,
  output	 logic 	[DATA_WIDTH-1:0] o_parallel_out,
  output	 logic 	o_data_received  // Flag indicating all data received
);

  // Use a shift register to store incoming bits
  logic [DATA_WIDTH-1:0] shift_reg;
 
 
 
  // Count received bits
  logic [3:0] bit_count;

  always_ff @(negedge i_clk or negedge i_rst_n)  begin
 if(!i_rst_n )  begin
 bit_count <= 4'b0;
 o_data_received <= 0;
   shift_reg<=0;
end
/*else if(!i_enable)begin
 bit_count <= 4'b0;
o_data_received <= 0;
 shift_reg<=0;
end*/
else if(!i_start)begin
 bit_count <= bit_count;
o_data_received <= 0;
 shift_reg<=shift_reg;
end
else  if( bit_count==(DATA_WIDTH-1))begin
   shift_reg <= {i_serial_in, shift_reg[DATA_WIDTH-1:1]};
   bit_count<=bit_count+1'b1;
   o_data_received <= 0;
   o_data_received <= 1;
   bit_count<=0;
end
else begin

     shift_reg <= {i_serial_in, shift_reg[DATA_WIDTH-1:1]};
     bit_count<=bit_count+1'b1;
     o_data_received <= 0;
  
  


end
end
assign o_parallel_out = shift_reg;

endmodule



