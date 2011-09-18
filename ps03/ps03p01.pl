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

:- op(200, yfx, beside).
:- op(200, yfx, rotate).

montage(Expr, File) :- atom(Expr), File=asd,!.

% beside
montage(Expr, File) :- Expr =.. [Op, Arg1, Arg2],
	montage(Arg1, F1),
	montage(Arg2, F2),
	!.
	
% rotate
montage(Expr, File) :- Expr =.. [Op, Arg1],
	montage(Arg1, F1),
	!.