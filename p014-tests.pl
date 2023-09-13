:- ensure_loaded(p014).
:- initialization(tests, main).

tests :-
    dupli([], []),
    dupli([a,a], [a]),
    dupli([a,a,b,b,c,c,c,c,d,d], [a, b, c, c, d]),
    dupli([X, X], [X]),
    \+ dupli([X, X, X], _),
    \+ dupli([], [_|_]).
