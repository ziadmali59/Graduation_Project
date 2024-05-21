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



module fsm_equ_serpar
(
input logic                                     i_clk_equ,     
                                                i_rst_n,
input logic                                     i_done_equ_one_symbol,

output logic [3:0]                              o_rd_add_out,
output logic                                    o_done_equ,
output logic                                    o_rst_ser_par
);





// explicit binary encoding
typedef enum logic [3:0]        
{
SUB_CAR_0=  4'b0000,
SUB_CAR_1 = 4'b0001,
SUB_CAR_2 = 4'b0010,
SUB_CAR_3 = 4'b0011,
SUB_CAR_4 = 4'b0100,
SUB_CAR_5 = 4'b0101,
SUB_CAR_6 = 4'b0110,
SUB_CAR_7 = 4'b0111,
SUB_CAR_8 = 4'b1000,
SUB_CAR_9 = 4'b1001,
SUB_CAR_10= 4'b1010,
SUB_CAR_11= 4'b1011,

IDLE= 4'b1100,
READY=4'b1101,
DUMMY=4'b1110
  
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
    if (i_done_equ_one_symbol) 
    next_state = DUMMY; 

    else
    next_state = IDLE; 
end

DUMMY: begin
    //if(i_div_done)
    next_state = SUB_CAR_0; 
    //else
    //next_state = SUB_CAR_0; 
end

SUB_CAR_0: begin
    //if(i_div_done)
    next_state = SUB_CAR_1; 
    //else
    //next_state = SUB_CAR_0; 
end

SUB_CAR_1: begin
    //if(i_div_done)
    next_state = SUB_CAR_2; 
    //else
    //next_state = SUB_CAR_1; 
end

SUB_CAR_2: begin
    //if(i_div_done)
    next_state = SUB_CAR_3; 
    //else
    //next_state = SUB_CAR_2; 
end

SUB_CAR_3: begin
    //if(i_div_done)
    next_state = SUB_CAR_4; 
    //else
    //next_state = SUB_CAR_3; 
end

SUB_CAR_4: begin
    //if(i_div_done)
    next_state = SUB_CAR_5; 
    //else
    //next_state = SUB_CAR_4; 
end

SUB_CAR_5: begin
    //if(i_div_done)
    next_state = SUB_CAR_6; 
    //else
    //next_state = SUB_CAR_5; 
end

SUB_CAR_6: begin
    //if(i_div_done)
    next_state = SUB_CAR_7; 
    //else
    //next_state = SUB_CAR_6; 
end

SUB_CAR_7: begin
    //if(i_div_done)
    next_state = SUB_CAR_8; 
    //else
    //next_state = SUB_CAR_7; 
end

SUB_CAR_8: begin
    //if(i_div_done)
    next_state = SUB_CAR_9; 
    //else
    //next_state = SUB_CAR_8; 
end

SUB_CAR_9: begin
    //if(i_div_done)
    next_state = SUB_CAR_10; 
    //else
    //next_state = SUB_CAR_9; 
end

SUB_CAR_10: begin
    //if(i_div_done)
    next_state = SUB_CAR_11; 
    //else
    //next_state = SUB_CAR_10; 
end

SUB_CAR_11: begin
    next_state = READY; 
end

READY:  begin
  //  if(!i_rst_n) 
    next_state = IDLE;   
end 
default: next_state = IDLE; 

endcase
end


always_comb begin

    o_rd_add_out=4'b0000;
    o_done_equ=0;
    o_rst_ser_par=1;


case (curr_state)
IDLE: 
begin
    if (!i_rst_n) 
        begin
/////////////////////////////////////////
            o_rd_add_out=4'b0000;
        end
   // o_rst_ser_par=0;
end

SUB_CAR_0: begin
    o_rd_add_out=4'b0000;
    o_rst_ser_par=0;
end
SUB_CAR_1: begin
    o_rd_add_out=4'b0001;
end
SUB_CAR_2: begin
    o_rd_add_out=4'b0010;
end
SUB_CAR_3: begin
    o_rd_add_out=4'b0011;
end
SUB_CAR_4: begin
    o_rd_add_out=4'b0100;
end
SUB_CAR_5: begin
    o_rd_add_out=4'b0101;
end
SUB_CAR_6: begin
    o_rd_add_out=4'b0110;
end
SUB_CAR_7: begin
    o_rd_add_out=4'b0111;
end
SUB_CAR_8: begin
    o_rd_add_out=4'b1000;
end
SUB_CAR_9: begin
    o_rd_add_out=4'b1001;
end
SUB_CAR_10: begin
    o_rd_add_out=4'b1010;
end
SUB_CAR_11: begin
    o_rd_add_out=4'b1011;
end

READY: begin
    o_done_equ=1;
end
DUMMY: begin

end
    
default: begin
end

endcase
end
endmodule