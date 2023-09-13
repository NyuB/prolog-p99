:- ensure_loaded(p017).
:- initialization(tests, main).

tests :-
    split([], [], [], 0),
    split([X], [], [X], 1),
    split([], L, L, 0),
    split([a,b,c],  [d,e,f,g,h,i,k], [a,b,c,d,e,f,g,h,i,k], 3).
