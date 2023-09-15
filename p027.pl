group([[]], [], [0]).

group(G, L, [N|Tn]):-
    N > 0,
    group(G, L, [N|Tn], []).

group([[A|Ta] | Tg], [A|T], [N | Tn], Skipped):-
    N > 0,
    N1 is N - 1,
    length(T, NT),
    NT >= N1,
    group([Ta | Tg], T, [N1 | Tn], Skipped).

group(G, [A|T], [N | Tn], Skipped):-
    N > 0,
    length(T, NT),
    NT >= N,
    append(Skipped, [A], ASkipped),
    group(G, T, [N | Tn], ASkipped).

group([[]], [], [0], []).

group([[] | Tg], L, [0 | Tn], Skipped):-
    append(Skipped, L, All),
    group(Tg, All, Tn).
