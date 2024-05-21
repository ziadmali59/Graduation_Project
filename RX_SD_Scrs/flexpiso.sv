/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : flexpiso
Dependancy     :
Design doc.    : 
References     : 
Description    : flexible piso
Owner          : Yahia Ahmed
*/

module flexpiso
    #(
    parameter DATA_WIDTH = 8,
    parameter SHIFT_LENGTH = 12,
    parameter IS_COMP = 1 //is it complex?
    )
    (
    input  logic                                i_clk,                                          // Clock input
    input  logic                                i_rst_n,                                        // Active low reset input
    input  logic                                i_start,                                         // Load signal
    input   wire  signed    [DATA_WIDTH-1:0]    i_pin      [0:SHIFT_LENGTH-1] [0:IS_COMP],     // Parallel input
    input  logic       [$clog2(SHIFT_LENGTH):0] i_limit, 
    output logic  signed    [DATA_WIDTH-1:0]    o_sout     [0:IS_COMP],                       // Serial output
    output logic                                o_valid,
    output logic                                o_done
    );
    
    // Internal signals
    logic  signed   [DATA_WIDTH-1:0]            t_sreg      [0:SHIFT_LENGTH-1] [0:IS_COMP];     // The actual shift
    
    logic                                       t_start_d, //delayed strt
                                                t_done_d,
                                                t_detegde;//edge detected sig
    logic           [$clog2(SHIFT_LENGTH):0]    t_ctr; //counter

    //edge detector
    always_ff @(posedge i_clk or negedge i_rst_n) 
    begin
        if (!i_rst_n)       // Reset condition
        begin
            t_start_d <= 0;
            t_done_d <= 0;
        end
        else
        begin
            t_start_d <= i_start;
            t_done_d  <= o_done;
        end
    end

    assign t_detegde = ~t_start_d & i_start;

    always_ff @(posedge i_clk or negedge i_rst_n) 
    begin
        if (!i_rst_n)       // Reset condition
            t_ctr <= 0;
        //else if (o_done || t_detegde) 
        else if (t_detegde)
            t_ctr <= 1;
        else if (o_done)
            t_ctr <= 0;
        else if (t_start_d || (t_ctr != 0))  // Increment condition (when enable is active)
        //else if (t_start_d)
            t_ctr <= t_ctr + 1;
    end

    assign o_done = (t_ctr == i_limit);
    assign o_valid = (t_ctr >= 1);

    // Register logic
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
        else if (t_detegde || t_done_d)
            t_sreg <= i_pin;
        else
            begin
                for (int k = SHIFT_LENGTH-1; k > 0; k--)
                    t_sreg[k] <= t_sreg[k-1];
                for (int j = 0; j <= IS_COMP; j++)
                begin
                    t_sreg[0][j] <= 0;
                end
            end
    end
    
assign o_sout = t_sreg[SHIFT_LENGTH-1];
    
endmodule
