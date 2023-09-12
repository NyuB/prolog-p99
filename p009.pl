:- ensure_loaded(p005).

pack_acc(Acc, Packed, []) :- rev(Acc, Packed).

pack_acc([], Packed, [H|T]) :-
    pack_acc([[H]], Packed, T).

pack_acc([[A | TA] | Tacc], Packed, [A|T]) :-
    pack_acc([[A | [A | TA]] | Tacc], Packed, T).

pack_acc([[A | TA] | Tacc], Packed, [B|T]) :-
    A \= B,
    pack_acc([[B] | [[A | TA] | Tacc]], Packed, T).

pack(Packed, L) :- pack_acc([], Packed, L).
