/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : modmapper
Dependancy     :
Design doc.    : 
References     : 
Description    : Modulation mapper that works with QPSK/16-QAM
Owner          : Yahia Ahmed
*/

module modmapper
    #(
        parameter DATA_WIDTH = 16 
    ) 
    (
    input   logic                                       i_clk,
                                                        i_rst_n,
                                                        i_start,
    input   wire    signed            [0:0]                        i_din [0:0],
    input   logic               [2:0]                   i_Qm,
    output  logic   signed      [DATA_WIDTH-1:0]        o_I,
    output  logic   signed      [DATA_WIDTH-1:0]        o_Q,
    output  logic                                       o_done
    );

    logic           signed      [DATA_WIDTH-1:0]        t_u     [0:1]; //0 for Q and 1 for I unsigned
    logic           signed      [DATA_WIDTH-1:0]        t_s     [0:1]; //0 for Q and 1 for I signed

    logic                                               c_sign  [0:1];

    logic    signed                     [0:0]                      t_datamod [0:3] [0:0]; //sipo o/p
   // logic                         [1:0]                      t_addr_1;
   // logic                         [1:0]                      t_addr_2;

    flexsipo 
        #(
            .DATA_WIDTH                                 (1),
            .SHIFT_LENGTH                               (4),
            .IS_COMP                                    (0)
        ) 
    flexsipo_inst 
        (
            .i_clk                                      (i_clk),
            .i_rst_n                                    (i_rst_n),
            .i_sin                                      (i_din),
            .i_start                                    (i_start),
            .i_limit                                    (i_Qm),
            .o_pout                                     (t_datamod),
            .o_done                                     (o_done)
        );

//assign t_addr_1 = {i_Qm[2], t_datamod[1]};
//assign t_addr_2 = {i_Qm[2], t_datamod[1]};

    flexrom2 
        #(
            .DATA_WIDTH                                 (DATA_WIDTH),
            .ADDR_WIDTH                                 (2)
        ) 
    const_rom 
        (
            .i_addr_1                                   ({i_Qm[2], t_datamod[1][0][0]}), //for I
            .i_addr_2                                   ({i_Qm[2], t_datamod[0][0][0]}), //for Q
            .o_data_out_1                               (t_u[1]),
            .o_data_out_2                               (t_u[0])
        );
	genvar i;
    generate
        for (i = 0; i < 2; i++) 
        begin : mux_inst
        flexmux2 
        #(
            .DATA_WIDTH                                 (1),
            .SEL_WIDTH                                  (1)
        ) 
        ctrl_mux 
        (
            .select                                     (i_Qm[2]),
            .data_in                                    ({t_datamod[i][0][0], t_datamod[i+2][0][0]}),
            .data_out                                   (c_sign[i])
        );
        end
    endgenerate

    generate
        for (i = 0; i < 2; i++) 
        begin : comp_inst
        comp2sre 
        #(
            .DATA_WIDTH                                 (DATA_WIDTH)
        ) 
        comp2sre_inst 
        (
            .i_ctrl                                     (c_sign[i]),
            .i_din                                      (t_u[i]),
            .o_dout                                     (t_s[i])
        );
        end
    endgenerate

    always_ff @( posedge i_clk or negedge i_rst_n ) 
    begin
        if (!i_rst_n)       // Reset condition
        begin
            o_I <= 0;
            o_Q <= 0;
        end
        else if (o_done)  // Increment condition (when enable is active)
        begin
            o_I <= t_s[1];
            o_Q <= t_s[0];
        end
    end



endmodule