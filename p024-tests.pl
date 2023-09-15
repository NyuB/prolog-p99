:- ensure_loaded(p024).
:- initialization(tests, main).

tests :-
    rnd_range_select([23,1,17,33,21,37], 49, [23, 1, 16, 30, 19, 32]).
