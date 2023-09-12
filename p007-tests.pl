:- ensure_loaded(p007).
:- initialization(tests, main).

tests :-
    flat([], []),
    flat([], [[], []]),
    flat([], [[[[]]]]),
    flat([a], [a]),
    flat([a, b], [[a], [b]]),
    flat([a, b, c], [[a], [b, c]]),
    flat([a, b, c], [[a], [b, [c]]]).
    