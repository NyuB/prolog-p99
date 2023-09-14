:- ensure_loaded(p023).
:- initialization(tests, main).

tests :-
    rnd_select([], _, []),
    rnd_select([b,d], [a,b,c,d], [2, 3]).
