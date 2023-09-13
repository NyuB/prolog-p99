:- ensure_loaded(p010).

rle_compact(Acc, Compact, []) :-
    rev(Acc, Compact).

rle_compact(Acc, Compact, [[N, E] | T]) :-
    N > 1,
    rle_compact([[N, E] | Acc], Compact, T).

rle_compact(Acc, Compact, [[1, E] | T]) :-
    rle_compact([E|Acc], Compact, T).

rle_compact(Compact, L) :-
    rle(RLE, L),
    rle_compact([], Compact, RLE).
