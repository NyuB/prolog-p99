:- ensure_loaded(p020).
:- initialization(tests, main).

tests :-
    remove_at(a, [], [a], 1),
    remove_at(a, [a], [a, a], 1),
    remove_at(a, [a], [a, a], 2),
    remove_at(b, [a,c,d], [a,b,c,d], 2),
    \+ remove_at(_, _, [], _),
    \+ remove_at(_, _, _, 0).