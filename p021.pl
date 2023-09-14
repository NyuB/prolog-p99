insert_at([E|T], T, E, 1).

insert_at([H|I], [H|T], E, N) :-
    N > 1,
    N1 is N - 1,
    insert_at(I, T, E, N1).
