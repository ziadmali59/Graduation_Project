//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2024 09:42:25 PM
// Design Name: 
// Module Name: Counter_RM
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


module Counter_RM(
input    logic  i_clk,
input    logic  i_rst_n,
input    logic  i_enable,
input    logic  data_received,
input    logic  o_pilot,
//input    logic  i_FFT_valid,
//input    logic  i_dmrs_valid,
output   logic  [3:0] o_index,
output   logic  o_Write_done,
output   logic  [2:0] o_Repetition_count,
output   logic  o_valid_count,
output   logic  flag,
output   logic o_pilot_out
  );
  logic [3:0] o_count;
  logic [2:0] o_Repetition;
  always_ff @(posedge i_clk or negedge i_rst_n) begin
      if (!i_rst_n) begin
        o_count <= 4'b1;
        o_Write_done<=1'b0;
        o_Repetition<=1'b1;
        flag<=0;
        o_valid_count<=0;
        end
        else if (i_enable) begin
          //  if(i_FFT_valid) begin
                if(o_pilot )begin
                o_count <= o_count + 1'b1; 
                o_Write_done<=1'b0;
                o_Repetition<=o_Repetition;
                o_valid_count=1'b1;
                flag<=1;
                o_pilot_out<=1;
                end
                else if (o_count == 4'd15) begin // Check for reaching 15 (1111 in binary)
                  o_pilot_out<=0;
                  o_Write_done<=1'b1;
                  o_count <= 4'b1;
                  flag<=0;
                  o_Repetition<=o_Repetition+1'b1;
                  o_valid_count<=1'b0;
                end
                else if(data_received)begin
                o_count <= o_count + 1'b1; 
                o_Write_done<=1'b0;
                o_Repetition<=o_Repetition;
                o_valid_count=1'b1;
                flag<=1;
                o_pilot_out<=0;
                end
                else begin
                o_count<=o_count;
                o_Write_done<=1'b0;
                o_Repetition<=o_Repetition;
                o_valid_count=1'b0;
                o_pilot_out<=0;
                end
                
            end
//            else begin
//            o_count<=o_count;
//            o_Write_done<=0;
//            o_Repetition<=o_Repetition;
//            o_valid_count=1'b0;
//            end
//           end
        else begin
          o_count <= 4'b1; // Initialize to 1
          o_Write_done<=1'b0;
          o_Repetition<=1'b1;
          o_valid_count=1'b0;
          o_pilot_out<=0;
       end
        
       
    end
  assign o_index=o_count-1'b1;
  assign o_Repetition_count=o_Repetition-1'b1;
endmodule