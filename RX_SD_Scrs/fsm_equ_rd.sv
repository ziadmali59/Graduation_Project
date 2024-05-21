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



module fsm_equ_rd
(
input logic                                     i_clk_equ,     
                                                i_rst_n,
input logic                                     i_div_done,
input logic                                     i_done_equ_one_symbol,
input logic                                     i_est_done_1st_symbol,

input logic [2:0]                               i_symbol_num, //new

output logic [2:0]                              o_state_num,  //from 1 to 7
//output logic                                  o_rst_ser_par,
output logic [3:0]                              o_rd_add,
//output logic [3:0]                              //o_rd_add_out, //to out the final output from the memory
output logic                                    o_done_equ_7symbols,
output logic                                    o_start_div
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
READY=7'b1001001,
DUMMY = 7'b1001010,
DUMMY_2 = 7'b1001011,
DUMMY_3 = 7'b1001100
  
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


case (curr_state)

IDLE: begin
    if (i_est_done_1st_symbol) 
    next_state = SYM_1_0; 

    else
    next_state = IDLE; 
end

SYM_1_0: begin
    if(i_div_done)
    next_state = SYM_1_1; 
    else
    next_state = SYM_1_0; 
end

SYM_1_1: begin
    if(i_div_done)
    next_state = SYM_1_2; 
    else
    next_state = SYM_1_1; 
end

SYM_1_2: begin
    if(i_div_done)
    next_state = SYM_1_3; 
    else
    next_state = SYM_1_2; 
end

SYM_1_3: begin
    if(i_div_done)
    next_state = SYM_1_4; 
    else
    next_state = SYM_1_3; 
end

SYM_1_4: begin
    if(i_div_done)
    next_state = SYM_1_5; 
    else
    next_state = SYM_1_4; 
end

SYM_1_5: begin
    if(i_div_done)
    next_state = SYM_1_6; 
    else
    next_state = SYM_1_5; 
end

SYM_1_6: begin
    if(i_div_done)
    next_state = SYM_1_7; 
    else
    next_state = SYM_1_6; 
end

SYM_1_7: begin
    if(i_div_done)
    next_state = SYM_1_8; 
    else
    next_state = SYM_1_7; 
end

SYM_1_8: begin
    if(i_div_done)
    next_state = SYM_1_9; 
    else
    next_state = SYM_1_8; 
end

SYM_1_9: begin
    if(i_div_done)
    next_state = SYM_1_10; 
    else
    next_state = SYM_1_9; 
end

SYM_1_10: begin
    if(i_div_done)
    next_state = SYM_1_11; 
    else
    next_state = SYM_1_10; 
end

SYM_1_11: begin
    if(i_done_equ_one_symbol)
    next_state = SYM_2_0; 
    else
    next_state = SYM_1_11; 
end

SYM_2_0: begin
    if(i_div_done)
    next_state = SYM_2_1; 
    else
    next_state = SYM_2_0; 
end

SYM_2_1: begin
    if(i_div_done)
    next_state = SYM_2_2; 
    else
    next_state = SYM_2_1; 
end

SYM_2_2: begin
    if(i_div_done)
    next_state = SYM_2_3; 
    else
    next_state = SYM_2_2; 
end

SYM_2_3: begin
    if(i_div_done)
    next_state = SYM_2_4; 
    else
    next_state = SYM_2_3; 
end

SYM_2_4: begin
    if(i_div_done)
    next_state = SYM_2_5; 
    else
    next_state = SYM_2_4; 
end

SYM_2_5: begin
    if(i_div_done)
    next_state = SYM_2_6; 
    else
    next_state = SYM_2_5; 
end

SYM_2_6: begin
    if(i_div_done)
    next_state = SYM_2_7; 
    else
    next_state = SYM_2_6; 
end

SYM_2_7: begin
    if(i_div_done)
    next_state = SYM_2_8; 
    else
    next_state = SYM_2_7; 
end

SYM_2_8: begin
    if(i_div_done)
    next_state = SYM_2_9; 
    else
    next_state = SYM_2_8; 
end

SYM_2_9: begin
    if(i_div_done)
    next_state = SYM_2_10; 
    else
    next_state = SYM_2_9; 
end

SYM_2_10: begin
    if(i_div_done)
    next_state = SYM_2_11; 
    else
    next_state = SYM_2_10; 
end

SYM_2_11: begin
    if(i_done_equ_one_symbol)
    next_state = SYM_3_0; 
    else
    next_state = SYM_2_11; 
end

SYM_3_0: begin
    if(i_div_done)
    next_state = SYM_3_1; 
    else
    next_state = SYM_3_0; 
end

SYM_3_1: begin
    if(i_div_done)
    next_state = SYM_3_2; 
    else
    next_state = SYM_3_1; 
end

SYM_3_2: begin
    if(i_div_done)
    next_state = SYM_3_3; 
    else
    next_state = SYM_3_2; 
end

SYM_3_3: begin
    if(i_div_done)
    next_state = SYM_3_4; 
    else
    next_state = SYM_3_3; 
end

SYM_3_4: begin
    if(i_div_done)
    next_state = SYM_3_5; 
    else
    next_state = SYM_3_4; 
end

SYM_3_5: begin
    if(i_div_done)
    next_state = SYM_3_6; 
    else
    next_state = SYM_3_5; 
end

SYM_3_6: begin
    if(i_div_done)
    next_state = SYM_3_7; 
    else
    next_state = SYM_3_6; 
end

SYM_3_7: begin
    if(i_div_done)
    next_state = SYM_3_8; 
    else
    next_state = SYM_3_7; 
end

SYM_3_8: begin
    if(i_div_done)
    next_state = SYM_3_9; 
    else
    next_state = SYM_3_8; 
end

SYM_3_9: begin
    if(i_div_done)
    next_state = SYM_3_10; 
    else
    next_state = SYM_3_9; 
end

SYM_3_10: begin
    if(i_div_done)
    next_state = SYM_3_11; 
    else
    next_state = SYM_3_10; 
end

SYM_3_11: begin
    if(i_done_equ_one_symbol)
    next_state = SYM_5_0; 
    else
    next_state = SYM_3_11; 
end

SYM_5_0: begin
    if(i_div_done)
        next_state = SYM_5_1; 
    else
        next_state = SYM_5_0; 
end

SYM_5_1: begin
    if(i_div_done)
        next_state = SYM_5_2; 
    else
        next_state = SYM_5_1; 
end

SYM_5_2: begin
    if(i_div_done)
        next_state = SYM_5_3; 
    else
        next_state = SYM_5_2; 
end

SYM_5_3: begin
    if(i_div_done)
        next_state = SYM_5_4; 
    else
        next_state = SYM_5_3; 
end

SYM_5_4: begin
    if(i_div_done)
        next_state = SYM_5_5; 
    else
        next_state = SYM_5_4; 
end

SYM_5_5: begin
    if(i_div_done)
        next_state = SYM_5_6; 
    else
        next_state = SYM_5_5; 
end

SYM_5_6: begin
    if(i_div_done)
        next_state = SYM_5_7; 
    else
        next_state = SYM_5_6; 
end

SYM_5_7: begin
    if(i_div_done)
        next_state = SYM_5_8; 
    else
        next_state = SYM_5_7; 
end

SYM_5_8: begin
    if(i_div_done)
        next_state = SYM_5_9; 
    else
        next_state = SYM_5_8; 
end

SYM_5_9: begin
    if(i_div_done)
        next_state = SYM_5_10; 
    else
        next_state = SYM_5_9; 
end

SYM_5_10: begin
    if(i_div_done)
        next_state = SYM_5_11; 
    else
        next_state = SYM_5_10; 
end

SYM_5_11: begin
    if(i_done_equ_one_symbol) //new kant done bs 15/5
        next_state = DUMMY; 
    else
        next_state = SYM_5_11; 
end
DUMMY : begin
    if(i_symbol_num == 3'b110)
        next_state = SYM_6_0;
    else
        next_state = DUMMY; 
end

SYM_6_0: begin
    if(i_div_done)
        next_state = SYM_6_1; 
    else
        next_state = SYM_6_0; 
end

SYM_6_1: begin
    if(i_div_done)
        next_state = SYM_6_2; 
    else
        next_state = SYM_6_1; 
end

SYM_6_2: begin
    if(i_div_done)
        next_state = SYM_6_3; 
    else
        next_state = SYM_6_2; 
end

SYM_6_3: begin
    if(i_div_done)
        next_state = SYM_6_4; 
    else
        next_state = SYM_6_3; 
end

SYM_6_4: begin
    if(i_div_done)
        next_state = SYM_6_5; 
    else
        next_state = SYM_6_4; 
end

SYM_6_5: begin
    if(i_div_done)
        next_state = SYM_6_6; 
    else
        next_state = SYM_6_5; 
end

SYM_6_6: begin
    if(i_div_done)
        next_state = SYM_6_7; 
    else
        next_state = SYM_6_6; 
end

SYM_6_7: begin
    if(i_div_done)
        next_state = SYM_6_8; 
    else
        next_state = SYM_6_7; 
end

SYM_6_8: begin
    if(i_div_done)
        next_state = SYM_6_9; 
    else
        next_state = SYM_6_8; 
end

SYM_6_9: begin
    if(i_div_done)
        next_state = SYM_6_10; 
    else
        next_state = SYM_6_9; 
end

SYM_6_10: begin
    if(i_div_done)
        next_state = SYM_6_11; 
    else
        next_state = SYM_6_10; 
end


SYM_6_11: begin
    if(i_done_equ_one_symbol) //new kant done bs 15/5
        next_state = DUMMY_2; 
    else
        next_state = SYM_6_11; 
end
DUMMY_2 : begin
    if(i_symbol_num == 3'b111)
        next_state = SYM_7_0;
    else
        next_state = DUMMY_2; 
end

SYM_7_0: begin
    if(i_div_done)
        next_state = SYM_7_1; 
    else
        next_state = SYM_7_0; 
end

SYM_7_1: begin
    if(i_div_done)
        next_state = SYM_7_2; 
    else
        next_state = SYM_7_1; 
end

SYM_7_2: begin
    if(i_div_done)
        next_state = SYM_7_3; 
    else
        next_state = SYM_7_2; 
end

SYM_7_3: begin
    if(i_div_done)
        next_state = SYM_7_4; 
    else
        next_state = SYM_7_3; 
end

SYM_7_4: begin
    if(i_div_done)
        next_state = SYM_7_5; 
    else
        next_state = SYM_7_4; 
end

SYM_7_5: begin
    if(i_div_done)
        next_state = SYM_7_6; 
    else
        next_state = SYM_7_5; 
end

SYM_7_6: begin
    if(i_div_done)
        next_state = SYM_7_7; 
    else
        next_state = SYM_7_6; 
end

SYM_7_7: begin
    if(i_div_done)
        next_state = SYM_7_8; 
    else
        next_state = SYM_7_7; 
end

SYM_7_8: begin
    if(i_div_done)
        next_state = SYM_7_9; 
    else
        next_state = SYM_7_8; 
end

SYM_7_9: begin
    if(i_div_done)
        next_state = SYM_7_10; 
    else
        next_state = SYM_7_9; 
end

SYM_7_10: begin
    if(i_div_done)
        next_state = SYM_7_11; 
    else
        next_state = SYM_7_10; 
end


SYM_7_11: begin
    if(i_done_equ_one_symbol) //new kant done bs 15/5
        next_state = DUMMY_3; 
    else
        next_state = SYM_7_11; 
end

DUMMY_3 : begin
    if(i_symbol_num == 3'b001)
        next_state = READY;
    else
        next_state = DUMMY_3; 
end

READY:  begin
  //  if(!i_rst_n) 
    next_state = IDLE;   
/*	else begin 
    next_state = READY	; 
    end*/
end 
default: next_state = IDLE; 

endcase
end


always_comb begin

    o_rd_add='0;
    o_done_equ_7symbols='0;

    o_state_num=3'b000;
    o_rd_add=4'b0000;
    //o_rd_add_out=4'b0000;
    //o_rst_ser_par=0;
    o_start_div=0;
 //lesaaaaaaa defaultsssssssssssssss/////////////////////

case (curr_state)
IDLE: 
begin
    if (!i_rst_n) 
        begin
/////////////////////////////////////////
            o_rd_add='0;
            o_done_equ_7symbols='0;
            o_state_num=3'b000;
            o_rd_add=4'b0000;
            //o_rd_add_out=4'b0000;
            //o_rst_ser_par=0;
            o_start_div=0;

        end
end

SYM_1_0: begin
    o_state_num=3'b001;
    o_rd_add=4'b0000;
    o_start_div=1;
   // if (i_div_done)
      //  o_rd_add=4'b0001;
end
SYM_1_1: begin
    o_state_num=3'b001;
    o_rd_add=4'b0001;
    ////o_rd_add_out=4'b0000;
    o_start_div=1;
   // if (i_div_done)
      //  o_rd_add=4'b0010;
end
SYM_1_2: begin
    o_state_num=3'b001;
    o_rd_add=4'b0010;
 //   o_wr_en_out=1;
    o_start_div=1;
end
SYM_1_3: begin
    o_state_num=3'b001;
    o_rd_add=4'b0011;
   // o_wr_en_out=1;
    o_start_div=1;
end
SYM_1_4: begin
    o_state_num=3'b001;
    o_rd_add=4'b0100;
        o_start_div=1;
    //o_wr_en_out=1;
end
SYM_1_5: begin
    o_state_num=3'b001;
    o_rd_add=4'b0101;
    //o_wr_en_out=1;
    o_start_div=1;
end
SYM_1_6: begin
    o_state_num=3'b001;
    o_rd_add=4'b0110;
    //o_wr_en_out=1;
    o_start_div=1;
end
SYM_1_7: begin
    o_state_num=3'b001;
    o_rd_add=4'b0111;
    //o_wr_en_out=1;
    o_start_div=1;
end
SYM_1_8: begin
    o_state_num=3'b001;
    o_rd_add=4'b1000;
    o_start_div=1;
end
SYM_1_9: begin
    o_state_num=3'b001;
    o_rd_add=4'b1001;
    o_start_div=1;
end
SYM_1_10: begin
    o_state_num=3'b001;
    o_rd_add=4'b1010;
    o_start_div=1;
end
SYM_1_11: begin
    o_state_num=3'b001;
    o_rd_add=4'b1011;
    o_start_div=1;
end

SYM_2_0: begin
    o_state_num=3'b010;
    o_rd_add=4'b0000;
    //o_rst_ser_par=1; //to read final output of symbol1 
    //o_rd_add_out=4'b0000;
    o_start_div=1;
end
SYM_2_1: begin
    o_state_num=3'b010;
    o_rd_add=4'b0001;
    //o_rst_ser_par=1;
    //o_rd_add_out=4'b0001;
    o_start_div=1;
end
SYM_2_2: begin
    o_state_num=3'b010;
    o_rd_add=4'b0010;
    //o_rd_add_out=4'b0010;
    //o_rst_ser_par=1;
    o_start_div=1;
end
SYM_2_3: begin
    o_state_num=3'b010;
    o_rd_add=4'b0011;
    //o_rd_add_out=4'b0011;
    //o_rst_ser_par=1;
    o_start_div=1;
end
SYM_2_4: begin
    o_state_num=3'b010;
    o_rd_add=4'b0100;
    //o_rd_add_out=4'b0100;
    //o_rst_ser_par=1;
    o_start_div=1;
end
SYM_2_5: begin
    o_state_num=3'b010;
    o_rd_add=4'b0101;
    //o_rd_add_out=4'b0101;
    //o_rst_ser_par=1;
    o_start_div=1;
end
SYM_2_6: begin
    o_state_num=3'b010;
    o_rd_add=4'b0110;
    //o_rd_add_out=4'b0110;
    //o_rst_ser_par=1;
    o_start_div=1;
end
SYM_2_7: begin
    o_state_num=3'b010;
    o_rd_add=4'b0111;
    //o_rd_add_out=4'b0111;
    //o_rst_ser_par=1;
    o_start_div=1;
end
SYM_2_8: begin
    o_state_num=3'b010;
    o_rd_add=4'b1000;
    //o_rd_add_out=4'b1000;
    //o_rst_ser_par=1;
    o_start_div=1;
end
SYM_2_9: begin
    o_state_num=3'b010;
    o_rd_add=4'b1001;
    //o_rd_add_out=4'b1001;
    //o_rst_ser_par=1;
    o_start_div=1;
end
SYM_2_10: begin
    o_state_num=3'b010;
    o_rd_add=4'b1010;
    //o_rd_add_out=4'b1010;
    //o_rst_ser_par=1;
    o_start_div=1;
end
SYM_2_11: begin
    o_state_num=3'b010;
    o_rd_add=4'b1011;
    //o_rd_add_out=4'b1011;
    //o_rst_ser_par=1;
    o_start_div=1;
end

SYM_3_0: begin
    o_state_num = 3'b011;
    o_rd_add = 4'b0000;
    o_start_div = 1;
    // if (i_div_done)
    //    o_rd_add = 4'b0001;
end

SYM_3_1: begin
    o_state_num = 3'b011;
    o_rd_add = 4'b0001;
    ////o_rd_add_out = 4'b0000;
    o_start_div = 1;
    // if (i_div_done)
    //    o_rd_add = 4'b0010;
end

SYM_3_2: begin
    o_state_num = 3'b011;
    o_rd_add = 4'b0010;
    //   o_wr_en_out=1;
    o_start_div = 1;
end

SYM_3_3: begin
    o_state_num = 3'b011;
    o_rd_add = 4'b0011;
    // o_wr_en_out=1;
    o_start_div = 1;
end

SYM_3_4: begin
    o_state_num = 3'b011;
    o_rd_add = 4'b0100;
    o_start_div = 1;
    //o_wr_en_out=1;
end

SYM_3_5: begin
    o_state_num = 3'b011;
    o_rd_add = 4'b0101;
    //o_wr_en_out=1;
    o_start_div = 1;
end

SYM_3_6: begin
    o_state_num = 3'b011;
    o_rd_add = 4'b0110;
    //o_wr_en_out=1;
    o_start_div = 1;
end

SYM_3_7: begin
    o_state_num = 3'b011;
    o_rd_add = 4'b0111;
    //o_wr_en_out=1;
    o_start_div = 1;
end

SYM_3_8: begin
    o_state_num = 3'b011;
    o_rd_add = 4'b1000;
    o_start_div = 1;
end

SYM_3_9: begin
    o_state_num = 3'b011;
    o_rd_add = 4'b1001;
    o_start_div = 1;
end

SYM_3_10: begin
    o_state_num = 3'b011;
    o_rd_add = 4'b1010;
    o_start_div = 1;
end

SYM_3_11: begin
    o_state_num = 3'b011;
    o_rd_add = 4'b1011;
    o_start_div = 1;
end

SYM_5_0: begin
    o_state_num = 3'b101;
    o_rd_add = 4'b0000;
    o_start_div = 1;
    // if (i_div_done)
    //    o_rd_add = 4'b0001;
end

SYM_5_1: begin
    o_state_num = 3'b101;
    o_rd_add = 4'b0001;
    ////o_rd_add_out = 4'b0000;
    o_start_div = 1;
    // if (i_div_done)
    //    o_rd_add = 4'b0010;
end

SYM_5_2: begin
    o_state_num = 3'b101;
    o_rd_add = 4'b0010;
    //   o_wr_en_out=1;
    o_start_div = 1;
end

SYM_5_3: begin
    o_state_num = 3'b101;
    o_rd_add = 4'b0011;
    // o_wr_en_out=1;
    o_start_div = 1;
end

SYM_5_4: begin
    o_state_num = 3'b101;
    o_rd_add = 4'b0100;
    o_start_div = 1;
    //o_wr_en_out=1;
end

SYM_5_5: begin
    o_state_num = 3'b101;
    o_rd_add = 4'b0101;
    //o_wr_en_out=1;
    o_start_div = 1;
end

SYM_5_6: begin
    o_state_num = 3'b101;
    o_rd_add = 4'b0110;
    //o_wr_en_out=1;
    o_start_div = 1;
end

SYM_5_7: begin
    o_state_num = 3'b101;
    o_rd_add = 4'b0111;
    //o_wr_en_out=1;
    o_start_div = 1;
end

SYM_5_8: begin
    o_state_num = 3'b101;
    o_rd_add = 4'b1000;
    o_start_div = 1;
end

SYM_5_9: begin
    o_state_num = 3'b101;
    o_rd_add = 4'b1001;
    o_start_div = 1;
end

SYM_5_10: begin
    o_state_num = 3'b101;
    o_rd_add = 4'b1010;
    o_start_div = 1;
end

SYM_5_11: begin
    o_state_num = 3'b101;
    o_rd_add = 4'b1011;
    o_start_div = 1;
end

DUMMY: begin
    o_state_num = 3'b101;
    o_rd_add = 4'b0000;
    o_start_div = 0;
end

SYM_6_0: begin
    o_state_num = 3'b110;
    o_rd_add = 4'b0000;
    o_start_div = 1;
    // if (i_div_done)
    //    o_rd_add = 4'b0001;
end

SYM_6_1: begin
    o_state_num = 3'b110;
    o_rd_add = 4'b0001;
    ////o_rd_add_out = 4'b0000;
    o_start_div = 1;
    // if (i_div_done)
    //    o_rd_add = 4'b0010;
end

SYM_6_2: begin
    o_state_num = 3'b110;
    o_rd_add = 4'b0010;
    //   o_wr_en_out=1;
    o_start_div = 1;
end

SYM_6_3: begin
    o_state_num = 3'b110;
    o_rd_add = 4'b0011;
    // o_wr_en_out=1;
    o_start_div = 1;
end

SYM_6_4: begin
    o_state_num = 3'b110;
    o_rd_add = 4'b0100;
    o_start_div = 1;
    //o_wr_en_out=1;
end

SYM_6_5: begin
    o_state_num = 3'b110;
    o_rd_add = 4'b0101;
    //o_wr_en_out=1;
    o_start_div = 1;
end

SYM_6_6: begin
    o_state_num = 3'b110;
    o_rd_add = 4'b0110;
    //o_wr_en_out=1;
    o_start_div = 1;
end

SYM_6_7: begin
    o_state_num = 3'b110;
    o_rd_add = 4'b0111;
    //o_wr_en_out=1;
    o_start_div = 1;
end

SYM_6_8: begin
    o_state_num = 3'b110;
    o_rd_add = 4'b1000;
    o_start_div = 1;
end

SYM_6_9: begin
    o_state_num = 3'b110;
    o_rd_add = 4'b1001;
    o_start_div = 1;
end

SYM_6_10: begin
    o_state_num = 3'b110;
    o_rd_add = 4'b1010;
    o_start_div = 1;
end

SYM_6_11: begin
    o_state_num = 3'b110;
    o_rd_add = 4'b1011;
    o_start_div = 1;
end
DUMMY_2: begin
    o_state_num = 3'b110;
    o_rd_add = 4'b0000;
    o_start_div = 0;
end

SYM_7_0: begin
    o_state_num = 3'b111;
    o_rd_add = 4'b0000;
    o_start_div = 1;
    // if (i_div_done)
    //    o_rd_add = 4'b0001;
end

SYM_7_1: begin
    o_state_num = 3'b111;
    o_rd_add = 4'b0001;
    ////o_rd_add_out = 4'b0000;
    o_start_div = 1;
    // if (i_div_done)
    //    o_rd_add = 4'b0010;
end

SYM_7_2: begin
    o_state_num = 3'b111;
    o_rd_add = 4'b0010;
    //   o_wr_en_out=1;
    o_start_div = 1;
end

SYM_7_3: begin
    o_state_num = 3'b111;
    o_rd_add = 4'b0011;
    // o_wr_en_out=1;
    o_start_div = 1;
end

SYM_7_4: begin
    o_state_num = 3'b111;
    o_rd_add = 4'b0100;
    o_start_div = 1;
    //o_wr_en_out=1;
end

SYM_7_5: begin
    o_state_num = 3'b111;
    o_rd_add = 4'b0101;
    //o_wr_en_out=1;
    o_start_div = 1;
end

SYM_7_6: begin
    o_state_num = 3'b111;
    o_rd_add = 4'b0110;
    //o_wr_en_out=1;
    o_start_div = 1;
end

SYM_7_7: begin
    o_state_num = 3'b111;
    o_rd_add = 4'b0111;
    //o_wr_en_out=1;
    o_start_div = 1;
end

SYM_7_8: begin
    o_state_num = 3'b111;
    o_rd_add = 4'b1000;
    o_start_div = 1;
end

SYM_7_9: begin
    o_state_num = 3'b111;
    o_rd_add = 4'b1001;
    o_start_div = 1;
end

SYM_7_10: begin
    o_state_num = 3'b111;
    o_rd_add = 4'b1010;
    o_start_div = 1;
end

SYM_7_11: begin
    o_state_num = 3'b111;
    o_rd_add = 4'b1011;
    o_start_div = 1;
end

DUMMY_3: begin
    o_state_num = 3'b111;
    o_rd_add = 4'b0000;
    o_start_div = 0;
end

READY: 
     o_done_equ_7symbols=1; //////????/
default: begin
end

endcase
end
endmodule