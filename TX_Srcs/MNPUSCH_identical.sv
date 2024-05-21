//MNPUSCH Calculation
module MNPUSCH_identical (
input		logic [2:0] i_Irep,
output      logic [2:0] o_Number_Repetition
);
logic [2:0] o_MNPUSCH_identical;
assign o_MNPUSCH_identical= (i_Irep <= 3'b1)?3'd1:((i_Irep == 3'd2)? 3'd2: 3'd4);
assign o_Number_Repetition=o_MNPUSCH_identical-1'b1;
endmodule
