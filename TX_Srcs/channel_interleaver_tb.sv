module channel_interleaver_tb();

logic	i_serial_in;
logic 	i_clk;
logic     i_rst_n;
logic 	i_start;
logic	[3:0] i_Nsc;              // Number of serving cells
logic 	[3:0] i_NRU;             // Number of resource units
logic 	[3:0] i_Qm;              // Modulation order
logic 	[3:0] i_Nslots;  
logic 	o_channel_interleaver;
logic    o_valid;

initial begin
//i_serial_in<=$random;
i_rst_n<=0;
i_Nsc<='d3;
i_NRU<='d1;
i_Qm<='d2;
i_Nslots<='d8;


end





always begin
     #5 i_clk = !i_clk;
end
Channel_Interleaver channelinterleaver(.i_serial_in(i_serial_in),
.i_clk(i_clk),
.i_rst_n(i_rst_n),
.i_start(i_start),
.i_Nsc(i_Nsc),              // Number of serving cells
.i_NRU(i_NRU),              // Number of resource units
.i_Qm(i_Qm),                // Modulation order
.i_Nslots(i_Nslots),  
.o_channel_interleaver(o_channel_interleaver),
.o_valid(o_valid));
endmodule