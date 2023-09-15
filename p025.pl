:- ensure_loaded(p023).

rnd_permutation(P, L, Indexes):-
    length(L, N),
    length(Indexes, N),
    rnd_select(P, L, Indexes).
