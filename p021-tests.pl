:- ensure_loaded(p021).
:- initialization(tests, main).

insert_beyond(L):-
    length(L, N),
    N2 is N + 2,
    insert_at(_, L, _, N2).

tests :-
    insert_at([a], [], a, 1),
    insert_at([a, b], [a], b, 2),
    insert_at([b, a], [a], b, 1),
    insert_at([a, b, c], [a,c], b, 2),
    \+ insert_at([], _, _, _),
    \+ insert_at(_, _, _, 0),
    \+ insert_beyond([]),
    \+ insert_beyond([a]),
    \+ insert_beyond([a, b]).
