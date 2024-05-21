module CHB (
    input clk,en,rst,
    input logic [1:0] v_k0,v_k1,v_k2,
    input logic readRAM1,readRAM2,readRAM3,

    output logic [1:0] v_k,
    output logic v_k_Valid,v_k_Valid2,v_k_Valid3
);
    always_ff @( posedge clk,negedge rst ) begin
    if (!rst) begin
        v_k <= 0;
        v_k_Valid  <= 0;
        v_k_Valid2 <= 0;
        v_k_Valid3 <= 0;
   end
   else begin 
        if(en) begin
            if (readRAM1 && !readRAM2 && !readRAM3) begin
                v_k <= v_k0;
                v_k_Valid <=1;
            end
            else if (!readRAM1 && readRAM2 && !readRAM3) begin
                v_k <= v_k1;
                v_k_Valid2 <= 1;
            end
            else begin
                v_k <= v_k2;
                v_k_Valid3 <= 1;
            end
        end
    end
end
endmodule