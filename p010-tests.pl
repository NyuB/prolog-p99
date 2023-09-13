:- ensure_loaded(p010).
:- initialization(tests, main).

tests :-
    rle([], []),
    rle([[1, a]], [a]),
    rle([[4,a],[1,b],[2,c],[2,a],[1,d],[4,e]], [a,a,a,a,b,c,c,a,a,d,e,e,e,e]),
    \+ rle([[1,b]], [a]).
