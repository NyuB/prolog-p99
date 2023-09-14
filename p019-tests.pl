:- ensure_loaded(p019).
:- initialization(tests, main).

tests :-
    rotate_left([], [], 0),
    rotate_left([], [], 1),
    rotate_left([b,a], [a,b], 1),
    rotate_left([b,a], [a,b], 3),
    rotate_left([a,b], [a,b], 0),
    rotate_left([g,h,a,b,c,d,e,f], [a,b,c,d,e,f,g,h], -2).