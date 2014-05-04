module D009_20131209_ALARMCLKa(clk,rst,counterOut,Borrow);

//for H
parameter DownFrom =10;
parameter Bitwidth = 4;

// input/ output
input clk,rst;
output [Bitwidth-1:0] counterOut;
output Borrow;

// wiring
wire clk,rst;
wire [Bitwidth-1:0] counterOut;


// save value place
reg [Bitwidth-1:0] Counter = DownFrom;
reg Borrow;
reg [Bitwidth-1:0] Counter1 = 4; 

assign counterOut =  Counter-1;

always @(posedge clk or posedge ~rst)
	begin
		if(rst==0)
		begin
			Counter = 4 ;
			Borrow = 0;
		end
		else
		begin
			Counter = Counter-1;
			if(Counter == 0)
			begin
				Borrow = 1;
				Counter = 10;
			end
			else
			begin
				Borrow = 0;
			end
		end
	end
endmodule

