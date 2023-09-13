rle_direct([], []).

rle_direct([A|Ta], [A|T]) :-
    rle_direct(A, [[0, A] | Ta], T).

rle_direct([[N, A] | Ta], [A|T]):-
    N > 1,
    N1 is N - 1,
    rle_direct(A, [[N1, A] | Ta], T).

rle_direct(_, [], []).

rle_direct(A, [[0, A]], []).

rle_direct(A, [[0, A] | Ta], [B | T]) :-
    A \= B,
    rle_direct(Ta, [B | T]).

rle_direct(A, [[N, A] | Ta], [A | T]) :-
    N > 0,
    N1 is N - 1,
    rle_direct(A, [[N1, A] | Ta], T).
