/*
Project        : NB-IOT UPLINK
Standard doc.  : 
Module name    : fsm_est
Dependancy     :
Design doc.    : 
References     : 
Description    : controller for the channel estimation.
Owner          : Martina Magued
*/

/*package stuff;
  typedef enum logic [3:0] {
     Valid_1,
     Valid_2,
     Valid_3,
     Valid_4_Pilot, //3'b0011
     Valid_5,
     Valid_6,
     Valid_7,
     Not_Valid} o_valid_count;
endpackage
*/

module fsm_est  //import stuff::*;
(
input logic                                     i_clk_est,     
                                                i_rst_n,
                                         //     i_start_est ,
input  logic [2:0]	                            i_symbol_num, 
output logic [3:0]                              o_indx,
output logic [11:0]                             o_est_done ,//12 bits (1 for each subcarrier)
//output logic                                    o_done_est
output logic                                    o_rst_ser_par
);





// explicit binary encoding
typedef enum logic [4:0]        
{
H0= 5'b00000,
H1 = 5'b00001,
H2 = 5'b00010,
H3 = 5'b00011,
H4 = 5'b00100,
H5 = 5'b00101,
H6 = 5'b00110,

H7 = 5'b00111,
H8 = 5'b01000,
H9 = 5'b01001,
H10= 5'b01010,

H11 = 5'b01011,
/*H12 = 5'b01100,
H13 = 5'b01101,
H14 = 5'b01110,
H15 = 5'b01111,
H16 = 5'b10000,*/

READY= 5'b11000,
WAIT_INPUT= 5'b1101
    
} states;

states curr_state, next_state; 

// Current State Logic -- sequential logic 
always_ff @ (posedge i_clk_est or negedge i_rst_n) 
if (!i_rst_n)
curr_state <= WAIT_INPUT;         
else
curr_state <= next_state;


// Next State logic -- combinational logic 
always_comb begin

o_indx='0;
o_est_done='0;
//o_done_est='0;

o_rst_ser_par=1;

case (curr_state)

WAIT_INPUT: begin
    if (i_symbol_num==3'b100)//Valid_4_Pilot)//i_start_est) 
    begin
    o_rst_ser_par=0; //new 24/4
    next_state = H0; 
    end

    else
    next_state = WAIT_INPUT; 

    
end

H0: begin
    next_state = H1; 
    o_indx=4'b0000;
    o_est_done[0]=1;
end

H1: begin
    next_state = H2; 
    o_indx=4'b0001;
    o_est_done[1]=1;
end

H2: begin
    next_state = H3; 
    o_indx=4'b0010; 
    o_est_done[2]=1; 
end

H3: begin
    next_state = H4;
    o_indx=4'b0011; 
    o_est_done[3]=1;
end

H4: begin
    next_state = H5; 
    o_indx=4'b0100;
    o_est_done[4]=1;
end

H5: begin
    next_state = H6; 
    o_indx=4'b0101;
    o_est_done[5]=1;
end

H6: begin
    next_state = H7; 
    o_indx=4'b0110;
    o_est_done[6]=1;
end

H7: begin
    next_state = H8;
    o_indx=4'b0111; 
    o_est_done[7]=1;
end

H8: begin
    next_state = H9;
    o_indx=4'b1000; 
    o_est_done[8]=1;
end

H9: begin
    next_state = H10; 
    o_indx=4'b1001;
    o_est_done[9]=1;
end

H10: begin
    next_state = H11; 
    o_indx=4'b1010;
    o_est_done[10]=1;
end

H11: begin
    next_state = READY; 
    o_indx=4'b1011;
    o_est_done[11]=1;
end

READY:  begin
 if (i_symbol_num==3'b101)   //newww kanet dayman wait
    next_state = WAIT_INPUT;   
 else 
    next_state = READY;
end 
default: next_state = WAIT_INPUT; 

endcase
end


endmodule