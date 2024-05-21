module RAM_Channel_Interleaver
(
input	logic		i_clk,
//input logic    reset,
input logic    en_RAM,
input logic    WE_RAM,
input logic    [14:0]index,
input logic    [11:0]i_deserializer,
output logic   [11:0]O_RAM
//output logic   [14:0]  read_pointer
);


logic[11:0] RAM [23039:0];

always @(posedge i_clk )
begin
 if (en_RAM) begin
      if (WE_RAM) begin
         RAM[index] <= i_deserializer;
    
      end
      else begin
         O_RAM <= RAM[index];
        // read_pointer <= read_pointer + 1;
      end
   end
end

endmodule

