/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : modmapper
Dependancy     :
Design doc.    : 
References     : 
Description    : Modulation Demapper that works with QPSK/16-QAM
Owner          : Yahia Ahmed
*/

module moddemppr
    #(
        parameter DATA_WIDTH = 16 
    ) 
    (
    input   logic                                       i_clk,
                                                        i_rst_n,
                                                        i_start,
    input   logic               [1:0]                   i_n_sc,
    input   logic               [2:0]                   i_Qm,
    input   logic   signed      [DATA_WIDTH-1:0]        i_I,
    input   logic   signed      [DATA_WIDTH-1:0]        i_Q,
    output  logic   signed      [0:0]                   o_dout [0:0],
    output  logic                                       o_done,
                                                        o_valid
    );

    logic   signed              [DATA_WIDTH-1:0]        t_I_u;
    logic   signed              [DATA_WIDTH-1:0]        t_Q_u;
    logic   signed              [DATA_WIDTH-1:0]        t_I_u_bdry;
    logic   signed              [DATA_WIDTH-1:0]        t_Q_u_bdry;
    logic   signed              [0:0]                   t_datademod [0:3] [0:0];

    comp2sre 
    #(
        .DATA_WIDTH                                     (DATA_WIDTH)
    ) 
    comp2sre_inst_I 
    (
        .i_ctrl                                         (i_I[DATA_WIDTH-1]),
        .i_din                                          (i_I),
        .o_dout                                         (t_I_u)
    );

    comp2sre 
    #(
        .DATA_WIDTH                                     (DATA_WIDTH)
    ) 
    comp2sre_inst_Q 
    (
        .i_ctrl                                         (i_Q[DATA_WIDTH-1]),
        .i_din                                          (i_Q),
        .o_dout                                         (t_Q_u)
    );

    assign t_datademod[3] = {{i_I[DATA_WIDTH-1]}};
    assign t_datademod[2] = {{i_Q[DATA_WIDTH-1]}};

    assign t_I_u_bdry = (16'b0001_111001011100<<(i_n_sc)) - t_I_u;
    assign t_Q_u_bdry = (16'b0001_111001011100<<(i_n_sc)) - t_Q_u;

    assign t_datademod[1] = {{t_I_u_bdry[DATA_WIDTH-1]}};
    assign t_datademod[0] = {{t_Q_u_bdry[DATA_WIDTH-1]}};

    flexpiso 
    #(
        .DATA_WIDTH                                     (1),
        .SHIFT_LENGTH                                   (4),
        .IS_COMP                                        (0)
    ) 
    flexpiso_inst 
    (
        .i_clk                                          (i_clk),
        .i_rst_n                                        (i_rst_n),
        .i_start                                        (i_start),
        .i_pin                                          (
                                                        {
                                                            t_datademod[3],//[0][0], //in reverse order to insure the same order of transmission
                                                            t_datademod[1],//[0][0],
                                                            t_datademod[2],//[0][0],
                                                            t_datademod[0]//[0][0]
                                                        }
                                                        ),
        .i_limit                                        (i_Qm),
        .o_sout                                         (o_dout),
        .o_valid                                        (o_valid),
        .o_done                                         (o_done)
    );

endmodule