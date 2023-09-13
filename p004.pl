len(N, N, []).
len(Acc, N, [_|T]) :-
    N1 is Acc + 1,
    len(N1, N, T).
len(N, L) :- len(0, N, L).