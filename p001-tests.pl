:- ensure_loaded(p001).
:- initialization(tests, main).

tests :-
    last(a, [a]), % Last element of a one element list is the single element
    last(b, [a, b]),
    \+ last(_, []). % Cannot find the last element of an empty list ( '\+' is the negation operator)