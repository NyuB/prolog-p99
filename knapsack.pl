% Exercism's knapsack problem

maximum_value([], _, 0).
maximum_value(ItemsAsserts, Capacity, MaxValue):-
    with_asserts(ItemsAsserts, maximum_value(Capacity, MaxValue)).

maximum_value(Capacity, MaxValue):-
    all_items(Items),
    all_items_under_capacity(Items, Capacity),
    problem(Items, Capacity, Problem),
    solution(Problem, 0, Start),
    priority(Start, P),
    singleton_heap(Q, P, Start),
    solve(Q, MaxValue).

% Ensure Asserts are registered then retracted whatever Goal's result is
% Succeeds if Goal succeeds, fails otherwise
with_asserts(Asserts, Goal):-
    assert_all(Asserts),
    ((call(Goal), retract_all(Asserts)); (retract_all(Asserts)), false).

% Exercism tests requires an overweight singular item to be considered a failure and not just to be ignored
all_items_under_capacity([], _).
all_items_under_capacity([[W, _] | Rest], Capacity):-
    W =< Capacity,
    all_items_under_capacity(Rest, Capacity).

% solve(Q, MaxValue) MaxValue is the best possible solution score among those in Q or reachable from those in Q
solve(Q, MaxValue):-
    solve(Q, 0, MaxValue).

solve(Q, MaxValue, MaxValue):-
    % If Q is empty, the best solution is the current best one
    empty_heap(Q).
solve(Q, BestSoFar, MaxValue):-
    % Pick the most optimistic solution from Q, then decide to continue or stop
    get_from_heap(Q, _, Solution, Q1),
    heuristic(Solution, BestYouCanHope),
    solved_or_continue(Q1, BestSoFar, Solution, BestYouCanHope, MaxValue).

solved_or_continue(_, BestSoFar, _, BestYouCanHope, BestSoFar):-
    % If the most optimistic solution cannot surpass BestSoFar, BestSofar is the maximum solution
    BestYouCanHope =< BestSoFar.
solved_or_continue(Q, BestSoFar, Solution, BestYouCanHope, MaxValue):-
    % If their is still hope to surpass BestSoFar, generate all possible next solutions, add them to the Q and continue
    BestYouCanHope > BestSoFar,
    [_, Score] = Solution,
    max_list([BestSoFar, Score], NextBest),
    findall(NextSolution, next(Solution, NextBest, NextSolution), NextSolutions),
    add_all_to_heap(NextSolutions, Q, NextQ),
    solve(NextQ, NextBest, MaxValue).

% next(Solution, CurrentBest, Next) pick one item from the available ones in Solution and
% generate the Next corresponding solution, only if it could allow to surpass CurrentBest
next([Problem, Score], CurrentBest, Next):-
    problem_pick(Problem, [_, V], NextProblem),
    NextScore is Score + V,
    heuristic([NextProblem, NextScore], H),
    H > CurrentBest,
    Next = [NextProblem, NextScore].

% A solution candidate, associating the current Problem (available items) and a current Score (already picked items value)
solution(Problem, Score, [Problem, Score]).

% Prioritize solutions with high scoring potential <=> give them low priority value
priority(Solution, P):-
    heuristic(Solution, H),
    P is -1 * H.

% Best possible value reachable from a given solution
heuristic([Problem, Score], H):-
    [_, _, MaxPossible] = Problem,
    H is Score + MaxPossible.

% Pick one item from those available in a problem, discard items before it
problem_pick([[Picked | Rest], MaxCapacity, _], Picked, NextProblem):-
    [W, _] = Picked,
    NextCapacity is MaxCapacity - W,
    problem(Rest, NextCapacity, NextProblem).
problem_pick([[_ | Rest], MaxCapacity, MaxPossible], Picked, NextProblem):-
    problem_pick([Rest, MaxCapacity, MaxPossible], Picked, NextProblem).

% problem(Items, MaxCapacity, Problem), where Problem is [Available, MaxCapacity, MaxPossible]
% Available is the items of Items under MaxCapacity and MaxPossible is the sum of those items values
problem(Available, MaxCapacity, [PA, MaxCapacity, MaxPossible]):-
    filter_capacity(Available, MaxCapacity, PA),
    sum_values(PA, MaxPossible).

%  sum_values(Items, Sum), sum of items' values
sum_values(L, Res):-
    sum_values(L, 0, Res).
sum_values([], Res, Res).
sum_values([[_, V] | T], Acc, Res):-
    Acc1 is Acc + V,
    sum_values(T, Acc1, Res).

% filter_capacity(Items, MaxCapacity, FilteredItems) keeps only items in Items with weight less than or equal to MaxCapacity
filter_capacity(L, MaxCapacity, Res):-
    filter_capacity(L, MaxCapacity, [], Res).
filter_capacity([], _, Acc, Res):-
    reverse(Acc, Res).
filter_capacity([[W, V] | Rest], MaxCapacity, Acc, Res):-
    W =< MaxCapacity,
    filter_capacity(Rest, MaxCapacity, [[W, V] | Acc], Res).
filter_capacity([[W, _] | Rest], MaxCapacity, Acc, Res):-
    W > MaxCapacity,
    filter_capacity(Rest, MaxCapacity, Acc, Res).

add_all_to_heap([], Res, Res).
add_all_to_heap([Solution | T], Q, Res):-
    priority(Solution, P),
    add_to_heap(Q, P, Solution, NextQ),
    add_all_to_heap(T, NextQ, Res).

all_items(L):-
    findall([W, V], item(W, V), L).

assert_all([]).
assert_all([Fact | Rest]):-
    assert(Fact),
    assert_all(Rest).

retract_all([]).
retract_all([Fact | Rest]):-
    retract(Fact),
    retract_all(Rest).
