:- ensure_loaded(p004).
:- ensure_loaded(p005).
:- ensure_loaded(p009).

rle_map([], []).
rle_map([[N, E] | Ns], [[E|TE]|T]):- len(N, [E|TE]), rle_map(Ns, T).

rle(RLE, L):-
    pack(Packed, L),
    rle_map(RLE, Packed).
