module teclado ( 
	clr,
	clk,
	l,
	display,
	columna,
	fila
	) ;

input  clr;
input  clk;
input  l;
inout [6:0] display;
inout [2:0] columna;
input [3:0] fila;
