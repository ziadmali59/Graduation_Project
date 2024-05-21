interface Arb_if(input logic clk);
logic [1:0] request;
logic [1:0] grant;
logic rst;
    


clocking cb @(posedge clk);
default input #1 output  #1;
input request;
output grant;
endclocking //cb


modport dut (
input rst,request,clk,output grant
);

modport test (
input grant,
output request,rst
);
endinterface //Arb_if

module tb (
    Arb_if.test arb_IF
);



initial 
begin
    @(arb_IF.cb);
    arb_IF.request <= 1;
    $display("@%0t : Drove req=01 ",$time);
    repeat (2) @(arb_IF.cb);
    if (arb_IF.grant != 1) 
    begin
        $display("@%0t : Grant is not 1 ",$time);
        $finish;
    end   
end

    
endmodule

module arb_with_port (
    Arb_if.dut arb_IF
);

always @(posedge arb_IF.clk, arb_IF.rst) 
begin
  if (arb_IF.rst) 
  begin
    arb_IF.grant <= 0;  
  end
  else if (arb_IF.request[0]) 
  begin
    arb_IF.grant <= 1;  
  end
    else if (arb_IF.request[1])
    begin
        arb_IF.grant <= 2;
    end
    else
    begin
        arb_IF.grant <= 0;
    end  
end
    
endmodule
  module top();
    logic clk;
    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    Arb_if arb_IF(clk);
    tb tb0(arb_IF);
    arb_with_port arb_with_port0(arb_IF);
    
    
    
    
  endmodule