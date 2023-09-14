:- ensure_loaded(p017).
rotate_left(L, L, 0).
rotate_left([], [], _).

rotate_left(Rotated, L, R):-
    length(L, N),
    rotate_left(Rotated, L, R, N).

rotate_left(Rotated, L, R, N):-
    R >= N,
    R > 0,
    Rmod is R mod N,
    rotate_left(Rotated, L, Rmod, N).

rotate_left(Rotated, L, R, N):-
    R < 0,
    Rmod is R mod N,
    rotate_left(Rotated, L, Rmod, N).

rotate_left(Rotated, L, R, N) :-
    R < N,
    split(Left, Right, L, R),
    append(Right, Left, Rotated).

