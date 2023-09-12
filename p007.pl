:- ensure_loaded(p005).

flat_acc(Flat, Flat, []).

flat_acc(Acc, Flat, [H|T]) :-
    is_list(H),
    flat(F, H),
    append(Acc, F, NextAcc),
    flat_acc(NextAcc, Flat, T).

flat_acc(Acc, Flat, [H|T]) :-
    \+ is_list(H),
    append(Acc, [H], NextAcc),
    flat_acc(NextAcc, Flat, T).

flat(Flat, L) :- flat_acc([], Flat, L).
