:- ensure_loaded(p013).
:- initialization(tests, main).
tests :- 
    rle_direct([], []),
    rle_direct([A], [A]),
    rle_direct([[4,a], b, [2,c], [2,a], d, [4,e]], [a,a,a,a,b,c,c,a,a,d,e,e,e,e]),
    \+ rle_direct([[1, a]], [a]),
    \+ rle_direct([b], [a]).
