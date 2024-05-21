/*
Project        : NB-IOT UPLINK
Standard doc.  : 
Module name    : fsm_equ
Dependancy     :
Design doc.    : 
References     : 
Description    : controller for the channel equalization.
Owner          : Martina Magued
*/

/*package stuff;
  typedef enum logic [3:0] {
     Valid_1,
     Valid_2,
     Valid_3,
     Valid_4_Pilot,
     Valid_5,
     Valid_6,
     Valid_7,
     Not_Valid} o_valid_count;
endpackage*/

/////////////////////////////////////////??????????????????????after SYM_7_11
module fsm_equ_wr 
(
input logic                                     i_clk_equ,     
                                                i_rst_n,
                                             //   i_start_equ, //from mariam
//input o_valid_count	                            i_symbol_num,                             
input logic [2:0]                               i_symbol_num, //from 0 to 6
//output logic [2:0]                              //o_state_num,  //from 0 to 6
output logic [3:0]                              o_wr_add //to write input in memory
//output logic                                    o_done_wr_1symbol
);


// explicit binary encoding
typedef enum logic [6:0]        
{
SYM_1_0=  7'b0000000,
SYM_1_1 = 7'b0000001,
SYM_1_2 = 7'b0000010,
SYM_1_3 = 7'b0000011,
SYM_1_4 = 7'b0000100,
SYM_1_5 = 7'b0000101,
SYM_1_6 = 7'b0000110,
SYM_1_7 = 7'b0000111,
SYM_1_8 = 7'b0001000,
SYM_1_9 = 7'b0001001,
SYM_1_10= 7'b0001010,
SYM_1_11= 7'b0001011,

SYM_2_0=  7'b0001100,
SYM_2_1 = 7'b0001101,
SYM_2_2 = 7'b0001110,
SYM_2_3 = 7'b0001111,
SYM_2_4 = 7'b0010000,
SYM_2_5 = 7'b0010001,
SYM_2_6 = 7'b0010010,
SYM_2_7 = 7'b0010011,
SYM_2_8 = 7'b0010100,
SYM_2_9 = 7'b0010101,
SYM_2_10= 7'b0010110,
SYM_2_11= 7'b0010111,

SYM_3_0 = 7'b0011000,
SYM_3_1 = 7'b0011001,
SYM_3_2 = 7'b0011010,
SYM_3_3 = 7'b0011011,
SYM_3_4 = 7'b0011100,
SYM_3_5 = 7'b0011101,
SYM_3_6 = 7'b0011110,
SYM_3_7 = 7'b0011111,
SYM_3_8 = 7'b0100000,
SYM_3_9 = 7'b0100001,
SYM_3_10 = 7'b0100010,
SYM_3_11 = 7'b0100011,

SYM_5_0 = 7'b0100100,
SYM_5_1 = 7'b0100101,
SYM_5_2 = 7'b0100110,
SYM_5_3 = 7'b0100111,
SYM_5_4 = 7'b0101000,
SYM_5_5 = 7'b0101001,
SYM_5_6 = 7'b0101010,
SYM_5_7 = 7'b0101011,
SYM_5_8 = 7'b0101100,
SYM_5_9 = 7'b0101101,
SYM_5_10= 7'b0101110,
SYM_5_11= 7'b0101111,

SYM_6_0 = 7'b0110000,
SYM_6_1 = 7'b0110001,
SYM_6_2 = 7'b0110010,
SYM_6_3 = 7'b0110011,
SYM_6_4 = 7'b0110100,
SYM_6_5 = 7'b0110101,
SYM_6_6 = 7'b0110110,
SYM_6_7 = 7'b0110111,
SYM_6_8 = 7'b0111000,
SYM_6_9 = 7'b0111001,
SYM_6_10= 7'b0111010,
SYM_6_11= 7'b0111011,

SYM_7_0 = 7'b0111100,
SYM_7_1 = 7'b0111101,
SYM_7_2 = 7'b0111110,
SYM_7_3 = 7'b0111111,
SYM_7_4 = 7'b1000000,
SYM_7_5 = 7'b1000001,
SYM_7_6 = 7'b1000010,
SYM_7_7 = 7'b1000011,
SYM_7_8 = 7'b1000100,
SYM_7_9 = 7'b1000101,
SYM_7_10= 7'b1000110,
SYM_7_11= 7'b1000111,

IDLE= 7'b1001000,
READY=7'b1001001
  
} states;

states curr_state, next_state; 

// Current State Logic -- sequential logic 
always_ff @ (posedge i_clk_equ or negedge i_rst_n) 
if (!i_rst_n)
curr_state <= IDLE;         
else
curr_state <= next_state;


// Next State logic -- combinational logic 
always_comb begin

//o_indx='0;
//o_done_equ='0;

case (curr_state)

IDLE: begin
    if (i_symbol_num==3'b001)//i_start_equ)//Valid_1
    next_state = SYM_1_0; 

    else
    next_state = IDLE; 
end

SYM_1_0: begin
    next_state = SYM_1_1; 
end

SYM_1_1: begin
    next_state = SYM_1_2; 
end

SYM_1_2: begin
    next_state = SYM_1_3; 
end

SYM_1_3: begin
    next_state = SYM_1_4; 
end

SYM_1_4: begin
    next_state = SYM_1_5; 
end

SYM_1_5: begin
    next_state = SYM_1_6; 
end

SYM_1_6: begin
    next_state = SYM_1_7; 
end

SYM_1_7: begin
    next_state = SYM_1_8;  
end

SYM_1_8: begin
    next_state = SYM_1_9; 
end

SYM_1_9: begin
    next_state = SYM_1_10; 
end

SYM_1_10: begin
    next_state = SYM_1_11; 
end

SYM_1_11: begin
    if (i_symbol_num==3'b010)//i_start_equ)//Valid_2)//i_start_equ) 
        next_state = SYM_2_0;
    else
        next_state = SYM_1_11; 
end

SYM_2_0: begin
    next_state = SYM_2_1; 
end

SYM_2_1: begin
    next_state = SYM_2_2; 
end

SYM_2_2: begin
    next_state = SYM_2_3; 
end

SYM_2_3: begin
    next_state = SYM_2_4; 
end

SYM_2_4: begin
    next_state = SYM_2_5; 
end

SYM_2_5: begin
    next_state = SYM_2_6; 
end

SYM_2_6: begin
    next_state = SYM_2_7; 
end

SYM_2_7: begin
    next_state = SYM_2_8; 
end

SYM_2_8: begin
    next_state = SYM_2_9; 
end

SYM_2_9: begin
    next_state = SYM_2_10; 
end

SYM_2_10: begin
    next_state = SYM_2_11;  
end

SYM_2_11: begin
    if (i_symbol_num==3'b011)//i_start_equ)//Valid_3)//i_start_equ) 
        next_state = SYM_3_0;
    else
    next_state = SYM_2_11; 
end

SYM_3_0: begin
    next_state = SYM_3_1; 
end

SYM_3_1: begin
    next_state = SYM_3_2; 
end

SYM_3_2: begin
    next_state = SYM_3_3; 
end

SYM_3_3: begin
    next_state = SYM_3_4; 
end

SYM_3_4: begin
    next_state = SYM_3_5; 
end

SYM_3_5: begin
    next_state = SYM_3_6; 
end

SYM_3_6: begin
    next_state = SYM_3_7; 
end

SYM_3_7: begin
    next_state = SYM_3_8; 
end

SYM_3_8: begin
    next_state = SYM_3_9; 
end

SYM_3_9: begin
    next_state = SYM_3_10; 
end

SYM_3_10: begin
    next_state = SYM_3_11; 
end

SYM_3_11: begin
    if (i_symbol_num==3'b101)//i_start_equ)//Valid_5)//i_start_equ) 
        next_state = SYM_5_0;
    else
        next_state = SYM_3_11; 
end

SYM_5_0: begin
    next_state = SYM_5_1; 
end

SYM_5_1: begin
    next_state = SYM_5_2; 
end

SYM_5_2: begin
    next_state = SYM_5_3; 
end

SYM_5_3: begin
    next_state = SYM_5_4; 
end

SYM_5_4: begin
    next_state = SYM_5_5; 
end

SYM_5_5: begin
    next_state = SYM_5_6; 
end

SYM_5_6: begin
    next_state = SYM_5_7; 
end

SYM_5_7: begin
    next_state = SYM_5_8; 
end

SYM_5_8: begin
    next_state = SYM_5_9; 
end

SYM_5_9: begin
    next_state = SYM_5_10; 
end

SYM_5_10: begin
    next_state = SYM_5_11; 
end

SYM_5_11: begin
    if (i_symbol_num==3'b110)//i_start_equ)//Valid_6)//i_start_equ) 
        next_state = SYM_6_0;
    else
        next_state = SYM_5_11; 
end

SYM_6_0: begin
    next_state = SYM_6_1; 
end

SYM_6_1: begin
    next_state = SYM_6_2; 
end

SYM_6_2: begin
    next_state = SYM_6_3; 
end

SYM_6_3: begin
    next_state = SYM_6_4; 
end

SYM_6_4: begin
    next_state = SYM_6_5; 
end

SYM_6_5: begin
    next_state = SYM_6_6; 
end

SYM_6_6: begin
    next_state = SYM_6_7; 
end

SYM_6_7: begin
    next_state = SYM_6_8; 
end

SYM_6_8: begin
    next_state = SYM_6_9; 
end

SYM_6_9: begin
    next_state = SYM_6_10; 
end

SYM_6_10: begin
    next_state = SYM_6_11; 
end

SYM_6_11: begin
    if (i_symbol_num==3'b111)//i_start_equ)//Valid_7)//i_start_equ) 
        next_state = SYM_7_0;
    else
        next_state = SYM_6_11; 
end

SYM_7_0: begin
    next_state = SYM_7_1; 
end

SYM_7_1: begin
    next_state = SYM_7_2; 
end

SYM_7_2: begin
    next_state = SYM_7_3; 
end

SYM_7_3: begin
    next_state = SYM_7_4; 
end

SYM_7_4: begin
    next_state = SYM_7_5; 
end

SYM_7_5: begin
    next_state = SYM_7_6; 
end

SYM_7_6: begin
    next_state = SYM_7_7; 
end

SYM_7_7: begin
    next_state = SYM_7_8; 
end

SYM_7_8: begin
    next_state = SYM_7_9; 
end

SYM_7_9: begin
    next_state = SYM_7_10; 
end

SYM_7_10: begin
    next_state = SYM_7_11; 
end

SYM_7_11: begin
   /* if (i_start_equ)            //////////////////////???????????????????????????????
        next_state = READY;
    else*/
        next_state = IDLE; 
end

/*READY:  begin

    next_state = IDLE	; 
    //end
end */
default: next_state = IDLE; 

endcase
end

// FSM outputs - combinational logic
always_comb begin
    o_wr_add=4'b0000;
 //lesaaaaaaa defaultsssssssssssssss/////////////////////

case (curr_state)
SYM_1_0: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0000;
end
SYM_1_1: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0001;
end
SYM_1_2: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0010;
end
SYM_1_3: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0011;
end
SYM_1_4: begin
    //o_state_num=3'b1000;
    o_wr_add=4'b0100;
end
SYM_1_5: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0101;
end
SYM_1_6: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0110;
end
SYM_1_7: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0111;
end
SYM_1_8: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1000;
end
SYM_1_9: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1001;
end
SYM_1_10: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1010;
end
SYM_1_11: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1011;
end

SYM_2_0: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0000;
end
SYM_2_1: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0001;
end
SYM_2_2: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0010;
end
SYM_2_3: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0011;
end
SYM_2_4: begin
    //o_state_num=3'b1000;
    o_wr_add=4'b0100;
end
SYM_2_5: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0101;
end
SYM_2_6: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0110;
end
SYM_2_7: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0111;
end
SYM_2_8: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1000;
end
SYM_2_9: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1001;
end
SYM_2_10: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1010;
end
SYM_2_11: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1011;
end

SYM_3_0: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0000;
end
SYM_3_1: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0001;
end
SYM_3_2: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0010;
end
SYM_3_3: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0011;
end
SYM_3_4: begin
    //o_state_num=3'b1000;
    o_wr_add=4'b0100;
end
SYM_3_5: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0101;
end
SYM_3_6: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0110;
end
SYM_3_7: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0111;
end
SYM_3_8: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1000;
end
SYM_3_9: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1001;
end
SYM_3_10: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1010;
end
SYM_3_11: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1011;
end

SYM_5_0: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0000;
end

SYM_5_1: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0001;
end

SYM_5_2: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0010;
end

SYM_5_3: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0011;
end

SYM_5_4: begin
    //o_state_num=3'b1000;
    o_wr_add=4'b0100;
end

SYM_5_5: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0101;
end

SYM_5_6: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0110;
end

SYM_5_7: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0111;
end

SYM_5_8: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1000;
end

SYM_5_9: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1001;
end

SYM_5_10: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1010;
end

SYM_5_11: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1011;
end

SYM_6_0: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0000;
end

SYM_6_1: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0001;
end

SYM_6_2: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0010;
end

SYM_6_3: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0011;
end

SYM_6_4: begin
    //o_state_num=3'b1000;
    o_wr_add=4'b0100;
end

SYM_6_5: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0101;
end

SYM_6_6: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0110;
end

SYM_6_7: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0111;
end

SYM_6_8: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1000;
end

SYM_6_9: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1001;
end

SYM_6_10: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1010;
end

SYM_6_11: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1011;
end

SYM_7_0: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0000;
end

SYM_7_1: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0001;
end

SYM_7_2: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0010;
end

SYM_7_3: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0011;
end

SYM_7_4: begin
    //o_state_num=3'b1000;
    o_wr_add=4'b0100;
end

SYM_7_5: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0101;
end

SYM_7_6: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0110;
end

SYM_7_7: begin
    //o_state_num=3'b001;
    o_wr_add=4'b0111;
end

SYM_7_8: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1000;
end

SYM_7_9: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1001;
end

SYM_7_10: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1010;
end

SYM_7_11: begin
    //o_state_num=3'b001;
    o_wr_add=4'b1011;
end

/*READY:  begin
//////////////////////////////////////////////lesaa
//o_done_wr_1symbol=1;
end*/

default begin
end
endcase
end
endmodule