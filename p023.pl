:- ensure_loaded(p020).

% Slight variation : use rnd_select(Result, List, Indexes) where length(List, N), Indexes = [I0, I1, ... Ik] and 1 <= Ii <= (N-i)
% Use a random generator for this if you want, I choose determinism and testability.

rnd_select([], _, []).
rnd_select([A|T], L, [I|R]):-
    I > 0,
    length(L, N),
    N >= I,
    remove_at(A, LT, L, I),
    rnd_select(T, LT, R).
