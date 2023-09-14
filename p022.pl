range([N], N, N):- number(N).

range([From|R], From, To) :-
    To > From,
    F1 is From + 1,
    range(R, F1, To).
