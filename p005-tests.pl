:- ensure_loaded(p005).
:- initialization(tests, main).

tests :-
    rev([], []),
    rev([E], [E]),
    rev([A, B], [B, A]),
    \+ rev([a, b], [a, b]),
    \+ rev([a, b], [b, c]).
