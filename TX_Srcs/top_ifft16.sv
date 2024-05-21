/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : top_ifft16
Dependancy     :
Design doc.    : 
References     : 
Description    : 16 point-IFFT.
Owner          : Martina Magued
*/
module top_ifft16
#(parameter 			                     DATA_WIDTH	=	16,//32,   
                                       DOUBLE_DATA_WIDTH = 2*DATA_WIDTH,//32 //for real and imaginary
                                       INT_WIDTH=4,//8,
                                       FRAC_WIDTH=12//24
)
(
input logic                                       i_clk_ifft16,     
                                                  i_rst_n,
                                                  i_valid_mapper_control_fft16,
input logic signed [DOUBLE_DATA_WIDTH-1:0]        i_ifft16 [15:0], 
output logic signed [DOUBLE_DATA_WIDTH-1:0]       o_ifft16 [15:0],
output logic                                      o_done_ifft16                                                  
);

logic signed [DOUBLE_DATA_WIDTH-1:0]          conj_t_i_fft16 [15:0];
logic signed [DOUBLE_DATA_WIDTH-1:0]          t_o_fft16 [15:0];


//logic signed [DATA_WIDTH-1:0] t0;
logic signed [DATA_WIDTH-1:0] t1;
logic signed [DATA_WIDTH-1:0] t2;
logic signed [DATA_WIDTH-1:0] t3;
logic signed [DATA_WIDTH-1:0] t4;
logic signed [DATA_WIDTH-1:0] t5;
logic signed [DATA_WIDTH-1:0] t6;
logic signed [DATA_WIDTH-1:0] t7;
logic signed [DATA_WIDTH-1:0] t8;
logic signed [DATA_WIDTH-1:0] t9;
logic signed [DATA_WIDTH-1:0] t10;
logic signed [DATA_WIDTH-1:0] t11;
logic signed [DATA_WIDTH-1:0] t12;
logic signed [DATA_WIDTH-1:0] t13;
logic signed [DATA_WIDTH-1:0] t14;
logic signed [DATA_WIDTH-1:0] t15;
logic signed [DATA_WIDTH-1:0] t16;

//logic signed [DATA_WIDTH-1:0] t0i;
logic signed [DATA_WIDTH-1:0] t1i;
logic signed [DATA_WIDTH-1:0] t2i;
logic signed [DATA_WIDTH-1:0] t3i;
logic signed [DATA_WIDTH-1:0] t4i;
logic signed [DATA_WIDTH-1:0] t5i;
logic signed [DATA_WIDTH-1:0] t6i;
logic signed [DATA_WIDTH-1:0] t7i;
logic signed [DATA_WIDTH-1:0] t8i;
logic signed [DATA_WIDTH-1:0] t9i;
logic signed [DATA_WIDTH-1:0] t10i;
logic signed [DATA_WIDTH-1:0] t11i;
logic signed [DATA_WIDTH-1:0] t12i;
logic signed [DATA_WIDTH-1:0] t13i;
logic signed [DATA_WIDTH-1:0] t14i;
logic signed [DATA_WIDTH-1:0] t15i;
logic signed [DATA_WIDTH-1:0] t16i;

assign t1=o_ifft16[0][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t2=o_ifft16[1][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t3=o_ifft16[2][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t4=o_ifft16[3][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t5=o_ifft16[4][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t6=o_ifft16[5][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t7=o_ifft16[6][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t8=o_ifft16[7][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t9=o_ifft16[8][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t10=o_ifft16[9][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t11=o_ifft16[10][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t12=o_ifft16[11][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t13=o_ifft16[12][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t14=o_ifft16[13][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t15=o_ifft16[14][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t16=o_ifft16[15][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];



assign t1i=o_ifft16[0][DATA_WIDTH-1:0];
assign t2i=o_ifft16[1][DATA_WIDTH-1:0];
assign t3i=o_ifft16[2][DATA_WIDTH-1:0];
assign t4i=o_ifft16[3][DATA_WIDTH-1:0];
assign t5i=o_ifft16[4][DATA_WIDTH-1:0];
assign t6i=o_ifft16[5][DATA_WIDTH-1:0];
assign t7i=o_ifft16[6][DATA_WIDTH-1:0];
assign t8i=o_ifft16[7][DATA_WIDTH-1:0];
assign t9i=o_ifft16[8][DATA_WIDTH-1:0];
assign t10i=o_ifft16[9][DATA_WIDTH-1:0];
assign t11i=o_ifft16[10][DATA_WIDTH-1:0];
assign t12i=o_ifft16[11][DATA_WIDTH-1:0];
assign t13i=o_ifft16[12][DATA_WIDTH-1:0];
assign t14i=o_ifft16[13][DATA_WIDTH-1:0];
assign t15i=o_ifft16[14][DATA_WIDTH-1:0];
assign t16i=o_ifft16[15][DATA_WIDTH-1:0];


generate
  genvar i;
  for (i = 0; i < 16; i++) begin : CONJ_LOOP
  
logic signed [DOUBLE_DATA_WIDTH-1:DATA_WIDTH] real_part;
logic signed [DATA_WIDTH-1:0]                 imag_part;  
logic signed [DOUBLE_DATA_WIDTH-1:DATA_WIDTH] real_part_2;
logic signed [DATA_WIDTH-1:0]                 imag_part_2;
    always_comb begin
      // Extract the real and imaginary parts of the complex number
      real_part = i_ifft16[i][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
      imag_part = i_ifft16[i][DATA_WIDTH-1:0];
      
      // Calculate the conjugate of the complex number
      conj_t_i_fft16[i][DOUBLE_DATA_WIDTH-1:DATA_WIDTH] = real_part;
      conj_t_i_fft16[i][DATA_WIDTH-1:0] = -imag_part; // Negate the imaginary part


      // Extract the real and imaginary parts of the complex number
     real_part_2 = t_o_fft16[i][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
     imag_part_2 = t_o_fft16[i][DATA_WIDTH-1:0];
      
      // Calculate the conjugate of the complex number
      o_ifft16[i][DOUBLE_DATA_WIDTH-1:DATA_WIDTH] = real_part_2 >>> 4;
      o_ifft16[i][DATA_WIDTH-1:0] = -imag_part_2 >>> 4; 
    end
  end
endgenerate


top_fft16 #( 			                .DATA_WIDTH(DATA_WIDTH), 
                                                .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH),
                                                .INT_WIDTH(INT_WIDTH),
                                                .FRAC_WIDTH(FRAC_WIDTH)
)
fft16(                                      .i_clk_fft16(i_clk_ifft16),     
                                            .i_rst_n(i_rst_n),
                                            .i_valid_mapper_control_fft16(i_valid_mapper_control_fft16),
                                            .i_fft16(conj_t_i_fft16), 
                                            .o_fft16(t_o_fft16),
                                            .o_done_fft16(o_done_ifft16)                                               
);

endmodule