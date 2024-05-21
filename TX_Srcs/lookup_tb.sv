module lookup_tb();

    logic clk;
    logic [3:0] i_Nsc, i_NRU;

    logic [3:0] i_Qm;

    logic [3:0] i_Nslots;
    logic [8:0] o_rows;
    logic [5:0] o_columns;
    initial begin
        i_Nsc='d12;
        i_NRU='d10;
        i_Qm='d4;
        i_Nslots='d8;


        

    end


    always begin
        #5 clk = !clk;
    end

    Lookup_table_Channel_Interleaver lut (i_Nsc, i_NRU, i_Qm, i_Nslots, o_rows, o_columns);

endmodule