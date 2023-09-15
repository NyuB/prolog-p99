:- ensure_loaded(p025).
:- initialization(tests, main).

tests :-
    rnd_permutation([a,b,c,d,e,f], [a,b,c,d,e,f], [1,1,1,1,1,1]),
    rnd_permutation([b,a,c,d,e,f], [a,b,c,d,e,f], [2,1,1,1,1,1]).
