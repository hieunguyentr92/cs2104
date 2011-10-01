/*

HENG LOW WEE
U096901R
Problem Set 4 Problem 1

NOTE:
To run the problem, the equation needs to be included in this file first
Go to ----->
Equation will be executed on 'consult'

Level, K, is assumed to be >= 1

Test Case : fractal(g = (g;left(45);g;right(90);g;left(45);g),3,30).

*/

fractal(X=(Expr),K,L) :-
	writeln('from turtle import *'),
	writeln('import time'),
	writeln('Screen().setworldcoordinates(0,-500, 1500, 1000)'),
	writeln('delay(0)'),
	fractal(X, Expr, K, L),	
	!.

fractal(X, X, 0, L) :-
	write('forward('),
	write(L),
	writeln(')'),
	!.
	
fractal(X, X, K, L) :-
	writeln('hello'),
	K1 is K-1,
	fractal(X, X, K1, L),
	!.
	
fractal(_, left(Angle), _, _) :-
	write('left('),
	write(Angle),
	writeln(')'),
	!.

fractal(_, right(Angle), _, _) :-
	write('right('),
	write(Angle),
	writeln(')'),
	!.
	
fractal(X, Left;Right, K, L) :-
	fractal(X, Left, K, L),
	fractal(X, Right, K, L),
	!.
	
:- tell('output.py'),
	% -----> ENTER EQUATION HERE
 	fractal(g = (g;left(45);g),2,30),
	% After moving so much, the turtle is tired and has fallen asleep
	writeln('time.sleep(10)'),
	told,
	!.