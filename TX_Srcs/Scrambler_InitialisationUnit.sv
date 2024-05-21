/*
Project        : NB_IoT uplink transmitter
Standard doc.  : 
Module name    : Scrambler_InitialisationUnit
Dependancy     :
Design doc.    : 
References     : 
Description    : 
Owner          : Mariam Ahmed
*/
module Scrambler_InitialisationUnit(
input		logic		[8:0] i_Ncell_ID,
input		logic		[15:0]i_RNTI,
input		logic		[3:0] i_ns,
input		logic		i_nf,
output      logic		[30:0]o_x2initial,
output      logic		[30:0]o_x1initial
);
assign o_x2initial=((i_RNTI << 14)) + ((i_nf << 13)) + (((i_ns >> 1) << 9)) + (i_Ncell_ID);
assign o_x1initial=31'b01;
endmodule