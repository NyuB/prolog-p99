:- ensure_loaded(p016).
:- initialization(tests, main).
    
tests :-
    drop_every([], [], _),
    drop_every([], _, 1),
    drop_every([a], [a,b], 2),
    drop_every([a,b,d,e,g,h,k], [a,b,c,d,e,f,g,h,i,k], 3),
    \+ drop_every([_|_],_, 0),
    \+ drop_every([_|_],_, -1).
