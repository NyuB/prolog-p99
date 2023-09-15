combination([], 0, _).

combination([A|Ta], N, [A|T]):-
    N > 0,
    N1 is N-1,
    length(T, NT),
    NT >= N1,
    combination(Ta, N1, T).

combination(C, N, [_|T]):-
    N > 0,
    length(T, NT),
    NT >= N,
    combination(C, N, T).
