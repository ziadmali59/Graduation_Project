/*
Project        : NB-IOT UPLINK
Standard doc.  : 
Module name    : j_mul_twid_rom_fft16
Dependancy     :
Design doc.    : 
References     : 
Description    : to store the twiddle factors
Owner          : Martina Magued
*/
module twid_rom_fft16 
#(parameter 			                        DATA_WIDTH	=	16,   //sizeeee????
                                          DOUBLE_DATA_WIDTH = 2*DATA_WIDTH, //for real and imaginary
                                          ADD_SIZE = 3
)(
    input logic i_clk_twid_rom_fft16,
   // input logic i_rst_n,
    //input logic i_start_twid_rom_fft16,
    input logic [ADD_SIZE-1:0] i_add_twid_rom_fft16,
    output logic [DATA_WIDTH-1:0] o_real_twid_rom_fft16,
    output logic [DATA_WIDTH-1:0] o_imag_twid_rom_fft16
    //output logic o_valid_twid_rom_fft16
);
//1,2,3,5,6,7
import "DPI-C" function real cos (real x);
import "DPI-C" function real sin (real x);

logic signed [6:0] t_twid_real [2**ADD_SIZE-1:0];
logic signed [6:0] t_twid_imag [2**ADD_SIZE-1:0];

// Function to calculate twiddle factors
function automatic logic [15:0] calculate_twid_real(int index);
   // real angle = (index * 2.0 * $clog2(ADD_SIZE-1) * $itor(3.14159265358979323846)) / 16;
   real angle = (index * 2.0 * $itor(3.14159265358979323846)) / 16;
    return $realtobits($cos(angle));
endfunction

function automatic logic [15:0] calculate_twid_imag(int index);
   // real angle = (index * 2.0 * $clog2(ADD_SIZE-1) * $itor(3.14159265358979323846)) / 16;
     real angle = (index * 2.0 * $itor(3.14159265358979323846)) / 16;
    return $realtobits(-$sin(angle));
endfunction

// Initialize the ROM with twiddle factors
initial begin
    for (int i = 0; i < 2**ADD_SIZE-1; i++) begin
        t_twid_real[i] = calculate_twid_real(i);
        t_twid_imag[i] = calculate_twid_imag(i);
    end
end

// Read the twiddle factor from ROM based on the address
always_ff @(posedge i_clk_twid_rom_fft16) begin// or negedge i_rst_n) begin
    /*if (!i_rst_n) begin
        o_real_twid_rom_fft16  <= '0;
        o_imag_twid_rom_fft16  <= '0;
        o_valid_twid_rom_fft16 <= '0;
    end
    else if(i_start_twid_rom_fft16) begin*/
        o_real_twid_rom_fft16 <= t_twid_real[i_add_twid_rom_fft16];
        o_imag_twid_rom_fft16 <= t_twid_imag[i_add_twid_rom_fft16];
        //o_valid_twid_rom_fft16 <= 1;
    //end
end

endmodule



