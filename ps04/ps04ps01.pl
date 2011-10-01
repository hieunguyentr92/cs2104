/*

HENG LOW WEE
U096901R
Problem Set 4 Problem 1

NOTE:
To run the problem, the equation needs to be included in this file first
Go to ----->
Equation will be executed on 'consult'

*/

fractal(X=Expr, K, Length) :- 
	writeln(Expr),
	!.
	
:- tell('output.py'),
	writeln('from turtle import *'),
	writeln('import time'),
	% -----> ENTER EQUATION HERE
 	fractal(g=(equation),2,2),
	writeln('time.sleep(30)'),
	told,
	!.