:- ensure_loaded(p006).
:- initialization(tests, main).

tests :-
    palindrom([]),
    palindrom([_]),
    palindrom([X, X]),
    palindrom([A, _, A]),
    palindrom([n, o, o, n]),
    palindrom([k, a, y, a, k]),
    \+ palindrom([t, o, p]).

