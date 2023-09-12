:- ensure_loaded(p004).
:- initialization(tests, main).

tests :-
    len(0, []),
    len(1, [_]),
    len(2, [_, _]),
    len(3, [_, _, _]).
