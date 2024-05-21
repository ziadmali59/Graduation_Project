/*
Project        : NB-IOT UPLINK
Standard doc.  : 
Module name    : btrfly_fft16
Dependancy     :
Design doc.    : 
References     : 
Description    : 
Owner          : Martina Magued
*/

module btrfly_fft16 
#(parameter 			               DATA_WIDTH	=	16,
  parameter FRAC_WIDTH  = 12,
  parameter INT_WIDTH   = 4
)
(
  
  input logic [DATA_WIDTH-1:0] i_a_real_btrfly_fft16, 
  input logic [DATA_WIDTH-1:0] i_a_imag_btrfly_fft16, 
  
  input logic [DATA_WIDTH-1:0] i_b_real_btrfly_fft16, 
  input logic [DATA_WIDTH-1:0] i_b_imag_btrfly_fft16, 

  
  output logic o_valid_btrfly_fft16,
  
  output logic [DATA_WIDTH-1:0] o_sum_real_btrfly_fft16,            
  output logic [DATA_WIDTH-1:0] o_sum_imag_btrfly_fft16,

  output logic [DATA_WIDTH-1:0] o_minus_real_btrfly_fft16,             
  output logic [DATA_WIDTH-1:0] o_minus_imag_btrfly_fft16
);


 
  always_comb begin

      // 1st output 
      o_sum_real_btrfly_fft16 = i_a_real_btrfly_fft16 + i_b_real_btrfly_fft16;
      o_sum_imag_btrfly_fft16 = i_a_imag_btrfly_fft16 + i_b_imag_btrfly_fft16;
    
      
      // 2nd output
      o_minus_real_btrfly_fft16 = i_a_real_btrfly_fft16 - i_b_real_btrfly_fft16;
      o_minus_imag_btrfly_fft16 = i_a_imag_btrfly_fft16 - i_b_imag_btrfly_fft16;
  
     o_valid_btrfly_fft16 = 1'b1;
      end


 

endmodule
