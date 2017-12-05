module exe_memreg(clk, b, c, enableME);
parameter N=63;
input clk, enableME;
input [N:0] b;
output reg [N:0] c;

always @ (posedge clk)
    if (enableME==1'b1) c<=b;
    else c<=64'b0;
    endmodule