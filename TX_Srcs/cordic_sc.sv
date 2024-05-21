/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : CORDIC Trig block
Dependancy     :
Design doc.    : 
References     : 
Description    : computes sine and cosine of an angle
Owner          : Yahia Ahmed
*/

module cordic_sc
#(
    parameter DATA_WIDTH = 16,
    parameter FRAC_WIDTH  = 12,
    parameter INT_WIDTH   = 4
)
(  // Inputs
  input logic                                     i_clk,
                                                  i_rst_n,
                                                  i_start,
  input logic signed      [DATA_WIDTH-1:0]        i_angle,

  output logic                                    o_done, 
  // Outputs
  output logic signed     [DATA_WIDTH-1:0]        o_cosine, 
                                                  o_sine
);
  //the constant of rotations
  logic signed         [DATA_WIDTH-1:0]           t_factor;
  // Generate table of atan values
  logic signed         [DATA_WIDTH-1:0]           atan_table  [0:14];

  // make sure rotation angle is in -pi/2 to pi/2 range
 // logic                [1:0]                      t_quadrant;

  //counter signal
  logic                 [4-1:0]                   t_ctr;

  //current stage signals
  logic signed          [DATA_WIDTH-1:0]          t_x;
  logic signed          [DATA_WIDTH-1:0]          t_y;
  logic signed          [DATA_WIDTH-1:0]          t_z;


  //un-factored signals
  logic signed          [DATA_WIDTH-1:0]          t_x_um;
  logic signed          [DATA_WIDTH-1:0]          t_y_um;

  //un-trunacated signals
  logic signed          [2*DATA_WIDTH-1:0]        t_x_n_unt;
  logic signed          [2*DATA_WIDTH-1:0]        t_y_n_unt;

  //current shifted signals
  logic signed          [DATA_WIDTH-1:0]          t_x_shr;
  logic signed          [DATA_WIDTH-1:0]          t_y_shr;

  //next stage signals
  logic signed          [DATA_WIDTH-1:0]          t_x_n;
  logic signed          [DATA_WIDTH-1:0]          t_y_n;
  logic signed          [DATA_WIDTH-1:0]          t_z_n;

  //edge sig
  logic                                           t_start_d,
                                                  t_detegde;

  //shifting signals
  //add sub sigs
  logic signed          [DATA_WIDTH:0]          t_angle_s90;
  logic signed          [DATA_WIDTH:0]          t_angle_a90;

  //new special angle
  logic signed          [DATA_WIDTH-1:0]        t_angle_sp;

  //ctrrl sigs
  logic                                         c_sign_2;
  logic                                         c_sign_3,
                                                c_switch,
                                                c_sign_x,
                                                c_sign_y;

  //new special angle
  logic signed          [DATA_WIDTH-1:0]        t_x_adj,
                                                t_y_adj;

  initial 
  begin
    $readmemb("cordump_fp.mem", atan_table);
  end

  //edge detector
  always_ff @(posedge i_clk or negedge i_rst_n) 
  begin
      if (!i_rst_n)       // Reset condition
        t_start_d <= 0;
      else
        t_start_d <= i_start;
  end

   assign t_detegde = ~t_start_d & i_start;

  always_ff @(posedge i_clk or negedge i_rst_n) 
  begin
    if (!i_rst_n)       // Reset condition
      t_ctr <= 4'b0000;
    else if (o_done || t_detegde) 
      t_ctr <= 4'b0000;
    else if (t_start_d || (t_ctr != 0))  // Increment condition (when enable is active)
      t_ctr <= t_ctr + 1;
  end

    
  always_comb 
  begin
    t_angle_s90 = $signed(i_angle - 16'b0001100100100010);
    t_angle_a90 = $signed(i_angle + 16'b0001100100100010);

    c_sign_2    = t_angle_s90[DATA_WIDTH];
    c_sign_3    = t_angle_a90[DATA_WIDTH];

    case ({c_sign_2, c_sign_3})
      2'b00: //2nd quad
      begin
        t_angle_sp  = t_angle_s90 [DATA_WIDTH-1:0];
        c_switch    = 1'b1;
        c_sign_x    = 1'b0;
        c_sign_y    = 1'b1;
      end
      2'b10: //1st or 4th quad
      begin
        t_angle_sp  = i_angle;
        c_switch    = 1'b0;
        c_sign_x    = 1'b0;
        c_sign_y    = 1'b0;
      end
      2'b11: //3rd quad
      begin
        t_angle_sp  = t_angle_a90 [DATA_WIDTH-1:0];
        c_switch    = 1'b1;
        c_sign_x    = 1'b1;
        c_sign_y    = 1'b0;
      end
      default: 
      begin
        t_angle_sp  = i_angle;
        c_switch    = 1'b0;
        c_sign_x    = 1'b0;
        c_sign_y    = 1'b0;
      end
    endcase
  end

    assign t_factor = 'b0000100110110111;

    flexmux 
    #(
        .DATA_WIDTH                                 ((3*DATA_WIDTH)/2),
        .SEL_WIDTH                                  (1)
    ) 
    mux_inst 
    (
        .select                                     ((t_ctr == 0)),
        .data_in                                    ({{t_z_n, t_x_n, t_y_n}, {t_angle_sp, 16'b0001_000000000000, 16'b0000_000000000000}}),
        .data_out                                   ({t_z, t_x, t_y})
    );

  // operation of x and y

  always_comb 
  begin

      t_x_shr <= t_x >>> (t_ctr);
      t_y_shr <= t_y >>> (t_ctr);

      t_x_um  =  t_z[15] ? t_x + t_y_shr              :   t_x - t_y_shr;
      t_y_um  =  t_z[15] ? t_y - t_x_shr              :   t_y + t_x_shr;

      t_x_n_unt   =  t_x_um * t_factor;
      t_y_n_unt   =  t_y_um * t_factor;
  end

  
  always_ff @(posedge i_clk or negedge i_rst_n) 
  begin
    if (!i_rst_n)
      begin
      t_x_n <=  0;
      t_y_n <=  0;
      t_z_n <=  0;
      o_done<=  0;
      end
    else if (o_done || t_detegde) 
      begin
      t_x_n <=  0;
      t_y_n <=  0;
      t_z_n <=  0;
      o_done<=  0;
      end
    else if (t_start_d || (t_ctr != 0))
      begin
      t_x_n   <=  (t_ctr == 14) ? t_x_n_unt[INT_WIDTH+2*FRAC_WIDTH-1:FRAC_WIDTH] :   t_x_um;// to be parameterized
      t_y_n   <=  (t_ctr == 14) ? t_y_n_unt[INT_WIDTH+2*FRAC_WIDTH-1:FRAC_WIDTH] :   t_y_um;
      t_z_n   <=  t_z[15] ? t_z + atan_table[t_ctr] :   t_z - atan_table[t_ctr];

      o_done<=  (t_ctr == 14);
      end
  end

  
  comp2sre 
  #(
      .DATA_WIDTH                                 (DATA_WIDTH)
  ) 
  comp2sre_inst_x
  (
      .i_ctrl                                     (c_sign_x),
      .i_din                                      (t_x_n),
      .o_dout                                     (t_x_adj)
  );

  comp2sre 
  #(
      .DATA_WIDTH                                 (DATA_WIDTH)
  ) 
  comp2sre_inst_y
  (
      .i_ctrl                                     (c_sign_y),
      .i_din                                      (t_y_n),
      .o_dout                                     (t_y_adj)
  );

assign o_cosine = (c_switch)? t_y_adj : t_x_adj;
assign o_sine   = (c_switch)? t_x_adj : t_y_adj;

endmodule



