drop_every([], [], _).
drop_every(D, L, N):- drop_every(D, L, N, N).

drop_every([], [], _, _).
drop_every(Ta, [_|T], 1, N):- drop_every(Ta, T, N, N).

drop_every([A|Ta], [A|T], Na, N):-
    Na > 1,
    N1 is Na - 1,
    drop_every(Ta, T, N1, N).
