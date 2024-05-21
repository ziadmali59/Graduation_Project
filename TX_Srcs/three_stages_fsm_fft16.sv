/*
Project        : NB-IOT UPLINK
Standard doc.  : 
Module name    : three_stages_fsm_fft16
Dependancy     :
Design doc.    : 
References     : 
Description    : controller for the 3 stages of the 16fft
Owner          : Martina Magued
*/



module three_stages_fsm_fft16 
#(parameter 			                    DATA_WIDTH	=	16,   
                                            DOUBLE_DATA_WIDTH = 2*DATA_WIDTH, //for real and imaginary
                                            ADD_SIZE = 4 //1
)
(
input logic i_clk_control_fft16,     
            i_rst_n,
            i_done_rearrange_control_fft16 ,
            i_valid_mapper_control_fft16,
            i_done_btrfly_control_fft16,

            
output logic                                o_en_arrg_control_fft16 ,

                                            o_wr_en_control_fft16,
                                            
                                            o_done_stage3_control_fft16,

                                            o_mem_initial_control_fft16,
                                            o_ready_control_fft16,


                                            
output logic                                o_wr_add_control_fft16,
output logic                                o_rd_add_control_fft16,

output logic [5:0]                           o_a_rd_index_control_fft16,   
output logic [5:0]                           o_b_rd_index_control_fft16,
output logic [2:0]                           o_a_wr_index_control_fft16,   
output logic [2:0]                           o_b_wr_index_control_fft16,
output logic [2:0]                           o_indx_twid_control_fft16,
output logic                                 o_stage_3,
output logic                                 o_rst_ser_to_par,

output logic                                 o_start_stage4, //newwwww 17/4/2024

output logic                                 o_last_btrfly_stage3//neww
);





// explicit binary encoding
typedef enum logic [4:0]        
{
WAIT_INPUT= 5'b00000,

READY=5'b00001,

REARRANGE =5'b00010,

BTRFLY11 =5'b00011,
BTRFLY12 =5'b00100,
BTRFLY13 =5'b00101,
BTRFLY14 = 5'b00110,

BTRFLY21 = 5'b00111,
BTRFLY22 =5'b01000,
BTRFLY23 =5'b01001,
BTRFLY24 =5'b01010,

BTRFLY31 = 5'b01011,
BTRFLY32 =5'b01100,
BTRFLY33 =5'b01101,
BTRFLY34 =5'b01110,

BTRFLY112 =5'b01111,
BTRFLY122 =5'b10000,
BTRFLY132 =5'b10001,
BTRFLY142 = 5'b10010,

BTRFLY212 = 5'b10011,
BTRFLY222 =5'b10100,
BTRFLY232 =5'b10101,
BTRFLY242 =5'b10110,

BTRFLY312 = 5'b10111,
BTRFLY322 =5'b11000,
BTRFLY332 =5'b11001,
BTRFLY342 =5'b11010,
IDLE      =5'b11011
    
} states;

states curr_state, next_state; 

// Current State Logic -- sequential logic 
always_ff @ (posedge i_clk_control_fft16 or negedge i_rst_n) 
if (!i_rst_n)
curr_state <= WAIT_INPUT;         
else
curr_state <= next_state;


// Next State logic -- combinational logic 
always_comb begin
case (curr_state)

WAIT_INPUT: begin
    if (i_valid_mapper_control_fft16) 
    next_state = REARRANGE; 

    //else if (o_done_stage3_control_fft16)
      //  next_state = WAIT_INPUT; 

    else
    next_state = WAIT_INPUT; 
end


REARRANGE: begin
    if (i_done_rearrange_control_fft16) 
    next_state = BTRFLY11; 

    else
    next_state = REARRANGE;
end


BTRFLY11: begin
    if (i_done_btrfly_control_fft16) 
        next_state =BTRFLY12;

    else
    next_state = BTRFLY11;
end


BTRFLY12: begin                                  
    if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY13; 

    else
    next_state = BTRFLY12;
end

BTRFLY13: begin
if (i_done_btrfly_control_fft16) 
        next_state =BTRFLY14; 

    else
    next_state = BTRFLY13;
end 

BTRFLY14:begin
if (i_done_btrfly_control_fft16) 
        next_state =BTRFLY21;
 
    else
    next_state = BTRFLY14;
end


BTRFLY21:  begin                                 
    if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY22; 


    else
        next_state = BTRFLY21;
end

BTRFLY22: begin
    if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY23; 
  
    else
        next_state = BTRFLY22;
end

BTRFLY23: begin
if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY24; 

    else
        next_state = BTRFLY23;
end

BTRFLY24:   begin                                 
    if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY31; 

    else
        next_state = BTRFLY24;
end

BTRFLY31: begin
if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY32; 

    else
    next_state = BTRFLY31;
end

BTRFLY32:begin
if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY33; 

    else
    next_state = BTRFLY32;
end

BTRFLY33:begin
if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY34; 
 
    else
        next_state = BTRFLY33;
end

BTRFLY34:   begin                              
    if (i_done_btrfly_control_fft16) 
        next_state =BTRFLY112;

    else
        next_state = BTRFLY34;
end


/////////////////////////////////////////////////////////////

BTRFLY112: begin                                  
    if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY122; 

    else
    next_state = BTRFLY112;
end

BTRFLY122: begin                                  
    if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY132; 

    else
    next_state = BTRFLY122;
end

BTRFLY132: begin
if (i_done_btrfly_control_fft16) 
        next_state =BTRFLY142; 

    else
    next_state = BTRFLY132;
end 

BTRFLY142:begin
if (i_done_btrfly_control_fft16) 
        next_state =BTRFLY212; 
 
    else
    next_state = BTRFLY142;
end


BTRFLY212:  begin                                 
    if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY222; 


    else
        next_state = BTRFLY212;
end

BTRFLY222: begin
    if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY232; 
  
    else
        next_state = BTRFLY222;
end

BTRFLY232: begin
if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY242; 

    else
        next_state = BTRFLY232;
end

BTRFLY242:   begin                                 
    if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY312; 

    else
        next_state = BTRFLY242;
end

BTRFLY312: begin
if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY322; 

    else
    next_state = BTRFLY312;
end

BTRFLY322:begin
if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY332; 

    else
    next_state = BTRFLY322;
end

BTRFLY332:begin
if (i_done_btrfly_control_fft16) 
        next_state = BTRFLY342; 
 
    else
        next_state = BTRFLY332;
end

BTRFLY342:   begin                              
    if (i_done_btrfly_control_fft16) 
        next_state =READY; 

    else
        next_state = BTRFLY342;
end


/*READY:   begin
if (i_valid_mapper_control_fft16) 
    next_state = REARRANGE; 
else 
     next_state = READY; 
end */

READY:  begin
     next_state = IDLE;//READY	; 
end

IDLE:   begin
if (i_valid_mapper_control_fft16) 
    next_state = REARRANGE; 
else 
     next_state = IDLE; 
end 
default: next_state = WAIT_INPUT; 

endcase
end


//<<<<<<<<<<<<<<<<<<<<<<<<<<<                              >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//<<<<<<<<<<<<<<<<<<<<<<<<<<<                              >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//<<<<<<<<<<<<<<<<<<<<<<<<<<<                              >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// FSM outputs - combinational logic

always_comb begin

o_en_arrg_control_fft16 ='0;

o_wr_en_control_fft16='0;
o_done_stage3_control_fft16='0;
o_mem_initial_control_fft16='0;
o_ready_control_fft16='0;

o_wr_add_control_fft16='0;
o_rd_add_control_fft16='0;
o_a_rd_index_control_fft16 ='0;
o_b_rd_index_control_fft16='0;
o_a_wr_index_control_fft16  ='0;
o_b_wr_index_control_fft16='0;
o_indx_twid_control_fft16='0;
o_stage_3=0;
o_rst_ser_to_par=0;

o_start_stage4=0;


//neww
o_last_btrfly_stage3=0;


case (curr_state)

WAIT_INPUT:begin
    if (!i_rst_n) 
        begin
            o_en_arrg_control_fft16 ='0;

            o_wr_en_control_fft16='0;
            o_done_stage3_control_fft16='0;
            o_mem_initial_control_fft16='0;
            o_ready_control_fft16='0;

            o_wr_add_control_fft16='0;
            o_rd_add_control_fft16='0;
            o_a_rd_index_control_fft16 ='0;
            o_b_rd_index_control_fft16='0;
            o_a_wr_index_control_fft16  ='0;
            o_b_wr_index_control_fft16='0;
            o_indx_twid_control_fft16='0;
            o_stage_3=0;
            o_rst_ser_to_par=0;

            o_start_stage4=0;



            //new
            o_last_btrfly_stage3=0;
        end
    
         

end

REARRANGE: begin
     o_en_arrg_control_fft16 = 1;
   
end


BTRFLY11: begin
            o_a_rd_index_control_fft16            =0;
            o_b_rd_index_control_fft16            =1;
             o_wr_en_control_fft16                   = 1;
            o_a_wr_index_control_fft16 =0; 
            o_b_wr_index_control_fft16 =1;


            o_mem_initial_control_fft16             = 1;

 
end



BTRFLY12:    begin   

        o_mem_initial_control_fft16             = 1;


            o_wr_en_control_fft16                   = 1;

            o_a_wr_index_control_fft16 =2; 
            o_b_wr_index_control_fft16 =3;
            o_a_rd_index_control_fft16 =2;
            o_b_rd_index_control_fft16 =3;
 
            o_wr_add_control_fft16                = 0;
            o_rd_add_control_fft16                = 0;
            




end


BTRFLY13: begin

                       o_mem_initial_control_fft16             = 1;


        o_wr_en_control_fft16                   = 1;
        


            o_a_wr_index_control_fft16 =4; 
            o_b_wr_index_control_fft16 =5;
            o_a_rd_index_control_fft16 =4;
            o_b_rd_index_control_fft16 =5;
            

                o_wr_add_control_fft16                = 0;
                o_rd_add_control_fft16                = 0;



        end



BTRFLY14: begin

        o_mem_initial_control_fft16             = 1;

           
        o_wr_en_control_fft16                   = 1;


        o_a_wr_index_control_fft16 =6; 
        o_b_wr_index_control_fft16 =7;
        o_a_rd_index_control_fft16 =6;
        o_b_rd_index_control_fft16 =7;

        o_wr_add_control_fft16                = 0;
        o_rd_add_control_fft16                = 0;


end


BTRFLY21:     begin                              

        o_wr_en_control_fft16                   = 1;


        o_a_wr_index_control_fft16 =0; 
        o_b_wr_index_control_fft16 =2;
        o_a_rd_index_control_fft16 =0;
        o_b_rd_index_control_fft16 =2;

        o_wr_add_control_fft16                = 0;
        o_rd_add_control_fft16                = 0;


end

BTRFLY22: begin

        o_wr_en_control_fft16                   = 1;


        o_a_wr_index_control_fft16 =1; 
        o_b_wr_index_control_fft16 =3;
        o_a_rd_index_control_fft16 =1;
        o_b_rd_index_control_fft16 =3;
            
            
        o_wr_add_control_fft16                = 0;
        o_rd_add_control_fft16                = 0;
        o_indx_twid_control_fft16=4;

end


BTRFLY23: begin

        
        o_wr_en_control_fft16                   = 1;


        o_a_wr_index_control_fft16 =4; 
        o_b_wr_index_control_fft16 =6;
        o_a_rd_index_control_fft16 =4;
        o_b_rd_index_control_fft16 =6;

        o_wr_add_control_fft16                = 0;
        o_rd_add_control_fft16                = 0;


end

BTRFLY24:   begin          

           
        o_wr_en_control_fft16                   = 1;


        o_a_wr_index_control_fft16 =5; 
        o_b_wr_index_control_fft16 =7;
        o_a_rd_index_control_fft16 =5;
        o_b_rd_index_control_fft16 =7;

        o_wr_add_control_fft16                = 0;
        o_rd_add_control_fft16                = 0;
        o_indx_twid_control_fft16=4;

end

BTRFLY31: begin
 
        o_stage_3=1; 
        o_rst_ser_to_par =1;


  
        o_wr_en_control_fft16                   = 1;


        o_a_wr_index_control_fft16 =0; 
        o_b_wr_index_control_fft16 =4;
        o_a_rd_index_control_fft16 =0;
        o_b_rd_index_control_fft16 =4;

        o_wr_add_control_fft16                = 0;
        o_rd_add_control_fft16                = 0;




end
BTRFLY32:begin
 
                o_stage_3=1; 
        o_rst_ser_to_par =1;


        o_wr_en_control_fft16                   = 1;


            o_a_wr_index_control_fft16 =1; 
            o_b_wr_index_control_fft16 =5;
            o_a_rd_index_control_fft16 =1;
            o_b_rd_index_control_fft16 =5;
            

                o_wr_add_control_fft16                = 0;
                o_rd_add_control_fft16                = 0;
                o_indx_twid_control_fft16=2;

end
BTRFLY33: begin

                o_stage_3=1; 
        o_rst_ser_to_par =1;  


        o_wr_en_control_fft16                   = 1;
    

            o_a_wr_index_control_fft16 =2; 
            o_b_wr_index_control_fft16 =6;
            o_a_rd_index_control_fft16 =2;
            o_b_rd_index_control_fft16 =6;

                o_wr_add_control_fft16                = 0;
                o_rd_add_control_fft16                = 0;
        o_indx_twid_control_fft16=4;

end

BTRFLY34:    begin  
 
                o_stage_3=1; 
        o_rst_ser_to_par =1;                            




        o_wr_en_control_fft16                   = 1;
        
        o_a_wr_index_control_fft16             =3; 
        o_b_wr_index_control_fft16             =7;
        o_a_rd_index_control_fft16             =4'b0011;//3;
        o_b_rd_index_control_fft16             =4'b0111;//7;
            
 
        o_wr_add_control_fft16         = 0;
        o_rd_add_control_fft16         = 0;
        o_indx_twid_control_fft16=6;
                  

end

////////////////////////////////////////////////////////////////////////////////////////
BTRFLY112: begin
            o_a_rd_index_control_fft16            =8;//0;
            o_b_rd_index_control_fft16            =9;//1;
            
            o_wr_en_control_fft16                   = 1;
            

            o_a_wr_index_control_fft16 =7;//0; 
            o_b_wr_index_control_fft16 =0;//1;


            o_mem_initial_control_fft16             = 1;
            
            o_wr_add_control_fft16                = 1;
            o_rd_add_control_fft16                = 1;

                    o_stage_3=1; 
        o_rst_ser_to_par =1;


end



BTRFLY122:    begin   

            o_mem_initial_control_fft16             = 1;



            o_wr_en_control_fft16                   = 1;

            o_a_wr_index_control_fft16 = 1;//2; 
            o_b_wr_index_control_fft16 = 2;//3;
            o_a_rd_index_control_fft16 = 10;
            o_b_rd_index_control_fft16 = 11;

            o_wr_add_control_fft16                = 1;
            o_rd_add_control_fft16                = 1;


                    o_stage_3=1; 
        o_rst_ser_to_par =1;
end


BTRFLY132: begin

            
                       o_mem_initial_control_fft16             = 1;


        o_wr_en_control_fft16                   = 1;


            o_a_wr_index_control_fft16 =3;//4; 
            o_b_wr_index_control_fft16 =4;//5;
            o_a_rd_index_control_fft16 =12;
            o_b_rd_index_control_fft16 =13;

                o_wr_add_control_fft16                = 1;
                o_rd_add_control_fft16                = 1;

                    o_stage_3=1; 
        o_rst_ser_to_par =1;

        end
    

BTRFLY142: begin

                       o_mem_initial_control_fft16             = 1;

           
        o_wr_en_control_fft16                   = 1;
    


            o_a_wr_index_control_fft16 =5;//6; 
            o_b_wr_index_control_fft16 =6;//7;
            o_a_rd_index_control_fft16 =14;
            o_b_rd_index_control_fft16 =15;
            
                o_wr_add_control_fft16                = 1;
                o_rd_add_control_fft16                = 1;

                    o_stage_3=1; 
        o_rst_ser_to_par =1;
        end


BTRFLY212:     begin                              


        o_wr_en_control_fft16                   = 1;


            o_a_wr_index_control_fft16 =7;//0; 
            o_b_wr_index_control_fft16 =1;//2;
            o_a_rd_index_control_fft16 =7;//0;
            o_b_rd_index_control_fft16 =1;//2;

                o_wr_add_control_fft16                = 1;
                o_rd_add_control_fft16                = 1;

                    o_stage_3=1; 
        o_rst_ser_to_par =1;
end

BTRFLY222: begin
        o_wr_en_control_fft16                   = 1;


            o_a_wr_index_control_fft16 =0;//1; 
            o_b_wr_index_control_fft16 =2;//3;
            o_a_rd_index_control_fft16 =0;//1;
            o_b_rd_index_control_fft16 =2;//3;

                o_wr_add_control_fft16                = 1;
                o_rd_add_control_fft16                = 1;

        o_indx_twid_control_fft16=4;
  
        o_stage_3=1; 
        o_rst_ser_to_par =1;
end



BTRFLY232: begin
        
        o_wr_en_control_fft16                   = 1;


            o_a_wr_index_control_fft16 =3;//4; 
            o_b_wr_index_control_fft16 =5;//6;
            o_a_rd_index_control_fft16 =3;//4;
            o_b_rd_index_control_fft16 =5;//6;
            
                o_wr_add_control_fft16                = 1;
                o_rd_add_control_fft16                = 1;


                    o_stage_3=1; 
        o_rst_ser_to_par =1;
        end

BTRFLY242:   begin          

           
        o_wr_en_control_fft16                   = 1;
    
            o_a_wr_index_control_fft16 =4;//5; 
            o_b_wr_index_control_fft16 =6;//7;
            o_a_rd_index_control_fft16 =4;//5;
            o_b_rd_index_control_fft16 =6;//7;

                o_wr_add_control_fft16                = 1;
                o_rd_add_control_fft16                = 1;
                o_indx_twid_control_fft16=4;

                    o_stage_3=1; 
        o_rst_ser_to_par =1;

end

BTRFLY312: begin
  
                o_stage_3=1; 
        o_rst_ser_to_par =1;

        o_wr_en_control_fft16                   = 1;
    

            o_a_wr_index_control_fft16 =7;//0; 
            o_b_wr_index_control_fft16 =3;//4;
            o_a_rd_index_control_fft16 =7;//0;
            o_b_rd_index_control_fft16 =3;//4;
            

                o_wr_add_control_fft16                = 1;
                o_rd_add_control_fft16                = 1;

            end


BTRFLY322:begin
                o_stage_3=1; 
        o_rst_ser_to_par =1; 


        o_wr_en_control_fft16                   = 1;


            o_a_wr_index_control_fft16 =0;//1; 
            o_b_wr_index_control_fft16 =4;//5;
            o_a_rd_index_control_fft16 =0;//1;
            o_b_rd_index_control_fft16 =4;//5;

                o_wr_add_control_fft16                = 1;
                o_rd_add_control_fft16                = 1;
                o_indx_twid_control_fft16=2;


        end

BTRFLY332: begin

                o_stage_3=1; 
        o_rst_ser_to_par =1;  


        o_wr_en_control_fft16                   = 1;
    

            o_a_wr_index_control_fft16 =1;//2; 
            o_b_wr_index_control_fft16 =5;//6;
            o_a_rd_index_control_fft16 =1;//2;
            o_b_rd_index_control_fft16 =5;//6;
            

                o_wr_add_control_fft16                = 1;
                o_rd_add_control_fft16                = 1;
                o_indx_twid_control_fft16=4;


end

BTRFLY342:    begin  
                o_stage_3=1; 
        o_rst_ser_to_par =1;                            

        o_wr_en_control_fft16                   = 1;
        
        o_a_wr_index_control_fft16             =2;//3; 
        o_b_wr_index_control_fft16             =6;//7;
        o_a_rd_index_control_fft16             =2;//3;
        o_b_rd_index_control_fft16             =6;//7;
            

        o_wr_add_control_fft16         = 1;
        o_rd_add_control_fft16         = 1;
        o_indx_twid_control_fft16=6;

        //newwww
        o_last_btrfly_stage3 =1;

end


READY:  begin

    o_done_stage3_control_fft16 = 1;           
    o_rst_ser_to_par =1;
    o_stage_3=1;

    o_start_stage4=1;
end

IDLE : begin
   // o_start_stage4=0;
    o_done_stage3_control_fft16 = 1;           
    o_rst_ser_to_par =1;
    o_stage_3=1;

end
default: begin
end

endcase
end
endmodule