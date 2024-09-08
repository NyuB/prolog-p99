% Exercism's zebra puzzle

water_drinker(R):-
    solution(S),
    water_drinker(R, S).

zebra_owner(R):-
    solution(S),
    zebra_owner(R, S).


% trivial implementations to find a given resident once the solution is found
water_drinker(R, [H | _]):-
    beverage_house(water, H),
    resident_house(R, H).

water_drinker(R, [_ | T]):-
    water_drinker(R, T).

zebra_owner(R, [H | _]):-
    pet_house(zebra, H),
    resident_house(R, H).

zebra_owner(R, [_ | T]):-
    zebra_owner(R, T).

% generate all solutions verifying the pairing rules, then apply the positional rules
solution([One, Two, Three, Four, Five]):-
    make_solutions([One, Two, Three, Four, Five]),

    % 9 - Milk is drunk in the middle house.
    milk_house(Three),
    % 10 - The Norwegian lives in the first house.
    norwegian_house(One),
    % 6 - The green house is immediately to the right of the ivory house.
    green_right_of_ivory([One, Two, Three, Four, Five]),
    % 11 - The man who smokes Chesterfields lives in the house next to the man with the fox.
    are_next(fox_house, chesterfield_house, [One, Two, Three, Four, Five]),
    % 12 - Kools are smoked in the house next to the house where the horse is kept.
    are_next(kools_house, horse_house, [One, Two, Three, Four, Five]),
    % 15 - The Norwegian lives next to the blue house.
    are_next(norwegian_house, blue_house, [One, Two, Three, Four, Five]).

color(blue).
color(green).
color(ivory).
color(red).
color(yellow).

resident(englishman).
resident(japanese).
resident(norwegian).
resident(spaniard).
resident(ukrainian).

beverage(coffee).
beverage(milk).
beverage(orange).
beverage(tea).
beverage(water).

smoke(chesterfield).
smoke(kool).
smoke(lucky_strike).
smoke(old_gold).
smoke(parliament).

pet(dog).
pet(fox).
pet(horse).
pet(snail).
pet(zebra).


milk_house([_, _, milk, _, _]).
norwegian_house([_, norwegian, _, _, _]).

% 2 - The Englishman lives in the red house.
englishman_in_red([red, englishman, _, _, _]).
englishman_in_red([C, R, _, _, _]):-
    \+ C == red,
    \+ R == englishman.

% 3 - The Spaniard owns the dog.
spaniard_owns_dog([_, spaniard, _, _, dog]).
spaniard_owns_dog([_, S, _, _, P]):-
    \+ S == spaniard,
    \+ P == dog.

% 4 - Coffee is drunk in the green house.
coffee_in_green([green, _, coffee, _, _]).
coffee_in_green([C, _, B, _, _]):-
    \+ C == green,
    \+ B == coffee.

% 5 - The Ukrainian drinks tea.
ukrainian_drinks_tea([_, ukrainian, tea, _, _]).
ukrainian_drinks_tea([_, R, B, _, _]):-
    \+ R == ukrainian,
    \+ B == tea.

% 7 - The Old Gold smoker owns snails.
olg_gold_owns_snails([_, _, _, old_gold, snail]).
olg_gold_owns_snails([_, _, _, S, P]):-
    \+ S == old_gold,
    \+ P == snail.

% 8 - Kools are smoked in the yellow house.
kools_with_yellow([yellow, _, _, kool, _]).
kools_with_yellow([C, _, _, S, _]):-
    \+ C == yellow,
    \+ S == kool.

% 13 - The Lucky Strike smoker drinks orange juice.
lucky_strike_drinks_orange([_, _, orange, lucky_strike, _]).
lucky_strike_drinks_orange([_, _, B, S, _]):-
    \+ B == orange,
    \+ S == lucky_strike.

% 14 - The Japanese smokes Parliaments.
japanese_smokes_parliaments([_, japanese, _, parliament, _]).
japanese_smokes_parliaments([_, R, _, S, _]):-
    \+ R == japanese,
    \+ S == parliament.



green_right_of_ivory([One, Two, _, _, _]):-
    ivory_house(One),
    green_house(Two).
green_right_of_ivory([_, Two, Three, _, _]):-
    ivory_house(Two),
    green_house(Three).
green_right_of_ivory([_, _, Three, Four, _]):-
    ivory_house(Three),
    green_house(Four).
green_right_of_ivory([_, _, _, Four, Five]):-
    ivory_house(Four),
    green_house(Five).

make_solutions(L):-
    findall(C, color(C), Cs),
    findall(R, resident(R), Rs),
    findall(B, beverage(B), Bs),
    findall(S, smoke(S), Ss),
    findall(P, pet(P), Ps),
    make_solutions([], L, Cs, Rs, Bs, Ss, Ps).

make_solutions(Res, Res, [], [], [], [], []).
make_solutions(L, Res, Cs, Rs, Bs, Ss, Ps):-
    % Generate a combination
    pick(C, Cs1, Cs),
    pick(R, Rs1, Rs),
    pick(B, Bs1, Bs),
    pick(S, Ss1, Ss),
    pick(P, Ps1, Ps),
    % Filter invalid combinations according to pairing rules
    apply_rules(
        [
            englishman_in_red,
            coffee_in_green,
            japanese_smokes_parliaments,
            kools_with_yellow,
            lucky_strike_drinks_orange,
            olg_gold_owns_snails,
            spaniard_owns_dog,
            ukrainian_drinks_tea
        ], [C, R, B, S, P]
    ),
    % Recurse to pick another combination
    make_solutions([[C, R, B, S, P] | L], Res, Cs1, Rs1, Bs1, Ss1, Ps1).

% pick(Item, ListWithoutItemn, List) remove Item from List, yielding ListWithoutItem
% used to generate all possible selection from available choices
pick(X, Res, Acc, [X | L]):-
    reverse(RAcc, Acc),
    append(RAcc, L, Res).
pick(X, Res, Acc, [A | L]):-
    pick(X, Res, [A | Acc], L).
pick(X, Res, L):-
    pick(X, Res, [], L).

% apply_rule(Rules, Item) succeeds if each predicate in Rules succeeds on Item
apply_rules([], _).
apply_rules([Rule | Rules], Item):-
    call(Rule, Item),
    apply_rules(Rules, Item).

% are_next(Predicate, Predicate, Houses) verify that two adjacents houses satisfy each predicate, but not both of them
are_next(P1, P2, [One, Two, _, _, _]):-
    (
        (call(P1, One), call(P2, Two), \+ call(P1, Two), \+ call(P2, One));
        (call(P1, Two), call(P2, One), \+ call(P1, One), \+ call(P2, Two))
    ).

are_next(P1, P2, [_, Two, Three, _, _]):-
    (
        (call(P1, Two), call(P2, Three), \+ call(P1, Three), \+ call(P2, Two));
        (call(P1, Three), call(P2, Two), \+ call(P1, Two), \+ call(P2, Three))
    ).

are_next(P1, P2, [_, _, Three, Four, _]):-
    (
        (call(P1, Three), call(P2, Four), \+ call(P1, Four), \+ call(P2, Three));
        (call(P1, Four), call(P2, Three), \+ call(P1, Three), \+ call(P2, Four))
    ).
are_next(P1, P2, [_, _, _, Four, Five]):-
    (
        (call(P1, Four), call(P2, Five), \+ call(P1, Five), \+ call(P2, Four));
        (call(P1, Five), call(P2, Four), \+ call(P1, Four), \+ chesterfield_house(Five))
    ),
    true.

resident_house(R, [_, R, _, _, _]).
pet_house(P, [_, _, _, _, P]).
beverage_house(B, [_, _, B, _, _]).
green_house([green, _, _, _, _]).
ivory_house([ivory, _, _, _, _]).
fox_house([_, _, _, _, fox]).
chesterfield_house([_, _, _, chesterfield, _]).
kools_house([_, _, _, kool, _]).
horse_house([_, _, _, _, horse]).
blue_house([blue, _, _, _, _]).
