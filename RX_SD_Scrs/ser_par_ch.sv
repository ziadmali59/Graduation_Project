module ser_par_ch
#(
    parameter DATA_WIDTH = 16,
    parameter DOUBLE_DATA_WIDTH = 32,
    parameter DEPTH = 13
)
(
    input wire clk,
    input wire i_rst_n,
    input logic signed [DOUBLE_DATA_WIDTH-1:0] i_data,
    //input logic signed [DATA_WIDTH-1:0] i_im_data,
    output logic signed [DOUBLE_DATA_WIDTH-1:0] o_data [DEPTH-1:0],

    output logic o_done_equ //new 15/5
);

logic [$clog2(DEPTH)-1:0] counter = 0;
logic flag;

always_ff @(posedge clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        counter <= '0;
  
        for (int i = 0; i < DEPTH; i++) begin
            //shift_reg[i] = '0;
            o_data[i]='0;
        end

    end else begin
        if (counter == DEPTH-1) begin
            counter <= counter;//'0;
        end else begin
            counter <= counter + 1;//2;
        end
        if (counter < DEPTH) begin
           o_data[counter]   <= i_data;
         //  o_data[counter+1] <= i2_data;
        end
    end
end

always_ff@(posedge clk  ) begin
if((counter == DEPTH-2))begin
o_done_equ=1;

end
else begin
o_done_equ=0;
end

end
endmodule