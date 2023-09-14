:- ensure_loaded(p005).
:- initialization(tests, main).

ab_rev_ab :-
    A \= B,
    rev([A, B], [A, B]).

tests :-
    rev([], []),
    rev([a], [a]),
    rev([a, b], [b, a]),
    \+ rev([a, b], [a, b]),
    \+ rev([a, b], [b, c]),
    \+ ab_rev_ab.
