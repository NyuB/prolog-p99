:- ensure_loaded(fun).
:- initialization(tests, main).

test_len(N, L) :- length(L, N).

tests_mapf :-
    mapf([2,1,3], test_len, [[a,a], [b], [c,c,c]]).

len_cmp(Order, A, B):-
    length(A, LA),
    length(B, LB),
    int_cmp(Order, LA, LB).

tests_sorted :-
    sorted_by([], [], int_cmp),
    sorted_by([1], [1], int_cmp),
    sorted_by([1,2], [1,2], int_cmp),
    sorted_by([1,2,3], [3,2,1], int_cmp),
    sorted_by([[1], [2,2], [3,3,3]], [[3,3,3], [1], [2,2]], len_cmp).

tests :-
    tests_mapf,
    tests_sorted.