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

montage(Expr, Out) :-
	atom(Expr),
	scale(Expr, 100, 100, Out),
	!.
	
montage(Expr, Out) :-
	Expr =.. [rotate, Arg1],
	atom(Arg1),
	r(Arg1, Out),
	!.
	
montage(Expr, Out) :-
	Expr =.. [rotate, Arg1],
	atom_concat(Out, '3', Out1),
	montage(Arg1, Out1),
	r(Out1, Out),
	!.
	
montage(Expr, Out) :-
	Expr =.. [beside, Arg1, Arg2],
	atom(Arg1), atom(Arg2),
	b(Arg1, Arg2, Out),
	!.
	
montage(Expr, Out) :-
	Expr =.. [beside, Arg1, Arg2],
	atom_concat(Out, '4', Out1),
	atom_concat(Out, '5', Out2),
	montage(Arg1, Out1),
	montage(Arg2, Out2),
	b(Out1, Out2, Out),
	!.
	
b(Arg1, Arg2, Out) :-
	atom(Arg1), atom(Arg2),
	atom_concat(Out, '1', Out1),
	atom_concat(Out, '2', Out2),
	scale(Arg1, 50, 100, Out1),
	scale(Arg2, 50, 100, Out2),
	write('convert +append '),
	write(Out1), write('.jpg '),
	write(Out2), write('.jpg '),
	write(Out), write('.jpg'),
	writeln(''),
	!.
	
r(Arg1, Out) :-
	atom(Arg1),
	write('convert -rotate 90 '),
	write(Arg1), write('.jpg '),
	write(Out), write('.jpg '),
	writeln(''),
	!.
	
scale(Arg1, Width, Height, Out) :-
	atom(Arg1),
	write('convert -scale '),
	write(Width), write('%%x'),
	write(Height), write('%% '),
	write(Arg1), write('.jpg '),
	write(Out), write('.jpg'),
	writeln(''),
	!.

/*

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
*/
