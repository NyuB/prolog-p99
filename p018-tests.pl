:- ensure_loaded(p004).
:- ensure_loaded(p018).
:- initialization(tests, main).

entire_slice :-
    length(X, N),
    slice(X, X, 1, N).

tests :-
    slice([a], [a], 1, 1),
    slice([a, b], [a, b, c], 1, 2),
    slice([B, C], [_, B, C, _], 2, 3),
    \+ slice([], _, _, _),
    entire_slice.
