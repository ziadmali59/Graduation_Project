/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : compmul
Dependancy     :
Design doc.    : 
References     : 
Description    : Complex Multiplication used in the FFT operation.
Owner          : Yahia Ahmed & Martina Magued
*/
module compmul
  #(
      parameter DATA_WIDTH  = 16,
      parameter FRAC_WIDTH  = 12,
      parameter INT_WIDTH   = 4
  ) 
  (
      input         logic signed    [DATA_WIDTH-1:0]        i_a_re,
      input         logic signed    [DATA_WIDTH-1:0]        i_a_im,
      input         logic signed    [DATA_WIDTH-1:0]        i_b_re,
      input         logic signed    [DATA_WIDTH-1:0]        i_b_im,
      output        logic signed    [DATA_WIDTH-1:0]        o_res_re,
      output        logic signed    [DATA_WIDTH-1:0]        o_res_im
  );

  logic   signed                    [2*DATA_WIDTH:0]        inter_z; //intermideate Z
  logic   signed                    [2*DATA_WIDTH+1:0]      result_re, //untruncated results
                                                            result_im;
  always_comb begin
    inter_z     = (i_b_re * (i_a_re - i_a_im));
    result_re   = (i_a_im * (i_b_re - i_b_im)) + inter_z;
    result_im   = (i_a_re * (i_b_re + i_b_im)) - inter_z;    
    //result_re   = (i_a_re * i_b_re) - (i_a_im * i_b_im); //this method to be adjusted with fewer muls
    //result_im   = (i_a_re * i_b_im) + (i_a_im * i_b_re);
    o_res_re    = result_re[INT_WIDTH+2*FRAC_WIDTH-1:FRAC_WIDTH]; //truncation happens here
    o_res_im    = result_im[INT_WIDTH+2*FRAC_WIDTH-1:FRAC_WIDTH];
  end

endmodule

//will it work with combining real and imag??
/*
module compmul
  #(
      parameter DATA_WIDTH = 16,
      parameter FRAC_WIDTH = 12,
      parameter INT_WIDTH = 4,
  ) 
  (
      input         logic signed    [2*DATA_WIDTH-1:0]        i_a,
      input         logic signed    [2*DATA_WIDTH-1:0]        i_b,
      output        logic signed    [2*DATA_WIDTH-1:0]        o_res
  );

  always_comb begin
    real_result = (i_a[2*DATA_WIDTH-1:DATA_WIDTH] * i_b[2*DATA_WIDTH-1:DATA_WIDTH])   -       (i_a[2*DATA_WIDTH-1:0] * i_b[2*DATA_WIDTH-1:0]);
    imag_result = (i_a[2*DATA_WIDTH-1:DATA_WIDTH] * i_b[2*DATA_WIDTH-1:0])            +       (i_a[2*DATA_WIDTH-1:0] * i_b[2*DATA_WIDTH-1:DATA_WIDTH]);
  end

endmodule
*/
