/*
Project        : NB_IoT uplink transmitter
Standard doc.  : 
Module name    : Scrambler
Dependancy     :
Design doc.    : 
References     : 
Description    :
Owner          : Mariam Ahmed
*/
module Scrambler_Dflipflop(
input logic	 i_D,
input logic	 i_rst_n,
input logic	 i_clk,
input logic	 i_Preset,
input logic	 i_Preset_value,
input logic  i_Disable,
output logic o_Q
);

always_ff@ (posedge i_clk or negedge i_rst_n ) begin
if (!i_rst_n)
     o_Q<=0;
else if(i_Preset)
	  o_Q<=i_Preset_value;
else if(i_Disable)
	  o_Q<=o_Q;
else
     o_Q<=i_D;
 
end

endmodule
