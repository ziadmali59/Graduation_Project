/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : flexsipo
Dependancy     :
Design doc.    : 
References     : 
Description    : flexible sipo
Owner          : Yahia Ahmed
*/


module flexsipo
#(
  parameter DATA_WIDTH = 8,
  parameter SHIFT_LENGTH = 12,
  parameter IS_COMP = 1
)
(
  input     logic                           i_clk,                                       // Clock input
  input     logic                           i_rst_n,                                     // Active-low asynchronous reset
  input     wire  signed  [DATA_WIDTH-1:0]   i_sin   [0:IS_COMP],                                  // Serial input
  input     logic                           i_start,
  input     logic         [$clog2(SHIFT_LENGTH):0] i_limit,                      //limit for shift
  output    logic signed  [DATA_WIDTH-1:0]   o_pout [0:SHIFT_LENGTH-1] [0:IS_COMP],  // Parallel output, 3D for complex numbers
  output    logic                           o_done
);

  // Internal shift register
  logic signed [DATA_WIDTH-1:0] t_sreg [0:SHIFT_LENGTH-1] [0:IS_COMP] ;
  logic                                               t_start_d, //delayed strt
                                                      t_detegde;//edge detected sig
  logic                       [$clog2(SHIFT_LENGTH):0] t_ctr; //counter

    //edge detector
    always_ff @(posedge i_clk or negedge i_rst_n) 
    begin
        if (!i_rst_n)       // Reset condition
            t_start_d <= 0;
        else
            t_start_d <= i_start;
    end

    assign t_detegde = ~t_start_d & i_start;

    always_ff @(posedge i_clk or negedge i_rst_n) 
    begin
        if (!i_rst_n)       // Reset condition
            t_ctr <= 0;
        //else if (o_done || t_detegde) 
        else if (o_done)
            t_ctr <= 1;
        //else if (t_start_d || (t_ctr != 0))  // Increment condition (when enable is active)
        else if (t_start_d)
            t_ctr <= t_ctr + 1;
    end

    assign o_done = (t_ctr == i_limit);


  // Sequential logic for the shift register and counter
  always_ff @(posedge i_clk or negedge i_rst_n) 
  begin
    if (!i_rst_n) 
    begin
      for (int i = 0; i < SHIFT_LENGTH; i++)
      begin
        for (int j = 0; j <= IS_COMP; j++)
        begin
            t_sreg[i][j] <= 0;
        end
      end
    end 
    //else if (t_start_d || (t_ctr != 0)) 
    else if (t_start_d) 
    begin
        for (int k = SHIFT_LENGTH-1; k > 0; k--)
          t_sreg[k] <= t_sreg[k-1];
        t_sreg[0] <= i_sin;
    end
  end

  // Output assignment for parallel output
  genvar l;
  generate
    for (l = 0; l < SHIFT_LENGTH; l++) 
    begin : assignout
      assign o_pout[l] = t_sreg[l];
    end
  endgenerate

endmodule
