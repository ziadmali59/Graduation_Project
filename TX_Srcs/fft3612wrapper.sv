module fft3612_wrapper 
#(
      parameter DATA_WIDTH  = 16,
      parameter FRAC_WIDTH  = 12,
      parameter INT_WIDTH   = 4
) 
(
    //ctrl inputs
    input       logic                                 i_clk               ,
                                                      i_rst_n             ,
                                                      i_start             ,
    input       logic [1:0]                           i_n_sc              , // 0 -> 3pt, 1 -> 6pt, 2 -> 12pt

    output      logic                                 o_done              ,
    output      logic [2:0]                           o_rsample              
);

    // ROM for storing input samples
    // The size of the ROM is adjusted based on the number of input samples
    logic signed [2*DATA_WIDTH-1:0] x_rom[0:11]; // Assuming 12 samples
    //logic signed [DATA_WIDTH-1:0] x_im_rom[0:11]; // Assuming 12 samples

    // Memory to store output samples
    // The size of the memory is adjusted based on the number of output samples
    logic signed [DATA_WIDTH-1:0] X_re_mem[0:11]; // Assuming 12 samples
    logic signed [DATA_WIDTH-1:0] X_im_mem[0:11]; // Assuming 12 samples

    // ROM for input samples
    initial
    begin
        $readmemb("fft_in_data.mem", x_rom);
    end

    // Instantiate fft3612 module
    fft3612 
    #(
        .DATA_WIDTH                     (DATA_WIDTH),
        .FRAC_WIDTH                     (FRAC_WIDTH),
        .INT_WIDTH                      (INT_WIDTH)
    ) 
    fft_inst 
    (
        //ctrl inputs
        .i_clk                          (i_clk),
        .i_rst_n                        (i_rst_n),
        .i_start                        (i_start),
        .i_n_sc                         (i_n_sc),

        //input samples
        .i_x_re                         ({
                                                    {x_rom[0][31:16]},
                                                    {x_rom[1][31:16]},
                                                    {x_rom[2][31:16]},
                                                    {x_rom[3][31:16]},
                                                    {x_rom[4][31:16]},
                                                    {x_rom[5][31:16]},
                                                    {x_rom[6][31:16]},
                                                    {x_rom[7][31:16]},
                                                    {x_rom[8][31:16]},
                                                    {x_rom[9][31:16]},
                                                    {x_rom[10][31:16]},
                                                    {x_rom[11][31:16]}
                                        }),
        .i_x_im                         ({
                                                    {x_rom[0][15:0]},
                                                    {x_rom[1][15:0]},
                                                    {x_rom[2][15:0]},
                                                    {x_rom[3][15:0]},
                                                    {x_rom[4][15:0]},
                                                    {x_rom[5][15:0]},
                                                    {x_rom[6][15:0]},
                                                    {x_rom[7][15:0]},
                                                    {x_rom[8][15:0]},
                                                    {x_rom[9][15:0]},
                                                    {x_rom[10][15:0]},
                                                    {x_rom[11][15:0]}
                                        }),

        //output samples
        .o_X_re                         (X_re_mem),
        .o_X_im                         (X_im_mem),

        .o_done                         (o_done)
    );

    assign o_rsample[0] = X_re_mem[0][7];
    assign o_rsample[1] = X_im_mem[5][6];
    assign o_rsample[2] = X_im_mem[11][3];

endmodule
