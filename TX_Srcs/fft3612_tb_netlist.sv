/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : fft3612_tb
Dependancy     :
Design doc.    : 
References     : 
Description    : Testbench for the 3/6/12 FFT block necessary for SC-FDMA
Owner          : Yahia Ahmed
*/

module fft3612_tb_netlist();

  // Parameters
  localparam DATA_WIDTH = 16;
  localparam FRAC_WIDTH = 12;
  localparam INT_WIDTH = 4;

  // Inputs and Outputs
  logic                                                 i_clk_tb, 
                                                        i_rst_n_tb, 
                                                        i_start_tb;
  logic         [1:0]                                   i_n_sc_tb;
  logic signed  [DATA_WIDTH-1:0]                        i_x_re_tb [0:11]; 
  logic signed  [DATA_WIDTH-1:0]                        i_x_im_tb [0:11]; 
  logic signed  [DATA_WIDTH-1:0]                        o_X_re_tb [0:11]; 
  logic signed  [DATA_WIDTH-1:0]                        o_X_im_tb [0:11];
  logic signed  [DATA_WIDTH-1:0]                        o_X_re_tb_ref [0:11]; 
  logic signed  [DATA_WIDTH-1:0]                        o_X_im_tb_ref [0:11]; 
  logic                                                 o_done_tb, 
                                                        o_puttin_tb;

  logic signed  [2*DATA_WIDTH-1:0]                      t_x_tb [0:11], 
                                                        t_X_tb [0:11]; 
  // Instantiate the fft3612 module
  fft3612 
                #(
                    .DATA_WIDTH                         (DATA_WIDTH),
                    .FRAC_WIDTH                         (FRAC_WIDTH),
                    .INT_WIDTH                          (INT_WIDTH)
                ) 
  DUT 
                (
                    .i_clk                              (i_clk_tb),
                    .i_rst_n                            (i_rst_n_tb),
                    .i_start                            (i_start_tb),
                    .i_n_sc                             (i_n_sc_tb),
                    .\i_x_re[0]                          (i_x_re_tb[0] ),
                    .\i_x_re[1]                          (i_x_re_tb[1] ),
                    .\i_x_re[2]                          (i_x_re_tb[2] ),
                    .\i_x_re[3]                          (i_x_re_tb[3] ),
                    .\i_x_re[4]                          (i_x_re_tb[4] ),
                    .\i_x_re[5]                          (i_x_re_tb[5] ),
                    .\i_x_re[6]                          (i_x_re_tb[6] ),
                    .\i_x_re[7]                          (i_x_re_tb[7] ),
                    .\i_x_re[8]                          (i_x_re_tb[8] ),
                    .\i_x_re[9]                          (i_x_re_tb[9] ),
                    .\i_x_re[10]                         (i_x_re_tb[10]) ,
                    .\i_x_re[11]                         (i_x_re_tb[11]) ,
                    .\i_x_im[0]                          (i_x_im_tb[0] ),
                    .\i_x_im[1]                          (i_x_im_tb[1] ),
                    .\i_x_im[2]                          (i_x_im_tb[2] ),
                    .\i_x_im[3]                          (i_x_im_tb[3] ),
                    .\i_x_im[4]                          (i_x_im_tb[4] ),
                    .\i_x_im[5]                          (i_x_im_tb[5] ),
                    .\i_x_im[6]                          (i_x_im_tb[6] ),
                    .\i_x_im[7]                          (i_x_im_tb[7] ),
                    .\i_x_im[8]                          (i_x_im_tb[8] ),
                    .\i_x_im[9]                          (i_x_im_tb[9] ),
                    .\i_x_im[10]                         (i_x_im_tb[10]) ,
                    .\i_x_im[11]                         (i_x_im_tb[11]) ,
                    .\o_X_re[0]                          (o_X_re_tb[0] ),
                    .\o_X_re[1]                          (o_X_re_tb[1] ),
                    .\o_X_re[2]                          (o_X_re_tb[2] ),
                    .\o_X_re[3]                          (o_X_re_tb[3] ),
                    .\o_X_re[4]                          (o_X_re_tb[4] ),
                    .\o_X_re[5]                          (o_X_re_tb[5] ),
                    .\o_X_re[6]                          (o_X_re_tb[6] ),
                    .\o_X_re[7]                          (o_X_re_tb[7] ),
                    .\o_X_re[8]                          (o_X_re_tb[8] ),
                    .\o_X_re[9]                          (o_X_re_tb[9] ),
                    .\o_X_re[10]                         (o_X_re_tb[10]) ,
                    .\o_X_re[11]                         (o_X_re_tb[11]) ,
                    .\o_X_im[0]                          (o_X_im_tb[0] ),
                    .\o_X_im[1]                          (o_X_im_tb[1] ),
                    .\o_X_im[2]                          (o_X_im_tb[2] ),
                    .\o_X_im[3]                          (o_X_im_tb[3] ),
                    .\o_X_im[4]                          (o_X_im_tb[4] ),
                    .\o_X_im[5]                          (o_X_im_tb[5] ),
                    .\o_X_im[6]                          (o_X_im_tb[6] ),
                    .\o_X_im[7]                          (o_X_im_tb[7] ),
                    .\o_X_im[8]                          (o_X_im_tb[8] ),
                    .\o_X_im[9]                          (o_X_im_tb[9] ),
                    .\o_X_im[10]                         (o_X_im_tb[10]) ,
                    .\o_X_im[11]                         (o_X_im_tb[11]) ,
                    .o_done                             (o_done_tb),
                    .o_puttin                           (o_puttin_tb)
                );

  // Clock generation
  always #5 i_clk_tb = ~i_clk_tb;
  

  // Parameters for the testbench
 // localparam SIM_TIME = 1000 ;
  localparam bit [15:0] error = 'b0000_000010000000; //absolute error = 2^-5

  // Task to read input vectors from a file
  task read_input_vectors;
    $readmemb("fft_in_data.mem", t_x_tb);
    for (int i = 0; i < 12 ; i++) 
    begin
      i_x_re_tb[i] = t_x_tb[i][2*DATA_WIDTH-1:DATA_WIDTH];
      i_x_im_tb[i] = t_x_tb[i][DATA_WIDTH-1:0];
    end
  endtask

  // read reference outputs
  task read_ref_output;
    $readmemb("fft_out_data.mem", t_X_tb);
    for (int i = 0; i < 12 ; i++) 
    begin
      o_X_re_tb_ref[i] = t_X_tb[i][2*DATA_WIDTH-1:DATA_WIDTH]; 
      o_X_im_tb_ref[i] = t_X_tb[i][DATA_WIDTH-1:0];
    end
    
  endtask

  function int signed_abs(logic signed [15:0] value);
  return (value[15]) ? -value : value;
endfunction

  // Task to compare output to reference
  task compare_output;
    @(posedge o_done_tb); //sample at done
    #10; //time for the last sample to be sampled
    for (int i = 0; i < 12; i++) begin
      if (signed_abs(o_X_re_tb_ref[i] - o_X_re_tb[i]) < error && signed_abs(o_X_re_tb_ref[i] - o_X_re_tb[i]) < error)
        $display("sample %0d success at time %t", i, $time());
      else
        $display("sample %0d failed at time %t",i, $time());
    end
  endtask

  // Initial block
  initial begin
    // Initialize inputs
    i_clk_tb = 0;
    i_rst_n_tb = 1;
    i_start_tb = 0;
    i_n_sc_tb = 2'b10; // Set the FFT type

    // Read input vectors
    read_input_vectors;

    // Read reference output
    read_ref_output;

    // Apply reset
    i_rst_n_tb = 0;
    #10; // Wait for a few cycles after applying reset
    i_rst_n_tb = 1;

    // Apply inputs
    i_start_tb = 1;

    // Run simulation for a specific time
    #20;

    // De-assert inputs
    i_start_tb = 0;

    // Compare output to reference
    compare_output;

    // Finish simulation
    #10; // Additional simulation time for better visibility in simulation waveform
    $finish;
  end

endmodule
