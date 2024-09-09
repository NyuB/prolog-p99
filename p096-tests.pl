:- ensure_loaded(p096).
:- initialization(tests, main).
tests :-
    identifier("S"),
    \+ identifier("9"),
    \+ identifier("-"),
    \+ identifier("A:"),
    identifier("A9"),
    identifier("A-9"),
    \+ identifier("A--9"),
    \+ identifier("A-"),
    \+ identifier("-A"),
    identifier("A-9-B-8"),
    true.
