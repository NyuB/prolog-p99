:- ensure_loaded(p026).
:- initialization(tests, main).

all_combinations(All, N, L) :-
    findall(X, combination(X, N, L), All).

tests :-
    all_combinations([[]], 0, _),
    all_combinations([[]], _, []), 
    all_combinations([], -1, _), 
    all_combinations([[X]], 1, [X]),
    all_combinations([[a,b,c], [a,b,d], [a,c,d], [b,c,d]], 3, [a,b,c,d]),
    % sorted according to original list order
    \+ all_combinations([[a,b,c], [a,c,d], [a,b,d], [b,c,d]], 3, [a,b,c,d]),
    all_combinations([[a,c,b], [a,c,d], [a,b,d], [c,b,d]], 3, [a,c,b,d]).
