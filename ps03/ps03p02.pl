/*
Heng Low Wee
U096901R

Problem Set 3 Problem 2
*/

:- op(200, yfx, beside).
:- op(200, yfx, rotate).

montage(Expr, File) :- Expr =.. [Op, Arg1, Arg2],
	montage(Arg1, F1),
	montage(Arg2, F2),
	(Op = beside
		-> atom_concat(F1, '1', F11), write('convert -scale 50%%x100%% '), write(F1), write('.jpg '), write(F11), write('.jpg '), writeln(''), 
		   atom_concat(F2, '2', F22), write('convert -scale 50%%x100%% '), write(F2), write('.jpg '), write(F22), write('.jpg '), writeln(''),
		   atom_concat(F11, F22, Fout), write('convert +append '), write(F11), write('.jpg '), write(F22), write('.jpg '), write(Fout), write('.jpg '), writeln('')
	),
	File = Fout,
	!.
	
montage(Expr, File) :- Expr =.. [Op, Arg1],
	montage(Arg1, F1),
	(Op = rotate
		-> atom_concat(F1, '3', R),
write('convert -rotate 90 '), write(F1), write('.jpg '), write(R), write('.jpg '), writeln('')
	),
	File = R,
	!.

% no command, just atom
montage(Expr, File) :- atom(Expr), File = Expr,!.

ma(Expr) :- Expr =.. [Delim, Left, Right],
	Left =.. [Op, Var, Val],
	montage(Val,F),
	assert(equals(Var,F)),
	ma(Right),
	!.

ma(Expr) :- Expr =.. [Delim, Left, Right],
	atom(Left),
	montage(Right,F),
	assert(equals(Left, F)),
	!.
	

