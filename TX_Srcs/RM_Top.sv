//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2024 10:58:58 PM
// Design Name: 
// Module Name: RM_Top
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


module RM_Top(
input  logic	i_clk,
input  logic	i_rst_n,
input  logic    [5:0]i_Isc,
input  logic	i_FFT_Valid,
input  logic signed   [15:0]i_FFT_REAL[11:0],
input  logic    [2:0] i_Irep,
//
input  logic signed    [15:0]i_FFT_IMAGINARY[11:0],

input  logic signed    [15:0]i_DMRS_REAL[11:0],
//input  logic    i_start,
//
input  logic signed    [15:0]i_DMRS_IMAGINARY[11:0],


input  logic    i_DMRS_valid,

output logic signed    [15:0] o_REM_output_REAL[15:0],
output logic signed    [15:0] o_REM_output_Imaginary[15:0],
output logic 	o_valid_RM,
output logic    o_Stop_FFT,
output logic    o_valid_pilot

    );
 logic [2:0]o_Number_Repetition;
 logic rst_counter;
 logic enable_counter;
 logic Write_done;
 logic [3:0] address;
 logic flag;
 logic [2:0] repetition_count;
 logic rst_data_provider;
 logic enable_ram;
 logic signed[15:0]output_REAL[11:0];
 logic signed[15:0]output_Imaginary[11:0];
 logic signed[15:0] output_RAM_REAL [11:0];
 logic signed[15:0] output_RAM_Imaginary [11:0];
 logic o_valid;
 logic data_received;
 logic o_pilot;
 logic o_valid_count;
 logic repetition_valid;
 assign data_received= o_valid || repetition_valid;
MNPUSCH_identical MNPUSCH(
    .i_Irep(i_Irep),
    .o_Number_Repetition(o_Number_Repetition)
    );
    
  Counter_RM Counter(
    .i_clk(i_clk),
    .i_rst_n(rst_counter),
    .i_enable(enable_counter),
    //.i_dmrs_valid(i_DMRS_valid),
    .o_Write_done(Write_done),
   // .i_FFT_valid(i_FFT_Valid),
    .o_index(address),
    .data_received(data_received),
    .o_Repetition_count(repetition_count),
   // .o_valid_count(o_valid_count),
   .o_valid_count(o_valid_RM),
    .flag(flag),
    .o_pilot(o_pilot),
    .o_pilot_out(o_valid_pilot)
    );
    
   data_provider Data(
    
    .i_FFT_REAL(i_FFT_REAL),
    .i_FFT_IMAGINARY(i_FFT_IMAGINARY),
    .i_rst_n(rst_data_provider),
    .i_DMRS_REAL (i_DMRS_REAL),
    .i_clk(i_clk),
    .i_FFT_Valid(i_FFT_Valid),
    .i_DMRS_IMAGINARY(i_DMRS_IMAGINARY),
    .i_DMRS_valid(i_DMRS_valid),
    .i_index(address),
    .i_Isc(i_Isc),
    .o_REM_output_REAL(output_REAL),
    .o_REM_output_Imaginary(output_Imaginary),
    .o_valid(o_valid),
    .o_pilot(o_pilot)
    );
    Resource_Mapper_FSM FSM(
    .i_WRITE_done(Write_done),
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_FFT_Valid(i_FFT_Valid),
    .i_Number_Repetition(o_Number_Repetition),
    .repetition_count(repetition_count),
    .o_enable_counter(enable_counter),
    .o_rst_counter(rst_counter),
    .o_enable_RAM(enable_ram),
    .o_rst_data_provider(rst_data_provider),
    .o_Stop_FFT(o_Stop_FFT),
    .repetition_valid(repetition_valid)
    );
   

     RAM_IMAGINARY RAM0_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[0]),.dout(output_RAM_Imaginary[0])) ;
     RAM_IMAGINARY RAM1_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[1]),.dout(output_RAM_Imaginary[1])) ;
     RAM_IMAGINARY RAM2_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[2]),.dout(output_RAM_Imaginary[2])) ;
     RAM_IMAGINARY RAM3_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[3]),.dout(output_RAM_Imaginary[3])) ;
     RAM_IMAGINARY RAM4_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[4]),.dout(output_RAM_Imaginary[4])) ;
     RAM_IMAGINARY RAM5_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[5]),.dout(output_RAM_Imaginary[5])) ;
     RAM_IMAGINARY RAM6_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[6]),.dout(output_RAM_Imaginary[6])) ;
     RAM_IMAGINARY RAM7_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[7]),.dout(output_RAM_Imaginary[7])) ;
     RAM_IMAGINARY RAM8_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[8]),.dout(output_RAM_Imaginary[8])) ;
     RAM_IMAGINARY RAM9_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[9]),.dout(output_RAM_Imaginary[9])) ;
     RAM_IMAGINARY RAM10_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[10]),.dout(output_RAM_Imaginary[10])) ;
     RAM_IMAGINARY RAM11_Imaginary (.clk(i_clk), .we(o_valid), .en(enable_ram),.addr(address), .di(output_Imaginary[11]),.dout(output_RAM_Imaginary[11])) ;
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
              if((flag && o_valid_RM )|| o_Stop_FFT )begin
                {o_REM_output_Imaginary[0], o_REM_output_Imaginary[1], o_REM_output_Imaginary[2],o_REM_output_Imaginary[3],o_REM_output_Imaginary[4],o_REM_output_Imaginary[5],o_REM_output_Imaginary[6],o_REM_output_Imaginary[7],o_REM_output_Imaginary[8],o_REM_output_Imaginary[9],o_REM_output_Imaginary[10],o_REM_output_Imaginary[11]}={output_RAM_Imaginary[0],output_RAM_Imaginary[1],output_RAM_Imaginary[2],output_RAM_Imaginary[3],output_RAM_Imaginary[4],output_RAM_Imaginary[5],output_RAM_Imaginary[6],output_RAM_Imaginary[7],output_RAM_Imaginary[8],output_RAM_Imaginary[9],output_RAM_Imaginary[10],output_RAM_Imaginary[11]};
                {o_REM_output_REAL[0], o_REM_output_REAL[1],o_REM_output_REAL[2],o_REM_output_REAL[3],o_REM_output_REAL[4],o_REM_output_REAL[5],o_REM_output_REAL[6],o_REM_output_REAL[7],o_REM_output_REAL[8],o_REM_output_REAL[9],o_REM_output_REAL[10],o_REM_output_REAL[11]} = {output_RAM_REAL[0],output_RAM_REAL[1],output_RAM_REAL[2],output_RAM_REAL[3],output_RAM_REAL[4],output_RAM_REAL[5],output_RAM_REAL[6],output_RAM_REAL[7],output_RAM_REAL[8],output_RAM_REAL[9],output_RAM_REAL[10],output_RAM_REAL[11]};
              end
            end
          end






assign o_REM_output_REAL[12]=16'b0;
assign o_REM_output_REAL[13]=16'b0;
assign o_REM_output_REAL[14]=16'b0;
assign o_REM_output_REAL[15]=16'b0;
//
assign o_REM_output_Imaginary[12]=16'b0;
assign o_REM_output_Imaginary[13]=16'b0;
assign o_REM_output_Imaginary[14]=16'b0;
assign o_REM_output_Imaginary[15]=16'b0;

endmodule