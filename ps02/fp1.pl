rename(V,S,R,Out) :-
	atom(V),
	(V==S
	-> Out = R
	; Out = V
	).

rename(V,_,_,Out) :-
	integer(V),
	Out = V.

rename(Expr,S,R,Out) :-
	Expr =.. [Opr, Left, Right],
	rename(Left,S,R,Out1),
	rename(Right,S,R,Out2),
	concat(Out1,Opr,OutAux),
	concat(OutAux,Out2,Out), !.

