:- ensure_loaded(p004).
:- ensure_loaded(p005).
:- ensure_loaded(p009).

rle_item([N, E], [E|T]) :-
    len(N, [E|T]).

rle_acc(Acc, RLE, []) :-
    rev(Acc, RLE).

rle_acc(Acc, RLE, [H|T]) :-
    rle_item(RH, H),
    rle_acc([RH|Acc], RLE, T).

rle(RLE, L):-
    pack(Packed, L),
    rle_acc([], RLE, Packed).
