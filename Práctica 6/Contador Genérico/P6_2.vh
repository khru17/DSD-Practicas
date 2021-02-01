module contadorgenerico ( 
	clk,
	clr,
	en,
	ud,
	l,
	d,
	c,
	q
	) ;

input  clk;
input  clr;
input  en;
input  ud;
input  l;
input [6:0] d;
inout  c;
inout [6:0] q;
