/*
Project        : NB_IoT uplink transmitter
Standard doc.  : 
Module name    : Scrambler
Dependancy     :
Design doc.    : 
References     : 
Description    :
Owner          : Mariam Ahmed
*/
module Scrambler(
	input		logic		i_rst_n,
	input		logic		i_clk_Scrambler,
	input		logic		i_Start_Scrambler,
	input		logic		i_Scrambler_in,
	input		logic		[8:0] i_Ncell_ID,
	input		logic		[15:0]i_RNTI,
	input		logic		[3:0] i_ns,
	input		logic		i_nf,
	output 	    logic		o_Scrambler,
	output	    logic		o_Valid_Scrambler,
	output	    logic		o_Shift_Done
);

logic [30:0] x1initial,x2initial,input_registersx1,input_registersx2;
logic XOR_Two_Scramblers,RST_counter,i_Preset,i_Valid_Output_FSM,Disable_FF;
Scrambler_InitialisationUnit InitialUnit (.i_Ncell_ID(i_Ncell_ID),.i_RNTI(i_RNTI),.i_ns(i_ns),.i_nf(i_nf),.o_x2initial(x2initial),.o_x1initial(x1initial));

logic [3:0] tempWire;
logic Disable_Counter;
genvar i;
generate for (i = 1; i < 31; i++) begin : gen_block1
Scrambler_Dflipflop X2 (.i_D(input_registersx2[i]),.i_rst_n(i_rst_n),.i_clk(i_clk_Scrambler),.i_Preset(i_Preset),.i_Preset_value(x2initial[i-1]),.i_Disable(Disable_FF),.o_Q(input_registersx2[i-1]));
end
endgenerate

assign input_registersx1[30] = input_registersx1[0] ^ input_registersx1[3];

generate for (i = 1; i < 31; i++) begin : gen_block2
Scrambler_Dflipflop X1 (.i_D(input_registersx1[i]),.i_rst_n(i_rst_n),.i_clk(i_clk_Scrambler),.i_Preset(i_Preset),.i_Preset_value(x1initial[i-1]),.i_Disable(Disable_FF),.o_Q(input_registersx1[i-1]));
end
endgenerate

assign tempWire = input_registersx2[0] ^ input_registersx2[1]^ input_registersx2[2]^ input_registersx2[3];
assign input_registersx2[30]= tempWire;

assign XOR_Two_Scramblers=input_registersx1[0]^input_registersx2[0];
//assign o_Valid_Scrambler = 0;

always_ff @ (posedge i_clk_Scrambler, negedge i_rst_n) begin
	if (~i_rst_n) 
		begin
			o_Valid_Scrambler <= 0;	
		end
	else if (i_Valid_Output_FSM && i_Start_Scrambler) 
    	begin
		o_Scrambler <= XOR_Two_Scramblers ^ i_Scrambler_in;
		o_Valid_Scrambler<=1;
		end
	else 
		begin
			o_Scrambler <= 0;
			o_Valid_Scrambler <= 0;
		end
	
end

Scrambler_counter Counter(.clk(i_clk_Scrambler),.reset(RST_counter),.DisableSignal(Disable_Counter),.cout_done(o_Shift_Done));

Scrambler_FSM FSM(.i_clk(i_clk_Scrambler),.i_rst_n(i_rst_n),.i_count_done(o_Shift_Done),.i_Start_Scrambler(i_Start_Scrambler),.o_Preset(i_Preset),.o_ValidOutput(i_Valid_Output_FSM),.o_Reset_Counter(RST_counter),.o_DISABLE(Disable_FF),.o_DISABLE_Counter(Disable_Counter));
  
endmodule