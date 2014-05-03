`timescale 1ns/1ps

module CountUP_TB;


// parameter setup..............
parameter Bitwidth = 4;


// wire/reg define.......
reg clk,rst;
reg pb_s,pb_d,pb_h;
reg df,df_0,ed;
wire [1:0]ssel;
wire  pc,pd,pe,pf,q,pin_nameaaa;
wire [3:0] pin_name59,pin_name544,dd,aa,nn,cc;
wire [Bitwidth-1:0] CountOut;
wire [Bitwidth-1:0] CountOut1;  // data to be saved
wire Carry;


Block1  test(.df(df),.df_0(df_0),.pin_name3(clk),.pin_name9(rst),.pa(CountOut),.pb(CountOut1),.pb_s(pb_s),.pb_d(pb_d),.pb_h(pb_h),.pin_name59(pin_name59),.pin_name544(pin_name544),.ssel(ssel),.dd(dd),.cc(aa),.nn(nn),.gg(cc));


initial
begin
	pb_h=1;
	pb_d=1;
	pb_s=1;
	df = 0;
	df_0 = 0;
	clk = 0;
	rst = 0;
end
always #20 clk  = ~clk;
always #10  rst = 1;

endmodule
