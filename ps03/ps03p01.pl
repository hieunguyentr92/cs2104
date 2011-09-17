/*
Heng Low Wee
U096901R

Problem Set 3 Problem 1

beside(Image1, Image2)
side by side, horizontal 50%

rotate(Image)
rotate 90º clockwise

scale(Image)
scale by 50% horizontal only, vertical 100%

All input/resulting images are 640x640

*/

%:- op(precedence, type, name).
%:- op(precedence, type, name).

% whole string of expression
montage(Expr, File).

% beside takes in double arguments
beside(Arg1, Arg2).

beside(Arg1, Arg1) :-
	write('convert +append '),
	write(Arg1),
	write(' '),
	write(Arg2),
	write(' '),
	writeln(Output),
	!.

% rotate takes in single argument
rotate(Arg).

rotate(Arg) :-
	write('convert -rotate 90 '),
	write(Input),
	write(' '),
	writeln(Output),
	!.
	