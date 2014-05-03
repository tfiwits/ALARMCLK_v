module D009_20131209_ALARMCLK(clk,rst,counterOut,Borrow);

//Verilog file, please check same references on web
parameter DownFrom = 3;
parameter Bitwidth = 4;

// input/ output
input clk,rst;
output [Bitwidth-1:0] counterOut;
output Borrow;

// wiring
wire clk,rst;
wire [Bitwidth-1:0] counterOut;


// save value place
reg [Bitwidth-1:0] Counter;
reg Borrow;

assign counterOut[Bitwidth-1:0] = Counter[Bitwidth-1:0]-1;

always @(posedge clk or posedge ~rst)
	begin
		if(rst==0)
		begin
			Counter =DownFrom;
			Borrow = 0;
		end
		else
		begin
			Counter = Counter-1;
			if(Counter == 0)
			begin
				Borrow = 1;
				Counter =DownFrom;
			end
			else
			begin
				Borrow = 0;
			end
		end
	end
endmodule

