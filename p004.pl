len(0, []).
len(N, [_|T]) :-
    N1 is N - 1,
    N1 >= 0,
    len(N1, T).