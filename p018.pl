slice([A], [A|_], 1, 1).

slice([A|Ta], [_|T], From, To):-
    From > 1,
    F1 is From - 1,
    T1 is To - 1,
    slice([A|Ta], T, F1, T1).

slice([A|Ta], [A|Tb], 1, To):-
    To > 1,
    T1 is To - 1,
    slice(Ta, Tb, 1, T1).
