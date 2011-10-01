/*HENG LOW WEE
U096901R
Problem Set 4 Problem 1*/

fractal(X=Expr, K, Length) :- 
	writeln(Expr),
	!.
	
:- tell('output.py'),
	writeln('from turtle import *'),
	writeln('import time'),
 	fractal(X=Expr, K, Length),
	writeln('time.sleep(30)'),
	told,
	!.