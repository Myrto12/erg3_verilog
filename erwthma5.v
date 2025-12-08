module nbit_shifter #(parameter n)(shift_ena,clock,reset,load,inp,outp);
input shift_ena,clock,reset,load;
input [n-1:0]inp;
wire [n-1:0]w,q;
output [n-1:0]outp;
genvar i;

generate
for(i=0;i<n-1;i=i+1) begin
mux_2x1 M1(.A(q[i+1]),.B(inp[i]),.S0(load),.Y(w[i]));
DFF_tonos D0(.d(w[i]),.shift_ena(shift_ena),.q(q[i]),.clk(clock),.rst(reset));
assign outp[i]=q[i];
end
endgenerate

mux_2x1 M(.A(q[0]),.B(inp[n-1]),.S0(load),.Y(w[n-1])); //aristera mux
DFF_tonos D_LAST(.d(w[n-1]),.shift_ena(shift_ena),.q(q[n-1]),.clk(clock),.rst(reset));//aristera dff
assign outp[n-1]=q[n-1];
endmodule
