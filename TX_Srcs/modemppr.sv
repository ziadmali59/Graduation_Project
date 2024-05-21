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
    input   logic               [1:0]                   i_n_sc,
    input   logic   signed      [DATA_WIDTH-1:0]        i_I,
    input   logic   signed      [DATA_WIDTH-1:0]        i_Q,
    output  logic               [3:0]                   o_dout
    );

    logic   signed              [DATA_WIDTH-1:0]        t_I_u;
    logic   signed              [DATA_WIDTH-1:0]        t_Q_u;
    logic   signed              [DATA_WIDTH-1:0]        t_I_u_bdry;
    logic   signed              [DATA_WIDTH-1:0]        t_Q_u_bdry;

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

    assign o_dout[3] = i_I[DATA_WIDTH-1];
    assign o_dout[2] = i_Q[DATA_WIDTH-1];

    assign t_I_u_bdry = (16'b0001_111001011100<<(i_n_sc)) - t_I_u;
    assign t_Q_u_bdry = (16'b0001_111001011100<<(i_n_sc)) - t_Q_u;

    assign o_dout[1] = t_I_u_bdry[DATA_WIDTH-1];
    assign o_dout[0] = t_Q_u_bdry[DATA_WIDTH-1];

endmodule