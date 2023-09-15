:- ensure_loaded(p028).
:- initialization(tests, main).

lsort_tests :-
    lsort([], []),
    lsort([L], [L]),
    lsort([[a], [b,c]], [[a], [b,c]]),
    lsort([[a], [b,c]], [[b,c], [a]]),
    lsort(
        [[o], [d, e], [d, e], [m, n], [a, b, c], [f, g, h], [i, j, k, l]], 
        [[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]]
    ).

lfsort_tests :-
    freq(1, 1, [[a]]),
    lfsort([], []),
    lfsort([[]], [[]]),
    lfsort([[a,a,a], [a,a], [b,b]], [[a,a], [a,a,a], [b,b]]).

tests :-
    lsort_tests,
    lfsort_tests.