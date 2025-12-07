module test_nbit_shifter;
reg shift_ena,clock,reset,load;
reg [15:0]inp;
wire [15:0]outp;
nbit_shifter #(.n(16)) test(.shift_ena(shift_ena),.clock(clock),.reset(reset),.load(load),.inp(inp),.outp(outp));
initial clock = 0;
always #5 clock = ~clock;

initial begin

        reset = 1;		
        load = 0;
        shift_ena = 0;
        inp = 16'b0000000000000000;
        #20;

        reset = 0;
        inp = 16'b0101010101010101;

        @(posedge clock);
        load = 1;
        shift_ena = 1;    
        @(posedge clock);
        load = 0;         

        repeat (32) @(posedge clock); //2*16
	$stop;
	
end  
initial begin 
	$display("input reset   load shift_ena|output");
	$monitor(" %b     %b      %b      %b  | %b",inp,reset,load,shift_ena,outp);
end
endmodule


