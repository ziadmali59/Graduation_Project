`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2024 04:59:47 PM
// Design Name: 
// Module Name: Resource_Demapper_FSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Resource_Demapper_FSM(
input  logic i_clk,
input  logic i_rst_n,
input  logic i_FFT_Valid,
output logic o_enable_counter,
output logic o_rst_counter,
output logic o_enable_RAM,
output logic o_enable_data_provider

);

enum logic [1:0] {
    IDLE,
    WRITE,
    READ
  } state, next_state;

always_ff @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
      state <= IDLE;
    end else begin
      state <= next_state;  // State update remains here
    end
end

always_comb begin
    case (state)  // Use unique case for clarity and safety
        IDLE: begin 
            o_rst_counter = 0;
            o_enable_counter = 0;
            o_enable_RAM = 0;
       
            //o_Write = 0;
            o_enable_data_provider = 0;
            if(i_FFT_Valid) begin
                next_state = WRITE;
                o_enable_data_provider = 1;
                o_enable_RAM = 1;
                o_rst_counter = 1;
                o_enable_counter = 1;
            end else begin
                next_state = IDLE;
            end
        end
        WRITE: begin
            o_enable_data_provider = 1;
            o_enable_RAM = 1;
            o_rst_counter = 1;
            o_enable_counter = 1;
            next_state=WRITE;
           
       
        end        
        default: begin 
            o_rst_counter = 0;
            o_enable_counter = 0;
            o_enable_RAM = 0;
           // o_Write = 0;
            o_enable_data_provider = 0;
            if(i_FFT_Valid) begin
                next_state = WRITE;
            end else begin
                next_state = IDLE;
            end
        end
    endcase
end
endmodule
