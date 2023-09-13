:- ensure_loaded(p011).

rle_dec([], []).

rle_dec([A|Ta], [[N, A] | T]):-
    N > 1,
    N1 is N - 1,
    rle_dec(Ta, [[N1, A] | T]).

rle_dec([A | Ta], [[1, A] | T]):-
    rle_dec(Ta, T).
    
rle_dec([A|Ta], [A | T]):-
    rle_dec(Ta, T).
