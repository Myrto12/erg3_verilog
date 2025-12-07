module DFF_tonos(d,shift_ena,q,clk,rst);
input d,shift_ena,clk,rst;
output reg q;
always @ (posedge clk)
begin : DFF_tonos
	if(rst==1'b1) 
	q=1'b0;
	else if(shift_ena==1'b1)
	q = d;
	else
	q = q;
	end
endmodule
		
