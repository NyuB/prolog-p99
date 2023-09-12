:- ensure_loaded(p009).
:- initialization(tests, main).

tests :-
    pack([], []),
    pack([[A]], [A]),
    pack([[a, a], [b], [a], [c, c, c]], [a, a, b, a, c, c, c]),
    \+ pack([[a], [a], [b]], [a,a,b]).
