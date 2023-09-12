:- ensure_loaded(p003).
:- initialization(tests, main).

tests:-
    nth_element(a, 1, [a]),
    nth_element(a, 1, [a, b]),
    nth_element(b, 2, [a, b]),
    \+ nth_element(_, 0, _),
    \+ nth_element(_, 2, [_]),
    \+ nth_element(_, _, []).