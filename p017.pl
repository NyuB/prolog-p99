split([], [], [], 0).

split([A|Ta], LB, [A|T], N):-
    N > 0,
    N1 is N-1,
    split(Ta, LB, T, N1).

split([], LB, LB, 0).
