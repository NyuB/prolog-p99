:- ensure_loaded(p022).
:- initialization(tests, main).

tests :-
    range([1], 1, 1),
    range([1,2], 1, 2),
    range([1, 2, 3], 1, 3),
    range([4, 5, 6, 7, 8, 9], 4, 9),
    \+ range(_, 2, 1).
