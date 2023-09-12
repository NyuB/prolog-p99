:- ensure_loaded(p002).
:- initialization(tests, main).

tests :-
    penultimate(a, [a, b]),
    penultimate(b, [a, b, c]),
    \+ penultimate(_, [a]), % Cannot find the last but one element of a one element list
    \+ penultimate(_, []). % Cannot find the last but one element of an empty list