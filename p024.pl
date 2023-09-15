:- ensure_loaded(p022).
:- ensure_loaded(p023).

rnd_range_select(R, N, Indexes):-
    range(Range, 1, N),
    rnd_select(R, Range, Indexes).
