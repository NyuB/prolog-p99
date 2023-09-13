:- ensure_loaded(p015).
:- initialization(tests, main).

tests :-
    dupli([], [], _),
    dupli([A], [A], 1),
    dupli([a,a,a,b,b,b,c,c,c], [a,b,c], 3),
    \+ dupli([_|_], _, 0).
