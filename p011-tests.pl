:- ensure_loaded(p011).
:- initialization(tests, main).
tests :-
    rle_compact([], []),
    rle_compact([a], [a]),
    rle_compact([[4,a], b, [2,c], [2,a], d, [4,e]], [a,a,a,a,b,c,c,a,a,d,e,e,e,e]),
    \+ rle_compact([[1, a]], [a]),
    \+ rle_compact([b], [a]).
