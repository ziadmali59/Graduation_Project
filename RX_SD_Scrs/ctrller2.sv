/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : ctrller
Dependancy     :
Design doc.    : 
References     : 
Description    : Controller FSM for the 3/6/12 FFT block necessary for SC-FDMA
Owner          : Yahia Ahmed
*/
module ctrller2 
(
    input     logic                                 i_clk               ,
                                                    i_rst_n             ,
                                                    i_start             ,
    input     logic [1:0]                           i_n_sc              , // 0 -> 3pt, 1 -> 6pt, 2 -> 12pt

    //Memories signals
    output    logic [0:5]                           o_we                ,
                                                    o_waddr             ,
                                                    o_raddr             ,
    output    logic [1:0]                           o_sel_wr    [0:5]   ,
    //Twiddle ROM Signals
    output    logic [1:0]                           o_tw_sign           ,
    output    logic [2:0]                           o_tw_addr   [0:1]   , 

    //Butterfly unit Signals
    output    logic                                 o_bly_32            ,
    output    logic [2:0]                           o_a_sel     [0:1]   ,
    output    logic [3:0]                           o_in_sel    [0:2]   ,

    output    logic [11:0]                          o_en_out            ,
    output    logic                                 o_done              ,
                                                    o_clr_out           ,
    output    logic                                 o_puttin            
);

  // Enumerated type for states
  typedef enum logic [1:0] 
  {
    IDLE        = 2'b00,
    R3          = 2'b01,
    R2          = 2'b10
  } State;

  // State registers
  State cs, ns;

  // counter nets
  logic [3:0]       t_c_counter,
                    t_n_counter;

  logic             t_done;

  // Moore FSM logic
  always_ff @(posedge i_clk or negedge i_rst_n) 
  begin
    if (!i_rst_n) 
    begin
      cs            <= IDLE;
      t_c_counter   <= 0;
      o_done        <= 0;
    end 
    else 
    begin
      cs            <= ns;
      t_c_counter   <= t_n_counter;
      o_done        <= t_done;
    end
    end

// Next-state & output logic
always_comb 
//always_ff @(posedge i_clk)
begin
    o_we        = 0;  
    o_waddr     = 0;
    o_raddr     = 0;
    o_sel_wr    = '{0,0,0,0,0,0};
    o_tw_sign   = 0;
    o_tw_addr   = '{0,0};
    o_bly_32    = 0;
    o_a_sel     = '{0,0};
    o_in_sel    = '{0,0,0};
    t_done      = 0;
    o_puttin    = 0;
    o_en_out    = 0;
    o_clr_out   = 0;
    t_n_counter = 0;
  case (cs)

    IDLE:
        begin
            if (!i_start) 
            begin
                ns = IDLE;
                o_clr_out   = 1;
            end 
            else
            begin
                case (i_n_sc)
                    2'b00:  
                    begin   
                        //0-1-2
                        o_in_sel    [0]     = 0;
                        o_in_sel    [1]     = 1;
                        o_in_sel    [2]     = 2;

                        o_bly_32            = 1;
                        o_a_sel     [0]     = 0;
                        o_a_sel     [1]     = 0;

                        o_tw_addr   [0]     = 1;
                        o_tw_addr   [1]     = 2;

                        o_en_out    [0]     = 1;
                        o_en_out    [1]     = 1;
                        o_en_out    [2]     = 1;

                        t_done              = 1;

                        ns                  = IDLE;
                    end
                    2'b01:
                    begin
                        o_in_sel    [0]     = 0;
                        o_in_sel    [1]     = 2;
                        o_in_sel    [2]     = 4;

                        o_bly_32            = 1;
                        o_a_sel     [0]     = 0;
                        o_a_sel     [1]     = 0;

                        o_tw_addr   [0]     = 1;
                        o_tw_addr   [1]     = 2;  

                        //for first mem
                        o_sel_wr    [0]     = 0;
                        o_we        [0]     = 1;  
                        o_waddr     [0]     = 0;

                        //for second mem
                        o_sel_wr    [1]     = 1;
                        o_we        [1]     = 1;  
                        o_waddr     [1]     = 0;

                        //for third mem
                        o_sel_wr    [2]     = 2;
                        o_we        [2]     = 1;  
                        o_waddr     [2]     = 0;

                        ns                  = R3;
                    end
                    2'b10:
                    begin         
                        o_in_sel    [0]     = 0;
                        o_in_sel    [1]     = 4;
                        o_in_sel    [2]     = 8;

                        o_bly_32            = 1;
                        o_a_sel     [0]     = 0;
                        o_a_sel     [1]     = 0;

                        o_tw_addr   [0]     = 1;
                        o_tw_addr   [1]     = 2;  

                        //for first mem
                        o_sel_wr    [0]     = 0;
                        o_we        [0]     = 1;  
                        o_waddr     [0]     = 0;

                        //for second mem
                        o_sel_wr    [1]     = 1;
                        o_we        [1]     = 1;  
                        o_waddr     [1]     = 0;

                        //for third mem
                        o_sel_wr    [2]     = 2;
                        o_we        [2]     = 1;  
                        o_waddr     [2]     = 0;

                        ns                  = R3;
                    end
                    default:    ns = IDLE;
                endcase                
            end
        end
    R3:
        begin
            case (i_n_sc)
                2'b01:
                begin
                    o_in_sel    [0]     = 1;
                    o_in_sel    [1]     = 3;
                    o_in_sel    [2]     = 5;

                    o_bly_32            = 1;
                    o_a_sel     [0]     = 0;
                    o_a_sel     [1]     = 0;

                    o_tw_addr   [0]     = 1;
                    o_tw_addr   [1]     = 2;  

                    //for first mem
                    o_sel_wr    [3]     = 0;  //which b  
                    o_we        [3]     = 1;  //which mem
                    o_waddr     [3]     = 0;  //which mem

                    //for second mem
                    o_sel_wr    [4]     = 1;  //which b  
                    o_we        [4]     = 1;  //which mem  
                    o_waddr     [4]     = 0;  //which mem

                    //for third mem
                    o_sel_wr    [5]     = 2;  //which b  
                    o_we        [5]     = 1;  //which mem
                    o_waddr     [5]     = 0;  //which mem

                    ns                  = R2;
                end
                2'b10:
                begin 
                    t_n_counter = t_c_counter + 1;        
                    case (t_c_counter)
                    4'b0000:
                    begin
                        o_in_sel    [0]     = 2;
                        o_in_sel    [1]     = 6;
                        o_in_sel    [2]     = 10;

                        o_bly_32            = 1;
                        o_a_sel     [0]     = 0;
                        o_a_sel     [1]     = 0;

                        o_tw_addr   [0]     = 1;
                        o_tw_addr   [1]     = 2;  

                        //for first mem
                        o_sel_wr    [3]     = 0;
                        o_we        [3]     = 1;  
                        o_waddr     [3]     = 0;

                        //for second mem
                        o_sel_wr    [4]     = 1;
                        o_we        [4]     = 1;  
                        o_waddr     [4]     = 0;

                        //for third mem
                        o_sel_wr    [5]     = 2;
                        o_we        [5]     = 1;  
                        o_waddr     [5]     = 0;

                        ns                  = R3;
                    end
                    4'b0001:
                    begin 
                        o_in_sel    [0]     = 1;
                        o_in_sel    [1]     = 5;
                        o_in_sel    [2]     = 9;

                        o_bly_32            = 1;
                        o_a_sel     [0]     = 0;
                        o_a_sel     [1]     = 0;

                        o_tw_addr   [0]     = 1;
                        o_tw_addr   [1]     = 2;  

                        //for first mem
                        o_sel_wr    [3]     = 0;
                        o_we        [3]     = 1;  
                        o_waddr     [3]     = 1;

                        //for second mem
                        o_sel_wr    [4]     = 1;
                        o_we        [4]     = 1;  
                        o_waddr     [4]     = 1;

                        //for third mem
                        o_sel_wr    [5]     = 2;
                        o_we        [5]     = 1;  
                        o_waddr     [5]     = 1;

                        ns                  = R3;
                    end
                    4'b0010:
                    begin 
                        o_in_sel    [0]     = 3;
                        o_in_sel    [1]     = 7;
                        o_in_sel    [2]     = 11;

                        o_bly_32            = 1;
                        o_a_sel     [0]     = 0;
                        o_a_sel     [1]     = 0;

                        o_tw_addr   [0]     = 1;
                        o_tw_addr   [1]     = 2;  

                        //for first mem
                        o_sel_wr    [0]     = 0;
                        o_we        [0]     = 1;  
                        o_waddr     [0]     = 1;

                        //for second mem
                        o_sel_wr    [1]     = 1;
                        o_we        [1]     = 1;  
                        o_waddr     [1]     = 1;

                        //for third mem
                        o_sel_wr    [2]     = 2;
                        o_we        [2]     = 1;  
                        o_waddr     [2]     = 1;

                        t_n_counter         =0;

                        ns                  = R2;
                    end
                    default:    
                        ns                  = IDLE;
                    endcase 
                end
                default:    ns = IDLE;
            endcase                
        end
    R2:
        begin
            t_n_counter = t_c_counter + 1;
            case (i_n_sc)
                2'b01:
                begin
                    case (t_c_counter)
                    4'b0000:
                    begin
                        //0 & 3 from mem 0 and 3

                        o_bly_32            = 0;

                        //for a-Muxes
                        o_a_sel     [0]     = 0+1; //which to be a0
                        o_a_sel     [1]     = 3+1; //which to be a1

                        //for tw reading mem 
                        o_tw_addr   [0]     = 0;
                        
                        //for the reading mems 
                        o_raddr     [0]     = 0; 
                        o_raddr     [3]     = 0;

                        //for the output
                        o_en_out    [0]     = 1;
                        o_en_out    [3]     = 1;

                        ns                  = R2;
                    end
                    4'b0001:
                    begin 
                        //1 & 4 from mem 1 and 4

                        o_bly_32            = 0;

                        //for a-Muxes
                        o_a_sel     [0]     = 1+1; //which to be a0
                        o_a_sel     [1]     = 4+1; //which to be a1

                        //for tw reading mem 
                        o_tw_addr   [0]     = 2;
                        o_tw_sign   [0]     = 1;
                        
                        //for the reading mems 
                        o_raddr     [1]     = 0; 
                        o_raddr     [4]     = 0;

                        //for the output
                        o_en_out    [1]     = 1;
                        o_en_out    [4]     = 1; 

                        ns                  = R2;
                    end
                    4'b0010:
                    begin 
                        //2 & 5 from mem 2 and 5

                        o_bly_32            = 0;

                        //for a-Muxes
                        o_a_sel     [0]     = 2+1; //which to be a0
                        o_a_sel     [1]     = 5+1; //which to be a1

                        //for tw reading mem 
                        o_tw_addr   [0]     = 1;
                        o_tw_sign   [0]     = 0;
                        
                        //for the reading mems 
                        o_raddr     [2]     = 0; 
                        o_raddr     [5]     = 0;

                        //for the output
                        o_en_out    [2]     = 1;
                        o_en_out    [5]     = 1; 
                        
                        t_done              = 1;
                        t_n_counter         = 0;       
                        ns                  = IDLE;
                    end
                    default:    
                        ns                  = IDLE;
                    endcase 
                end
                2'b10:
                begin 
                    case (t_c_counter)
                    4'b0000:
                    begin
                        //0 & 3 from mem 0 and 3

                        o_bly_32            = 0;

                        //for a-Muxes
                        o_a_sel     [0]     = 0+1; //which to be a0
                        o_a_sel     [1]     = 3+1; //which to be a1

                        //for tw reading mem 
                        o_tw_addr   [0]     = 0;
                        o_tw_sign   [0]     = 0;
                        
                        //for the reading mems 
                        o_raddr     [0]     = 0; 
                        o_raddr     [3]     = 0;

                        //for first mem
                        o_sel_wr    [0]     = 0;
                        o_we        [0]     = 1;  
                        o_waddr     [0]     = 0;

                        //for second mem
                        o_sel_wr    [3]     = 1;
                        o_we        [3]     = 1;  
                        o_waddr     [3]     = 0;

                        ns                  = R2;
                    end
                    4'b0001:
                    begin 
                        //1 & 4 from mem 1 and 4

                        o_bly_32            = 0;

                        //for a-Muxes
                        o_a_sel     [0]     = 1+1; //which to be a0
                        o_a_sel     [1]     = 4+1; //which to be a1

                        //for tw reading mem 
                        o_tw_addr   [0]     = 2;
                        o_tw_sign   [0]     = 1;
                        
                        //for the reading mems 
                        o_raddr     [1]     = 0; 
                        o_raddr     [4]     = 0;

                        //for first mem
                        o_sel_wr    [1]     = 0;
                        o_we        [1]     = 1;  
                        o_waddr     [1]     = 0;

                        //for second mem
                        o_sel_wr    [4]     = 1;
                        o_we        [4]     = 1;  
                        o_waddr     [4]     = 0;

                        ns                  = R2;
                    end
                    4'b0010:
                    begin 
                        //2 & 5 from mem 2 and 5

                        o_bly_32            = 0;

                        //for a-Muxes
                        o_a_sel     [0]     = 2+1; //which to be a0
                        o_a_sel     [1]     = 5+1; //which to be a1

                        //for tw reading mem 
                        o_tw_addr   [0]     = 1;
                        o_tw_sign   [0]     = 0;
                        
                        //for the reading mems 
                        o_raddr     [2]     = 0; 
                        o_raddr     [5]     = 0;

                        //for first mem
                        o_sel_wr    [2]     = 0;
                        o_we        [2]     = 1;  
                        o_waddr     [2]     = 0;

                        //for second mem
                        o_sel_wr    [5]     = 1;
                        o_we        [5]     = 1;  
                        o_waddr     [5]     = 0;

                        ns                  = R2;
                    end
                    4'b0011:
                    begin
                        //6 & 9 from mem 3 and 0

                        o_bly_32            = 0;

                        //for a-Muxes
                        o_a_sel     [0]     = 3+1; //which to be a0
                        o_a_sel     [1]     = 0+1; //which to be a1

                        //for tw reading mem 
                        o_tw_addr   [0]     = 0;
                        o_tw_sign   [0]     = 0;

                        //for the reading mems 
                        o_raddr     [0]     = 1; 
                        o_raddr     [3]     = 1;

                        //for first mem
                        o_sel_wr    [3]     = 0;
                        o_we        [3]     = 1;  
                        o_waddr     [3]     = 1;

                        //for second mem
                        o_sel_wr    [0]     = 1;
                        o_we        [0]     = 1;  
                        o_waddr     [0]     = 1;

                        ns                  = R2;
                    end
                    4'b0100:
                    begin 
                        //7 & 10 from mem 4 and 1

                        o_bly_32            = 0;

                        //for a-Muxes
                        o_a_sel     [0]     = 4+1; //which to be a0
                        o_a_sel     [1]     = 1+1; //which to be a1

                        //for tw reading mem 
                        o_tw_addr   [0]     = 2;
                        o_tw_sign   [0]     = 1;
                        
                        //for the reading mems 
                        o_raddr     [1]     = 1; 
                        o_raddr     [4]     = 1;

                        //for first mem
                        o_sel_wr    [4]     = 0;
                        o_we        [4]     = 1;  
                        o_waddr     [4]     = 1;

                        //for second mem
                        o_sel_wr    [1]     = 1;
                        o_we        [1]     = 1;  
                        o_waddr     [1]     = 1;

                        ns                  = R2;
                    end
                    4'b0101:
                    begin 
                        //8 & 11 from mem 5 and 2

                        o_bly_32            = 0;

                        //for a-Muxes
                        o_a_sel     [0]     = 5+1; //which to be a0
                        o_a_sel     [1]     = 2+1; //which to be a1

                        //for tw reading mem 
                        o_tw_addr   [0]     = 1;
                        o_tw_sign   [0]     = 0;
                        
                        //for the reading mems 
                        o_raddr     [5]     = 1; 
                        o_raddr     [2]     = 1;

                        //for first mem
                        o_sel_wr    [5]     = 0;
                        o_we        [5]     = 1;  
                        o_waddr     [5]     = 1;

                        //for second mem
                        o_sel_wr    [2]     = 1;
                        o_we        [2]     = 1;  
                        o_waddr     [2]     = 1; 

                        ns                  = R2;
                    end
                    4'b0110:
                    begin
                        //0 & 6 from mem 0 and 3

                        o_bly_32            = 0;

                        //for a-Muxes
                        o_a_sel     [0]     = 0+1; //which to be a0
                        o_a_sel     [1]     = 3+1; //which to be a1

                        //for tw reading mem 
                        o_tw_addr   [0]     = 0;
                        o_tw_sign   [0]     = 0;
                        
                        //for the reading mems 
                        o_raddr     [0]     = 0; 
                        o_raddr     [3]     = 1;

                        //for the output
                        o_en_out    [0]     = 1;
                        o_en_out    [6]     = 1;

                        ns                  = R2;
                    end
                    4'b0111:
                    begin 
                        //1 & 7 from mem 1 and 4

                        o_bly_32            = 0;

                        //for a-Muxes
                        o_a_sel     [0]     = 1+1; //which to be a0
                        o_a_sel     [1]     = 4+1; //which to be a1

                        //for tw reading mem 
                        o_tw_addr   [0]     = 3;
                        o_tw_sign   [0]     = 0;
                        
                        //for the reading mems 
                        o_raddr     [1]     = 0; 
                        o_raddr     [4]     = 1;

                        //for the output
                        o_en_out    [1]     = 1;
                        o_en_out    [7]     = 1;

                        ns                  = R2;
                    end
                    4'b1000:
                    begin 
                        //2 & 8 from mem 2 and 5

                        o_bly_32            = 0;

                        //for a-Muxes
                        o_a_sel     [0]     = 2+1; //which to be a0
                        o_a_sel     [1]     = 5+1; //which to be a1

                        //for tw reading mem 
                        o_tw_addr   [0]     = 2;
                        o_tw_sign   [0]     = 1;
                        
                        //for the reading mems 
                        o_raddr     [2]     = 0; 
                        o_raddr     [5]     = 1;

                        //for the output
                        o_en_out    [2]     = 1;
                        o_en_out    [8]     = 1; 
                             
                        ns                  = R2;
                    end
                    4'b1001:
                    begin
                        //3 & 9 from mem 3 and 0

                        o_bly_32            = 0;

                        //for a-Muxes
                        o_a_sel     [0]     = 3+1; //which to be a0
                        o_a_sel     [1]     = 0+1; //which to be a1

                        //for tw reading mem 
                        o_tw_addr   [0]     = 4;
                        o_tw_sign   [0]     = 0;
                        
                        //for the reading mems 
                        o_raddr     [3]     = 0; 
                        o_raddr     [0]     = 1;

                        //for the output
                        o_en_out    [3]     = 1;
                        o_en_out    [9]     = 1;

                        ns                  = R2;
                    end
                    4'b1010:
                    begin 
                        //4 & 10 from mem 4 and 1

                        o_bly_32            = 0;

                        //for a-Muxes
                        o_a_sel     [0]     = 4+1; //which to be a0
                        o_a_sel     [1]     = 1+1; //which to be a1

                        //for tw reading mem 
                        o_tw_addr   [0]     = 1;
                        o_tw_sign   [0]     = 0;
                        
                        //for the reading mems 
                        o_raddr     [4]     = 0; 
                        o_raddr     [1]     = 1;

                        //for the output
                        o_en_out    [4]     = 1;
                        o_en_out    [10]     = 1;
                        ns                  = R2;
                    end
                    4'b1011:
                    begin 
                        //5 & 11 from mem 5 and 2

                        o_bly_32            = 0;

                        //for a-Muxes
                        o_a_sel     [0]     = 5+1; //which to be a0
                        o_a_sel     [1]     = 2+1; //which to be a1

                        //for tw reading mem 
                        o_tw_addr   [0]     = 5;
                        o_tw_sign   [0]     = 0;
                        
                        //for the reading mems 
                        o_raddr     [5]     = 0; 
                        o_raddr     [2]     = 1;

                        //for the output
                        o_en_out    [5]     = 1;
                        o_en_out    [11]     = 1;
                        
                        t_done              = 1;
                        t_n_counter         = 0;       
                        ns                  = IDLE;
                    end
                    default:    
                        ns                  = IDLE;
                    endcase 
                end
                default:    ns = IDLE;
            endcase                
        end
    default:     ns = IDLE;
  endcase
end
/*
// Output Logic
always_comb begin
    o_we        = 0;  
    o_addr      = 0;
    o_sel_wr    = 0;
    o_tw_sign   = 0;
    o_tw_addr   = 0;
    o_bly_32    = 0;
    o_a_sel     = 0;
    o_in_sel    = 0;
    o_out_sel   = 0;
    o_done      = 0;
    o_puttin    = 0;
  case (cs)
    IDLE:
    R3_3:
        begin
            //0-1-2
            o_in_sel    [0]     = 4'd0;
            o_in_sel    [1]     = 4'd1;
            o_in_sel    [2]     = 4'd2;

            o_bly_32            = 1'd1;
            o_a_sel     [0]     = 3'd0;
            o_a_sel     [1]     = 3'd0;

            o_tw_addr   [0]     = 3'd0;
            o_tw_addr   [1]     = 3'd1;

            //for first mem
            o_sel_wr    [0]     = 2'd0;
            o_we        [0]     = 1'd1;  
            o_addr      [0]     = 1'd0;

            //for second mem
            o_sel_wr    [1]     = 2'd1;
            o_we        [1]     = 1'd1;  
            o_addr      [1]     = 1'd0;

            //for third mem
            o_sel_wr    [2]     = 2'd2;
            o_we        [2]     = 1'd1;  
            o_addr      [2]     = 1'd0;
        end
    OUT_3_1:
        begin
            o_puttin            = 1'd1;

            //read from mem
            o_addr      [0]     = 1'd0;

            //select it from the out mux
            o_out_sel           = 3'd0;
        end
    OUT_3_2:
        begin
            o_puttin            = 1'd1;

            //read from mem
            o_addr      [1]     = 1'd0;

            //select it from the out mux
            o_out_sel           = 3'd1;
        end
    OUT_3_3:
        begin
            o_puttin            = 1'd1;

            //read from mem
            o_addr      [2]     = 1'd0;

            //select it from the out mux
            o_out_sel           = 3'd2;
        end

    //0-2-4-1-3-5
    R3_6_11:
    //0-2-4
        begin
            o_in_sel    [0]     = 4'd0;
            o_in_sel    [1]     = 4'd2;
            o_in_sel    [2]     = 4'd4;

            o_bly_32            = 1'd1;
            o_a_sel     [0]     = 3'd0;
            o_a_sel     [1]     = 3'd0;

            o_tw_addr   [0]     = 3'd0;
            o_tw_addr   [1]     = 3'd1;

            //for first mem
            o_sel_wr    [0]     = 2'd0;
            o_we        [0]     = 1'd1;  
            o_addr      [0]     = 1'd0;

            //for second mem
            o_sel_wr    [1]     = 2'd1;
            o_we        [1]     = 1'd1;  
            o_addr      [1]     = 1'd0;

            //for third mem
            o_sel_wr    [2]     = 2'd2;
            o_we        [2]     = 1'd1;  
            o_addr      [2]     = 1'd0;
        end
    R3_6_12:
    //1-3-5
        begin
            o_in_sel    [0]     = 4'd1;
            o_in_sel    [1]     = 4'd3;
            o_in_sel    [2]     = 4'd5;

            o_bly_32            = 1'd1;
            o_a_sel     [0]     = 3'd0;
            o_a_sel     [1]     = 3'd0;

            o_tw_addr   [0]     = 3'd0;
            o_tw_addr   [1]     = 3'd1;

            //for first mem
            o_sel_wr    [3]     = 2'd0;
            o_we        [3]     = 1'd1;  
            o_addr      [3]     = 1'd0;

            //for second mem
            o_sel_wr    [4]     = 2'd1;
            o_we        [4]     = 1'd1;  
            o_addr      [4]     = 1'd0;

            //for third mem
            o_sel_wr    [5]     = 2'd2;
            o_we        [5]     = 1'd1;  
            o_addr      [5]     = 1'd0;
        end

    R2_6_21:
        begin
            //for a0
            o_a_sel     [0]     = 3'd1; //mem0
            //for a1
            o_a_sel     [1]     = 3'd3; //mem3

            //twiddles
            o_tw_addr   [0]     = 3'd0;
            o_tw_addr   [1]     = 3'd1;

            //twiddle signs
            o_tw_sign   [0]     = 1'b0;
            o_tw_sign   [0]     = 1;

            //for first mem
            o_sel_wr    [3]     = 2'd0;
            o_we        [3]     = 1'd1;  
            o_addr      [3]     = 1'd0;

            //for second mem
            o_sel_wr    [4]     = 2'd1;
            o_we        [4]     = 1'd1;  
            o_addr      [4]     = 1'd0;

            //for third mem
            o_sel_wr    [5]     = 2'd2;
            o_we        [5]     = 1'd1;  
            o_addr      [5]     = 1'd0;
        end
    R2_6_22:     ns = R2_6_23;
    R2_6_23:     ns = OUT_6_1;

    OUT_6_1:     ns = OUT_6_2;
    OUT_6_2:     ns = OUT_6_3;
    OUT_6_3:     ns = OUT_6_4;
    OUT_6_4:     ns = OUT_6_5;
    OUT_6_5:     ns = OUT_6_6;
    OUT_6_6:     ns = IDLE;

    R3_12_11:    ns = R3_12_12;
    R3_12_12:    ns = R3_12_13;
    R3_12_13:    ns = R3_12_14;
    R3_12_14:    ns = R2_12_21;

    R2_12_21:    ns = R2_12_22;
    R2_12_22:    ns = R2_12_23;
    R2_12_23:    ns = R2_12_24;
    R2_12_24:    ns = R2_12_25;
    R2_12_25:    ns = R2_12_26;
    R2_12_26:    ns = R2_12_31;

    R2_12_31:    ns = R2_12_32;
    R2_12_32:    ns = R2_12_33;
    R2_12_33:    ns = R2_12_34;
    R2_12_34:    ns = R2_12_35;
    R2_12_35:    ns = R2_12_36;
    R2_12_36:    ns = OUT_12_1;

    OUT_12_1:    ns = OUT_12_2;
    OUT_12_2:    ns = OUT_12_3;
    OUT_12_3:    ns = OUT_12_4;
    OUT_12_4:    ns = OUT_12_5;
    OUT_12_5:    ns = OUT_12_6;
    OUT_12_6:    ns = OUT_12_7;
    OUT_12_7:    ns = OUT_12_8;
    OUT_12_8:    ns = OUT_12_9;
    OUT_12_9:    ns = OUT_12_10;
    OUT_12_10:   ns = OUT_12_11;
    OUT_12_11:   ns = OUT_12_12;
    OUT_12_12:   ns = IDLE;

    default:     ns = IDLE;
  endcase
end


  // Output assignment
  assign fsm_state = cs;
*/
endmodule
