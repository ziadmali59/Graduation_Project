/*
Project        : NB-IOT UPLINK
Standard doc.  : 
Module name    : stage4_fsm_fft16
Dependancy     :
Design doc.    : 
References     : 
Description    : controller for stage 4 of the 16fft
Owner          : Martina Magued
*/

module stage4_fsm_fft16 
#(parameter 			                    DATA_WIDTH	=	16,   
                                            DOUBLE_DATA_WIDTH = 2*DATA_WIDTH, //for real and imaginary
                                            ADD_SIZE = 2
)
(
    input logic                                 i_clk_stage4_fft16,
    input logic                                 i_rst_n,

    input logic                                 i_valid_stage3_fft16,
                                                i_done_btrfly_stage4_fft16,
    input logic                                 i_last_btrfly_stage3, //newwwwwwww 18/4

    output logic                                o_done_stage4_fft16,
                                                o_wr_en_reg_stage4_fft16,
    output logic [2:0]                          o_a_wr_reg_stage4_fft16,
    output logic [2:0]                          o_b_wr_reg_stage4_fft16,

    output logic [2:0]                          o_indx_twid_stage4_fft16,

    output logic [5:0]                          o_a_rd_indx_stage4_fft16,
    output logic [5:0]                          o_b_rd_indx_stage4_fft16,

    output logic                                o_rst_ser_to_par,
    output logic                                o_stage4,
    output logic                                o_rd_add_control_fft16,

    output logic [1:0] o_num_stage3
);

// explicit binary encoding
typedef enum logic [3:0]
{
    WAIT_INPUT = 4'b0000,
    READY = 4'b0001,
    BTRFLY41 = 4'b0010,//4,
    BTRFLY42 = 4'b0011,//5,
    BTRFLY43 = 4'b0100,//6,
    BTRFLY44 = 4'b0101,//7,
    BTRFLY45 = 4'b0110,//8,
    BTRFLY46 = 4'b0111,//9,
    BTRFLY47 = 4'b1000,//10,
    BTRFLY48 = 4'b1001,//11
    
    IDLE = 4'b1010,
    RST_SER_PAR= 4'b1011

} states_stage4;

states_stage4 curr_state, next_state; 



// Current State Logic -- sequential logic 
always_ff @ (posedge i_clk_stage4_fft16 or negedge i_rst_n) begin
    if (!i_rst_n) begin
        curr_state <= WAIT_INPUT;
    end
    else begin
        curr_state <= next_state;
    end
end


// Next State logic -- combinational logic 
always_comb begin
    case (curr_state)

        WAIT_INPUT: begin
            if (i_valid_stage3_fft16 == 1) 
            next_state = BTRFLY41; 

            else
            next_state = WAIT_INPUT; 
        
        end

        BTRFLY41: begin
            if (i_done_btrfly_stage4_fft16) 
                next_state = BTRFLY42; 
            else
            next_state = BTRFLY41;
        end

       

        BTRFLY42: begin                         
            if (i_done_btrfly_stage4_fft16) 
                next_state =BTRFLY43;  
            else
            next_state = BTRFLY42;
        end

        BTRFLY43:   begin                                
            if (i_done_btrfly_stage4_fft16) 
                next_state = BTRFLY44; 

            else
            next_state = BTRFLY43;
        end

        BTRFLY44:  begin                         
            if (i_done_btrfly_stage4_fft16) 
                next_state = BTRFLY45; 

            else
            next_state = BTRFLY44;
        end

        BTRFLY45:   begin                                
            if (i_done_btrfly_stage4_fft16) 
                next_state = BTRFLY46; 

            else
            next_state = BTRFLY45;
        end

        BTRFLY46:  begin                      
            if (i_done_btrfly_stage4_fft16) 
                next_state = BTRFLY47; 

            else
            next_state = BTRFLY46;
        end

        BTRFLY47:  begin                                 
            if (i_done_btrfly_stage4_fft16) 
                next_state = BTRFLY48; 

            else
            next_state = BTRFLY47;
        end

        BTRFLY48:  begin                                 
            if (i_done_btrfly_stage4_fft16) 
                next_state = READY; 

            else
            next_state = BTRFLY48;
        end
     

        READY: begin
  /*  if(!i_rst_n)    
    next_state = WAIT_INPUT;   
	 else*/
        next_state = IDLE;//WAIT_INPUT	;  

    // if (i_valid_stage3_fft16 == 1) 
     //next_state = BTRFLY41;  
     //else 
   //  next_state = IDLE; 
        end      

    IDLE:  begin                                 
        if (i_valid_stage3_fft16)//i_last_btrfly_stage3)//i_valid_stage3_fft16)//i_last_btrfly_stage3)//i_valid_stage3_fft16 == 1) 
         next_state =BTRFLY41;//RST_SER_PAR;//BTRFLY41;
        else
         next_state = IDLE;
        end  

   // RST_SER_PAR:                                  
     //    next_state = BTRFLY41;

default: next_state = WAIT_INPUT; 
    endcase
end




// FSM outputs - combinational logic
always_comb begin
                    
                    o_done_stage4_fft16='0;
                
                    o_wr_en_reg_stage4_fft16='0;
                    o_a_wr_reg_stage4_fft16='0;
                    o_b_wr_reg_stage4_fft16='0;
                
                    o_indx_twid_stage4_fft16='0;

                    o_a_rd_indx_stage4_fft16='0;

                    o_b_rd_indx_stage4_fft16='0;
                    o_rst_ser_to_par ='0;
                    o_stage4=0;
                    o_rd_add_control_fft16='0;

                    o_num_stage3='0;
 

    case (curr_state)

        WAIT_INPUT: begin
            if (!i_rst_n) 
                begin

                    o_done_stage4_fft16='0;
                
                    o_wr_en_reg_stage4_fft16='0;
                    o_a_wr_reg_stage4_fft16='0;
                    o_b_wr_reg_stage4_fft16='0;

                    
                
                    o_indx_twid_stage4_fft16='0;

                    o_a_rd_indx_stage4_fft16='0;

                    o_b_rd_indx_stage4_fft16='0;
                    o_rst_ser_to_par ='0;
                    o_stage4=0;
                    o_rd_add_control_fft16='0;

                    o_num_stage3='0;
                    
                end
                 o_num_stage3=1;
        end


        BTRFLY41: begin


                    o_wr_en_reg_stage4_fft16= 1; 
                    o_a_wr_reg_stage4_fft16 =0; 
                    o_b_wr_reg_stage4_fft16 =0; //==8;

                    o_a_rd_indx_stage4_fft16 =0;//0; //from reg 
                    o_b_rd_indx_stage4_fft16 =7;//24;//8; //from reg

                    o_rst_ser_to_par =1;

                    o_stage4=1;

                    o_num_stage3=2;//1;

        end

      
        BTRFLY42:  begin  


                    o_wr_en_reg_stage4_fft16= 1;                                
                    o_indx_twid_stage4_fft16=1;

                    o_a_wr_reg_stage4_fft16 =3'b001; 
                    o_b_wr_reg_stage4_fft16 =3'b001; //==9;

                    o_a_rd_indx_stage4_fft16 =1;//2;//1
                    o_b_rd_indx_stage4_fft16 =0;//26;//9;
                    o_rst_ser_to_par =1;
                    o_stage4=1;
                    o_indx_twid_stage4_fft16=1;

                    o_num_stage3=1;//2;

        end

        BTRFLY43: begin        


                    o_wr_en_reg_stage4_fft16= 1;     


                    o_indx_twid_stage4_fft16=2;

                    o_a_wr_reg_stage4_fft16 =3'b010; 
                    o_b_wr_reg_stage4_fft16 =3'b010; //==10;


                    o_a_rd_indx_stage4_fft16 =2;//4;//2;
                    o_b_rd_indx_stage4_fft16 =1;//28;//10;
                    o_rst_ser_to_par =1;
                    o_stage4=1;
                    o_indx_twid_stage4_fft16=2;

                    o_num_stage3=2;//1;

        end


        BTRFLY44: begin      


                    o_wr_en_reg_stage4_fft16= 1; 

                    o_indx_twid_stage4_fft16=3;

                    o_a_wr_reg_stage4_fft16 =3'b011; 
                    o_b_wr_reg_stage4_fft16 =3'b011; //==11;

                    o_a_rd_indx_stage4_fft16 =3;//6;//3;
                    o_b_rd_indx_stage4_fft16 =2;//30;//11;
                    o_rst_ser_to_par =1;
                    o_stage4=1;
                    o_indx_twid_stage4_fft16=3;

                    o_num_stage3=1;//2;

        end

        BTRFLY45: begin    
 

                    o_wr_en_reg_stage4_fft16= 1; 


                    o_a_wr_reg_stage4_fft16 =3'b100; 
                    o_b_wr_reg_stage4_fft16 =3'b100; //==12;

                    o_a_rd_indx_stage4_fft16 =4;//1;//4;
                    o_b_rd_indx_stage4_fft16 =3;//25;//12;
                    o_rst_ser_to_par =1;
                    o_stage4=1;
                    o_rd_add_control_fft16=1;
                    o_indx_twid_stage4_fft16=4;

                    o_num_stage3=2;//1;

        end


        BTRFLY46:  begin      

                    o_wr_en_reg_stage4_fft16= 1;                           
  
                    o_indx_twid_stage4_fft16=5;
  

                    o_a_wr_reg_stage4_fft16 =3'b101; 
                    o_b_wr_reg_stage4_fft16 =3'b101; //==13;

                    o_a_rd_indx_stage4_fft16 =5;//3;//5;
                    o_b_rd_indx_stage4_fft16 =4;//27;//13;
                    o_rst_ser_to_par =1;
                    o_stage4=1;
                    o_rd_add_control_fft16=1;
                    o_indx_twid_stage4_fft16=5;

                    o_num_stage3=1;//2;
        end

        BTRFLY47:  begin      

                    o_wr_en_reg_stage4_fft16= 1;                            
                    o_indx_twid_stage4_fft16=6;


                    o_a_wr_reg_stage4_fft16 =3'b110; 
                    o_b_wr_reg_stage4_fft16 =3'b110; //==14;

                    o_a_rd_indx_stage4_fft16 =6;//5;//6;
                    o_b_rd_indx_stage4_fft16 =5;//29;//14;
                    o_rst_ser_to_par =1;
                    o_stage4=1;
                    o_rd_add_control_fft16=1;
                    o_indx_twid_stage4_fft16=6;

                    o_num_stage3=2;//1;

        end

        BTRFLY48:  begin       


                    o_wr_en_reg_stage4_fft16= 1;                          

                     o_indx_twid_stage4_fft16=7;


                    o_a_wr_reg_stage4_fft16 =3'b111; 
                    o_b_wr_reg_stage4_fft16 =3'b111; 

                    o_a_rd_indx_stage4_fft16 =7;//7;//7
                    o_b_rd_indx_stage4_fft16 =6;//31;//15;
                    o_rst_ser_to_par =1;
                    o_stage4=1;

                    o_rd_add_control_fft16=1;
                    o_indx_twid_stage4_fft16=7;


                    o_num_stage3=1;//2;
        end

        READY: begin
            o_done_stage4_fft16=1;
            o_rst_ser_to_par =1; 
            o_stage4=1;

            //o_rd_add_control_fft16=0; //new 18/4 
        end

        IDLE: begin
           // o_done_stage4_fft16=1;
            
            //o_rst_ser_to_par =1;  //shelto new
            
            //o_stage4=1;//new
          // o_rd_add_control_fft16=0; //new 18/4 
            if(i_last_btrfly_stage3 || i_valid_stage3_fft16) 
               o_rst_ser_to_par =0; 
               // o_stage4=1;
            //end
            else
o_rst_ser_to_par =1;
            //new 
            o_num_stage3=1;
               
        end

      //  RST_SER_PAR: begin
        //    o_rst_ser_to_par =0; 

      //  end

        default: begin
end
    endcase
end
endmodule