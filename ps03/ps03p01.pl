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

montage(Expr, File) :- Expr =.. [Op, Arg1, Arg2],
	montage(Arg1, F1),
	montage(Arg2, F2),
	(Op = beside
		-> write('convert -scale 50%%x50%% '), write(F1), writeln(' test'),
		   write('convert -scale 50%%x50%% '), write(F2), writeln(' test')
	),
	!.
	
montage(Expr, File) :- Expr =.. [Op, Arg1],
	montage(Arg1, F1),
	(Op = rotate
		-> write('convert -rotate 90 '), write(F1)
	),
	!.

% no command, just atom
montage(Expr, File) :- atom(Expr), File = Expr,!.
