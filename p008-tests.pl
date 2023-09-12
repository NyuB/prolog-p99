:- ensure_loaded(p008).
:- initialization(tests, main).

tests :-
    compress([], []),
    compress([A], [A]),
    compress([A], [A, A]),
    (compress([A], [A, B]), A = B),
    compress([a, b, a, c], [a, a, b, a, c, c, c]).
