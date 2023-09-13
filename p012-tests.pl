:- ensure_loaded(p012).
:- initialization(tests, main).

tests :-
    rle_dec([a,a,a,a,b,c,c,a,a,d,e,e,e,e], [[4,a], b, [2,c], [2,a], d, [4,e]]),
    rle_dec([A, A], [[2, A]]),
    \+ rle_dec([b], [a]),
    \+ rle_dec([_], [2, _]).

