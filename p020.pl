remove_at(E, R, [E|R], 1).

remove_at(E, [H|R], [H|T], N) :-
    N > 1,
    N1 is N - 1,
    remove_at(E, R, T, N1).
