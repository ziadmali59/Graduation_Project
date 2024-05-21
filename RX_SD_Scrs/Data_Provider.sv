`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2024 04:58:53 PM
// Design Name: 
// Module Name: Data_Provider
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


module Data_Provider(

input  logic  signed [15:0]i_FFT_REAL[15:0],
input  logic  signed [15:0]i_FFT_IMAGINARY[15:0],
input  logic   en,
input  logic   i_clk,
input  logic   i_FFT_Valid,
input  logic   i_DMRS_valid,
input  logic   [5:0] i_Isc,
output logic  signed [15:0] o_REM_output_REAL[11:0],
output logic  signed [15:0] o_REM_output_Imaginary[11:0],
output logic   o_valid,
output logic   i_Isc_Invalid
);
logic [3:0]count;
always_ff @(negedge i_clk ) begin
if(en)begin
    if(i_FFT_Valid )begin
    	case(i_Isc)
                6'b1100: begin
                o_REM_output_REAL[0]<=i_FFT_REAL[0];
                o_REM_output_REAL[1]<=i_FFT_REAL[1];
                o_REM_output_REAL[2]<=i_FFT_REAL[2];
                o_REM_output_REAL[3]<=16'b0;
                o_REM_output_REAL[4]<=16'b0;
                o_REM_output_REAL[5]<=16'b0;
                o_REM_output_REAL[6]<=16'b0;
                o_REM_output_REAL[7]<=16'b0;
                o_REM_output_REAL[8]<=16'b0;
                o_REM_output_REAL[9]<=16'b0;
                o_REM_output_REAL[10]<=16'b0;
                o_REM_output_REAL[11]<=16'b0;
              
                //
                o_REM_output_Imaginary[0]<=i_FFT_IMAGINARY[0];
                o_REM_output_Imaginary[1]<=i_FFT_IMAGINARY[1];
                o_REM_output_Imaginary[2]<=i_FFT_IMAGINARY[2];
                o_REM_output_Imaginary[3]<=16'b0;
                o_REM_output_Imaginary[4]<=16'b0;
                o_REM_output_Imaginary[5]<=16'b0;
                o_REM_output_Imaginary[6]<=16'b0;
                o_REM_output_Imaginary[7]<=16'b0;
                o_REM_output_Imaginary[8]<=16'b0;
                o_REM_output_Imaginary[9]<=16'b0;
                o_REM_output_Imaginary[10]<=16'b0;
                o_REM_output_Imaginary[11]<=16'b0;
           
            
                o_valid<=1;
                i_Isc_Invalid<=1;
                end
                6'b1101: begin
                o_REM_output_REAL[0]<=16'b0;
                o_REM_output_REAL[1]<=16'b0;
                o_REM_output_REAL[2]<=16'b0;
                o_REM_output_REAL[3]<=i_FFT_REAL[0];
                o_REM_output_REAL[4]<=i_FFT_REAL[1];
                o_REM_output_REAL[5]<=i_FFT_REAL[2];
                o_REM_output_REAL[6]<=16'b0;
                o_REM_output_REAL[7]<=16'b0;
                o_REM_output_REAL[8]<=16'b0;
                o_REM_output_REAL[9]<=16'b0;
                o_REM_output_REAL[10]<=16'b0;
                o_REM_output_REAL[11]<=16'b0;
                
                //
                o_REM_output_Imaginary[0]<=16'b0;
                o_REM_output_Imaginary[1]<=16'b0;
                o_REM_output_Imaginary[2]<=16'b0;
                o_REM_output_Imaginary[3]<=i_FFT_IMAGINARY[0];
                o_REM_output_Imaginary[4]<=i_FFT_IMAGINARY[1];
                o_REM_output_Imaginary[5]<=i_FFT_IMAGINARY[2];
                o_REM_output_Imaginary[6]<=16'b0;
                o_REM_output_Imaginary[7]<=16'b0;
                o_REM_output_Imaginary[8]<=16'b0;
                o_REM_output_Imaginary[9]<=16'b0;
                o_REM_output_Imaginary[10]<=16'b0;
                o_REM_output_Imaginary[11]<=16'b0;
                
                o_valid<=1;
        
                end
                6'b1110: begin
                o_REM_output_REAL[0]<=16'b0;
                o_REM_output_REAL[1]<=16'b0;
                o_REM_output_REAL[2]<=16'b0;
                o_REM_output_REAL[3]<=16'b0;
                o_REM_output_REAL[4]<=16'b0;
                o_REM_output_REAL[5]<=16'b0;
                o_REM_output_REAL[6]<=i_FFT_REAL[0];
                o_REM_output_REAL[7]<=i_FFT_REAL[1];
                o_REM_output_REAL[8]<=i_FFT_REAL[2];
                o_REM_output_REAL[9]<=16'b0;
                o_REM_output_REAL[10]<=16'b0;
                o_REM_output_REAL[11]<=16'b0;
               
                //
                o_REM_output_Imaginary[0]<=16'b0;
                o_REM_output_Imaginary[1]<=16'b0;
                o_REM_output_Imaginary[2]<=16'b0;
                o_REM_output_Imaginary[3]<=16'b0;
                o_REM_output_Imaginary[4]<=16'b0;
                o_REM_output_Imaginary[5]<=16'b0;
                o_REM_output_Imaginary[6]<=i_FFT_IMAGINARY[0];
                o_REM_output_Imaginary[7]<=i_FFT_IMAGINARY[1];
                o_REM_output_Imaginary[8]<=i_FFT_IMAGINARY[2];
                o_REM_output_Imaginary[9]<=16'b0;
                o_REM_output_Imaginary[10]<=16'b0;
                o_REM_output_Imaginary[11]<=16'b0;
             
                o_valid<=1;
                i_Isc_Invalid<=1;
                end
                6'b1111:begin
                o_REM_output_REAL[0]<=16'b0;
                o_REM_output_REAL[1]<=16'b0;
                o_REM_output_REAL[2]<=16'b0;
                o_REM_output_REAL[3]<=16'b0;
                o_REM_output_REAL[4]<=16'b0;
                o_REM_output_REAL[5]<=16'b0;
                o_REM_output_REAL[6]<=16'b0;
                o_REM_output_REAL[7]<=16'b0;
                o_REM_output_REAL[8]<=16'b0;
                o_REM_output_REAL[9]<=i_FFT_REAL[0];
                o_REM_output_REAL[10]<=i_FFT_REAL[1];
                o_REM_output_REAL[11]<=i_FFT_REAL[2];
          
                //
                o_REM_output_Imaginary[0]<=16'b0;
                o_REM_output_Imaginary[1]<=16'b0;
                o_REM_output_Imaginary[2]<=16'b0;
                o_REM_output_Imaginary[3]<=16'b0;
                o_REM_output_Imaginary[4]<=16'b0;
                o_REM_output_Imaginary[5]<=16'b0;
                o_REM_output_Imaginary[6]<=16'b0;
                o_REM_output_Imaginary[7]<=16'b0;
                o_REM_output_Imaginary[8]<=16'b0;
                o_REM_output_Imaginary[9]<=i_FFT_IMAGINARY[0];
                o_REM_output_Imaginary[10]<=i_FFT_IMAGINARY[1];
                o_REM_output_Imaginary[11]<=i_FFT_IMAGINARY[2];
               
                o_valid<=1;
                i_Isc_Invalid<=1;
                end
                6'b10000: begin
                o_REM_output_REAL[0]<=i_FFT_REAL[0];
                o_REM_output_REAL[1]<=i_FFT_REAL[1];
                o_REM_output_REAL[2]<=i_FFT_REAL[2];
                o_REM_output_REAL[3]<=i_FFT_REAL[3];
                o_REM_output_REAL[4]<=i_FFT_REAL[4];
                o_REM_output_REAL[5]<=i_FFT_REAL[5];
                o_REM_output_REAL[6]<=16'b0;
                o_REM_output_REAL[7]<=16'b0;
                o_REM_output_REAL[8]<=16'b0;
                o_REM_output_REAL[9]<=16'b0;
                o_REM_output_REAL[10]<=16'b0;
                o_REM_output_REAL[11]<=16'b0;
          
                //
                o_REM_output_Imaginary[0]<=i_FFT_IMAGINARY[0];
                o_REM_output_Imaginary[1]<=i_FFT_IMAGINARY[1];
                o_REM_output_Imaginary[2]<=i_FFT_IMAGINARY[2];
                o_REM_output_Imaginary[3]<=i_FFT_IMAGINARY[3];
                o_REM_output_Imaginary[4]<=i_FFT_IMAGINARY[4];
                o_REM_output_Imaginary[5]<=i_FFT_IMAGINARY[5];
                o_REM_output_Imaginary[6]<=16'b0;
                o_REM_output_Imaginary[7]<=16'b0;
                o_REM_output_Imaginary[8]<=16'b0;
                o_REM_output_Imaginary[9]<=16'b0;
                o_REM_output_Imaginary[10]<=16'b0;
                o_REM_output_Imaginary[11]<=16'b0;
              
                o_valid<=1;
                i_Isc_Invalid<=1;
                end
                6'b10001: begin
                o_REM_output_REAL[0]<=16'b0;
                o_REM_output_REAL[1]<=16'b0;
                o_REM_output_REAL[2]<=16'b0;
                o_REM_output_REAL[3]<=16'b0;
                o_REM_output_REAL[4]<=16'b0;
                o_REM_output_REAL[5]<=16'b0;
                o_REM_output_REAL[6]<=i_FFT_REAL[0];
                o_REM_output_REAL[7]<=i_FFT_REAL[1];
                o_REM_output_REAL[8]<=i_FFT_REAL[2];
                o_REM_output_REAL[9]<=i_FFT_REAL[3];
                o_REM_output_REAL[10]<=i_FFT_REAL[4];
                o_REM_output_REAL[11]<=i_FFT_REAL[5];
              
                //
                o_REM_output_Imaginary[0]<=16'b0;
                o_REM_output_Imaginary[1]<=16'b0;
                o_REM_output_Imaginary[2]<=16'b0;
                o_REM_output_Imaginary[3]<=16'b0;
                o_REM_output_Imaginary[4]<=16'b0;
                o_REM_output_Imaginary[5]<=16'b0;
                o_REM_output_Imaginary[6]<=i_FFT_IMAGINARY[0];
                o_REM_output_Imaginary[7]<=i_FFT_IMAGINARY[1];
                o_REM_output_Imaginary[8]<=i_FFT_IMAGINARY[2];
                o_REM_output_Imaginary[9]<=i_FFT_IMAGINARY[3];
                o_REM_output_Imaginary[10]<=i_FFT_IMAGINARY[4];
                o_REM_output_Imaginary[11]<=i_FFT_IMAGINARY[5];
            
                i_Isc_Invalid<=1;
                o_valid<=1;
                
                end
                6'b10010:   begin
                o_REM_output_REAL[0]<=i_FFT_REAL[0];
                o_REM_output_REAL[1]<=i_FFT_REAL[1];
                o_REM_output_REAL[2]<=i_FFT_REAL[2];
                o_REM_output_REAL[3]<=i_FFT_REAL[3];
                o_REM_output_REAL[4]<=i_FFT_REAL[4];
                o_REM_output_REAL[5]<=i_FFT_REAL[5];
                o_REM_output_REAL[6]<=i_FFT_REAL[6];
                o_REM_output_REAL[7]<=i_FFT_REAL[7];
                o_REM_output_REAL[8]<=i_FFT_REAL[8];
                o_REM_output_REAL[9]<=i_FFT_REAL[9];
                o_REM_output_REAL[10]<=i_FFT_REAL[10];
                o_REM_output_REAL[11]<=i_FFT_REAL[11];
          
                //
                o_REM_output_Imaginary[0]<=i_FFT_IMAGINARY[0];
                o_REM_output_Imaginary[1]<=i_FFT_IMAGINARY[1];
                o_REM_output_Imaginary[2]<=i_FFT_IMAGINARY[2];
                o_REM_output_Imaginary[3]<=i_FFT_IMAGINARY[3];
                o_REM_output_Imaginary[4]<=i_FFT_IMAGINARY[4];
                o_REM_output_Imaginary[5]<=i_FFT_IMAGINARY[5];
                o_REM_output_Imaginary[6]<=i_FFT_IMAGINARY[6];
                o_REM_output_Imaginary[7]<=i_FFT_IMAGINARY[7];
                o_REM_output_Imaginary[8]<=i_FFT_IMAGINARY[8];
                o_REM_output_Imaginary[9]<=i_FFT_IMAGINARY[9];
                o_REM_output_Imaginary[10]<=i_FFT_IMAGINARY[10];
                o_REM_output_Imaginary[11]<=i_FFT_IMAGINARY[11];
                i_Isc_Invalid<=1;
                o_valid<=1;
             
                end
                default: begin
                o_REM_output_REAL[0]<=16'b0;
                o_REM_output_REAL[1]<=16'b0;
                o_REM_output_REAL[2]<=16'b0;
                o_REM_output_REAL[3]<=16'b0;
                o_REM_output_REAL[4]<=16'b0;
                o_REM_output_REAL[5]<=16'b0;
                o_REM_output_REAL[6]<=16'b0;
                o_REM_output_REAL[7]<=16'b0;
                o_REM_output_REAL[8]<=16'b0;
                o_REM_output_REAL[9]<=16'b0;
                o_REM_output_REAL[10]<=16'b0;
                o_REM_output_REAL[11]<=16'b0;
              
                //
                o_REM_output_Imaginary[0]<=16'b0;
                o_REM_output_Imaginary[1]<=16'b0;
                o_REM_output_Imaginary[2]<=16'b0;
                o_REM_output_Imaginary[3]<=16'b0;
                o_REM_output_Imaginary[4]<=16'b0;
                o_REM_output_Imaginary[5]<=16'b0;
                o_REM_output_Imaginary[6]<=16'b0;
                o_REM_output_Imaginary[7]<=16'b0;
                o_REM_output_Imaginary[8]<=16'b0;
                o_REM_output_Imaginary[9]<=16'b0;
                o_REM_output_Imaginary[10]<=16'b0;
                o_REM_output_Imaginary[11]<=16'b0;
                i_Isc_Invalid<=0;
                o_valid<=0;
             
                end
            endcase
            end
           
                else begin
                o_REM_output_REAL[0]<=16'b0;
                o_REM_output_REAL[1]<=16'b0;
                o_REM_output_REAL[2]<=16'b0;
                o_REM_output_REAL[3]<=16'b0;
                o_REM_output_REAL[4]<=16'b0;
                o_REM_output_REAL[5]<=16'b0;
                o_REM_output_REAL[6]<=16'b0;
                o_REM_output_REAL[7]<=16'b0;
                o_REM_output_REAL[8]<=16'b0;
                o_REM_output_REAL[9]<=16'b0;
                o_REM_output_REAL[10]<=16'b0;
                o_REM_output_REAL[11]<=16'b0;
              
                //
                o_REM_output_Imaginary[0]<=16'b0;
                o_REM_output_Imaginary[1]<=16'b0;
                o_REM_output_Imaginary[2]<=16'b0;
                o_REM_output_Imaginary[3]<=16'b0;
                o_REM_output_Imaginary[4]<=16'b0;
                o_REM_output_Imaginary[5]<=16'b0;
                o_REM_output_Imaginary[6]<=16'b0;
                o_REM_output_Imaginary[7]<=16'b0;
                o_REM_output_Imaginary[8]<=16'b0;
                o_REM_output_Imaginary[9]<=16'b0;
                o_REM_output_Imaginary[10]<=16'b0;
                o_REM_output_Imaginary[11]<=16'b0;
                i_Isc_Invalid<=1;
                o_valid<=0;
              
                end
                end
                else begin
                o_REM_output_REAL[0]<=16'b0;
                o_REM_output_REAL[1]<=16'b0;
                o_REM_output_REAL[2]<=16'b0;
                o_REM_output_REAL[3]<=16'b0;
                o_REM_output_REAL[4]<=16'b0;
                o_REM_output_REAL[5]<=16'b0;
                o_REM_output_REAL[6]<=16'b0;
                o_REM_output_REAL[7]<=16'b0;
                o_REM_output_REAL[8]<=16'b0;
                o_REM_output_REAL[9]<=16'b0;
                o_REM_output_REAL[10]<=16'b0;
                o_REM_output_REAL[11]<=16'b0;
              
                //
                o_REM_output_Imaginary[0]<=16'b0;
                o_REM_output_Imaginary[1]<=16'b0;
                o_REM_output_Imaginary[2]<=16'b0;
                o_REM_output_Imaginary[3]<=16'b0;
                o_REM_output_Imaginary[4]<=16'b0;
                o_REM_output_Imaginary[5]<=16'b0;
                o_REM_output_Imaginary[6]<=16'b0;
                o_REM_output_Imaginary[7]<=16'b0;
                o_REM_output_Imaginary[8]<=16'b0;
                o_REM_output_Imaginary[9]<=16'b0;
                o_REM_output_Imaginary[10]<=16'b0;
                o_REM_output_Imaginary[11]<=16'b0;
                i_Isc_Invalid<=1;
                o_valid<=0;
              
                end
                end


endmodule


