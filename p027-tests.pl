:- ensure_loaded(p027).
:- initialization(tests, main).

all_group_combinations(Groupings, L, Sizes):-
    findall(G, group(G, L, Sizes), Groupings).

tests :-
    all_group_combinations([[[]]], [], [0]),
    all_group_combinations([[[a]]], [a], [1]),
    all_group_combinations([[[a], [b]], [[b], [a]]], [a,b], [1,1]),
    % problem example
    group([[a,b], [c,d], [e,f,g,h,i]], [a,b,c,d,e,f,g,h,i], [2,2,5]),
    % no permutation inside a group
    \+ group([[b,a], [c,d], [e,f,g,h,i]], [a,b,c,d,e,f,g,h,i], [2,2,5]),
    % but group permutations are valid
    group([[c,d], [a,b], [e,f,g,h,i]], [a,b,c,d,e,f,g,h,i], [2,2,5]).
