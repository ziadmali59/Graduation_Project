`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2024 04:57:59 PM
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2024 04:56:46 PM
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


module Counter_RM (
input    logic  i_clk,
input    logic  i_rst_n,
input    logic  i_enable,
input    logic  i_FFT_valid,
input    logic  i_isc_valid,
input    logic  i_valid,
output   logic  [3:0] o_index,
output   logic  valid_count





  );
  
  
  logic [3:0] o_count;
  logic flag;
  always_ff @(posedge i_clk) begin
       if (!i_rst_n) begin
        o_count <= 4'b1; // Initialize to 0
        valid_count<=0;
       flag<=0;
        end
        else if (i_enable) begin
              if(i_valid)begin
                   o_count <= o_count + 1'b1; 
                   valid_count<=1;
                   flag<=1;
               end
               else if(flag)begin
               valid_count<=0;
               flag<=0;
               end
               else if(!i_FFT_valid || ! i_isc_valid) begin
                    o_count<=o_count;
                    valid_count<=0;
                    
                end
                else if (o_count == 4'b1111) begin // Check for reaching 15 (1111 in binary)
                  
                  o_count <= 4'b1;//
                  valid_count<=0;
                end
                
                else begin
                o_count<=o_count;
                valid_count<=0;
                end
                
            end
            else begin
            o_count<=1'b1;//
            valid_count<=0;
            end
        end
     
        
       
    
  assign o_index=o_count-1'b1;

endmodule


