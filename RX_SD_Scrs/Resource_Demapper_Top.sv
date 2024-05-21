`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2024 04:54:45 PM
// Design Name: 
// Module Name: Resource_Demapper_Top
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


module Resource_Demapper_Top(
input  logic	      i_clk,
input  logic	      i_rst_n,
input  logic          [5:0]i_Isc,
input  logic	      i_FFT_Valid,
input  logic signed   [15:0]i_FFT_REAL[15:0],

//
input  logic signed   [15:0]i_FFT_IMAGINARY[15:0],
output logic signed   [15:0] o_REM_output_REAL[11:0],
output logic signed   [15:0] o_REM_output_Imaginary[11:0],
output  logic         [2:0] o_Valid_Count,
output  logic         o_valid_reg


    );
    


 logic rst_counter;
 logic enable_counter;
 //logic Write_done;
 logic [3:0] address;
 logic enable_data_provider;
 logic enable_ram;
 logic signed [15:0]output_REAL[11:0];
 logic signed [15:0]output_Imaginary[11:0];
 logic signed [15:0]output_RAM_REAL[11:0];
 logic signed [15:0]output_RAM_Imaginary[11:0];
 logic o_valid;
 logic Isc_valid;
 logic valid_count;
 
always_comb begin
    if( !Isc_valid ||(address<1)) begin
    o_Valid_Count=4'b0;
    end
    else begin
     case (address[2:0]-1'b1)
        3'b000, 3'b111: begin
            o_Valid_Count =4'b1;
        end
        3'b001: begin
            o_Valid_Count =4'b10 ;
        end
        3'b010: begin
            o_Valid_Count = 4'b11;
        end
        3'b011: begin
            o_Valid_Count = 4'b100;
        end
        3'b100: begin
            o_Valid_Count = 4'b101;
        end
        3'b101: begin
            o_Valid_Count =4'b110 ;
        end
        3'b110: begin
            o_Valid_Count = 4'b111;
        end
    endcase

    end
    end
  
     
     



  Counter_RM Counter_RM(
    .i_clk(i_clk),
    .i_rst_n(rst_counter),
    .i_enable(enable_counter),
    .i_FFT_valid(i_FFT_Valid),
    .i_isc_valid(Isc_valid),
    .i_valid(o_valid),
    .valid_count(valid_count),
    .o_index(address)
    
   
    );
    
   Data_Provider Data(
    
    .i_FFT_REAL(i_FFT_REAL),
    .i_FFT_IMAGINARY(i_FFT_IMAGINARY),
    .en( enable_data_provider),
    .i_clk(i_clk),
    .i_FFT_Valid(i_FFT_Valid),
    .i_Isc(i_Isc),
    .o_REM_output_REAL(output_REAL),
    .o_REM_output_Imaginary(output_Imaginary),
    .o_valid(o_valid),
    .i_Isc_Invalid(Isc_valid)
    );
    Resource_Demapper_FSM FSM(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_FFT_Valid(i_FFT_Valid),
    .o_enable_counter(enable_counter),
    .o_rst_counter(rst_counter),
    .o_enable_RAM(enable_ram),
    .o_enable_data_provider(enable_data_provider)
   
    );
     RAM_Imaginary RAM0_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[0]),.dout(output_RAM_Imaginary[0])) ;
     RAM_Imaginary RAM1_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[1]),.dout(output_RAM_Imaginary[1])) ;
     RAM_Imaginary RAM2_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[2]),.dout(output_RAM_Imaginary[2])) ;
     RAM_Imaginary RAM3_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[3]),.dout(output_RAM_Imaginary[3])) ;
     RAM_Imaginary RAM4_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[4]),.dout(output_RAM_Imaginary[4])) ;
     RAM_Imaginary RAM5_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[5]),.dout(output_RAM_Imaginary[5])) ;
     RAM_Imaginary RAM6_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[6]),.dout(output_RAM_Imaginary[6])) ;
     RAM_Imaginary RAM7_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[7]),.dout(output_RAM_Imaginary[7])) ;
     RAM_Imaginary RAM8_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[8]),.dout(output_RAM_Imaginary[8])) ;
     RAM_Imaginary RAM9_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[9]),.dout(output_RAM_Imaginary[9])) ;
     RAM_Imaginary RAM10_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[10]),.dout(output_RAM_Imaginary[10])) ;
     RAM_Imaginary RAM11_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[11]),.dout(output_RAM_Imaginary[11])) ;
     RAM_REAL RAM0_REAL (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_REAL[0]),.dout(output_RAM_REAL[0])) ;
     RAM_REAL RAM1_REAL (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_REAL[1]),.dout(output_RAM_REAL[1])) ;
     RAM_REAL RAM2_REAL (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_REAL[2]),.dout(output_RAM_REAL[2])) ;
     RAM_REAL RAM3_REAL (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_REAL[3]),.dout(output_RAM_REAL[3])) ;
     RAM_REAL RAM4_REAL (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_REAL[4]),.dout(output_RAM_REAL[4])) ;
     RAM_REAL RAM5_REAL (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_REAL[5]),.dout(output_RAM_REAL[5])) ;
     RAM_REAL RAM6_REAL (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_REAL[6]),.dout(output_RAM_REAL[6])) ;
     RAM_REAL RAM7_REAL (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_REAL[7]),.dout(output_RAM_REAL[7])) ;
     RAM_REAL RAM8_REAL (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_REAL[8]),.dout(output_RAM_REAL[8])) ;
     RAM_REAL RAM9_REAL (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_REAL[9]),.dout(output_RAM_REAL[9])) ;
     RAM_REAL RAM10_REAL (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_REAL[10]),.dout(output_RAM_REAL[10])) ;
     RAM_REAL RAM11_REAL (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_REAL[11]),.dout(output_RAM_REAL[11])) ;
     
     always_comb begin
                 // Default assignments
                 {o_REM_output_Imaginary[0], o_REM_output_Imaginary[1], o_REM_output_Imaginary[2],o_REM_output_Imaginary[3],o_REM_output_Imaginary[4],o_REM_output_Imaginary[5],o_REM_output_Imaginary[6],o_REM_output_Imaginary[7],o_REM_output_Imaginary[8],o_REM_output_Imaginary[9],o_REM_output_Imaginary[10],o_REM_output_Imaginary[11]} = {16'b0, 16'b0,16'b0,16'b0,16'b0,16'b0,16'b0,16'b0,16'b0,16'b0,16'b0,16'b0};
                 
                 {o_REM_output_REAL[0], o_REM_output_REAL[1],o_REM_output_REAL[2],o_REM_output_REAL[3],o_REM_output_REAL[4],o_REM_output_REAL[5],o_REM_output_REAL[6],o_REM_output_REAL[7],o_REM_output_REAL[8],o_REM_output_REAL[9],o_REM_output_REAL[10],o_REM_output_REAL[11]} = {16'b0, 16'b0,16'b0,16'b0,16'b0,16'b0,16'b0,16'b0,16'b0,16'b0,16'b0,16'b0};
               
         if(i_rst_n)begin
                      if(  valid_count)begin//Isc_valid  &&o_valid &&
                        {o_REM_output_Imaginary[0], o_REM_output_Imaginary[1], o_REM_output_Imaginary[2],o_REM_output_Imaginary[3],o_REM_output_Imaginary[4],o_REM_output_Imaginary[5],o_REM_output_Imaginary[6],o_REM_output_Imaginary[7],o_REM_output_Imaginary[8],o_REM_output_Imaginary[9],o_REM_output_Imaginary[10],o_REM_output_Imaginary[11]}={output_RAM_Imaginary[0],output_RAM_Imaginary[1],output_RAM_Imaginary[2],output_RAM_Imaginary[3],output_RAM_Imaginary[4],output_RAM_Imaginary[5],output_RAM_Imaginary[6],output_RAM_Imaginary[7],output_RAM_Imaginary[8],output_RAM_Imaginary[9],output_RAM_Imaginary[10],output_RAM_Imaginary[11]};
                        {o_REM_output_REAL[0], o_REM_output_REAL[1],o_REM_output_REAL[2],o_REM_output_REAL[3],o_REM_output_REAL[4],o_REM_output_REAL[5],o_REM_output_REAL[6],o_REM_output_REAL[7],o_REM_output_REAL[8],o_REM_output_REAL[9],o_REM_output_REAL[10],o_REM_output_REAL[11]} = {output_RAM_REAL[0],output_RAM_REAL[1],output_RAM_REAL[2],output_RAM_REAL[3],output_RAM_REAL[4],output_RAM_REAL[5],output_RAM_REAL[6],output_RAM_REAL[7],output_RAM_REAL[8],output_RAM_REAL[9],output_RAM_REAL[10],output_RAM_REAL[11]};
                        
                      end
                    end
                  end
        always_comb begin
        if(valid_count)
         o_valid_reg=1;
        else
          o_valid_reg=0;
        end

    
     

 
endmodule