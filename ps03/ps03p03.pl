/*
Heng Low Wee
U096901R

Problem Set 3 Problem 3
*/

/*
tile(0, In, Out) :-
	atom_concat(Out, '1', Out1),
	atom_concat(Out, '2', Out2),
	atom_concat(Out, '3', Out3),
	atom_concat(Out, '4', Out4),
	atom_concat(Out, '5', Out5),
	atom_concat(Out, '6', Out6),
	atom_concat(Out, '7', Out7),
	atom_concat(Out, '8', Out8),
	scale(In, 100, 100, Out1),
	r(Out1, Out2),
	r(Out2, Out3),
	r(Out3, Out4),
	b(Out4, Out3, Out5),
	r(Out5, Out6),
	b(Out1, Out2, Out7),
	r(Out7, Out8),
	b(Out6, Out8, Out),
	!.
*/

tile(0, In, Out) :-
	scale(In, 100, 100, Out),
	!.
	
tile(N, In, Out) :-
	N > 0,
	W is 100 * 0.5^N,
	atom_concat(Out, '1', Out1),
	atom_concat(Out, '2', Out2),
	atom_concat(Out, '3', Out3),
	scale(In, W, W, Out1),
	scale(In, W, W, Out2),
	su(Out1, Out2, Out3),
	N1 is N-1,
	tile(N1, Out3, Out),
	!.
	
su(In, Add, Out) :-
	atom_concat(Out, 's1', Out1),
	atom_concat(Out, 's2', Out2),
	atom_concat(Out, 's3', Out3),
	r(In, Out1),
	r(Out1, Out2),
	r(Out2, Out3),
	atom_concat(Out, 's4', Out4),
	atom_concat(Out, 's5', Out5),
	atom_concat(Out, 's6', Out6),
	atom_concat(Out, 's7', Out7),
	atom_concat(Out, 's8', Out8),
	r(Add, Out4),
	r(Out4, Out5),
	r(Out5, Out6),
	b(Out3, Out5, Out7),
	b(Add, Out4, Out8),
	atom_concat(Out, 's9', Out9),
	atom_concat(Out, 's10', Out10),
	r(Out7, Out9),
	r(Out8, Out10),
	b(Out9, Out10, Out),
	!.

ma(Expr) :-
	Expr =.. [;, Left, Right],
	Left =.. [=, X, Cmd],
	montage(Cmd, X),
	ma(Right),
	!.
	
ma(Expr) :-
	Expr =.. [=, X, Cmd],
	montage(Cmd, X),
	!.

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
	write('convert +append '),
	write(Arg1), write('.jpg '),
	write(Arg2), write('.jpg '),
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
