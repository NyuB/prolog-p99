% map(Result, Function, List) binds Result to the application of Function to List
% Function(B, A) should bind B to f(A) where
% f is a function from domain A to codomain B
% List : [A] 
% Result : [B] 
% Function : A -> B 
mapf([], _, []).
mapf([B | Tb], F, [A | Ta]) :-
    call(F, B, A),
    mapf(Tb, F, Ta).

% sorted_by(Result, List, Cmp) binds Result to a List sorted according to the ordering Cmp
% Cmp(lt, A, B). should be true if A < B
% Cmp(ge, A, B). should be true if A >= B
sorted_by([], [], _).
sorted_by(Sorted, L, Cmp):- sorted_acc([], Sorted, L, Cmp).

sorted_acc(Sorted, Sorted, [], _).

sorted_acc([], Sorted, [H|T], Cmp):- sorted_acc([H], Sorted, T, Cmp).

sorted_acc([A | Ta], Sorted, [H | T], Cmp):-
    call(Cmp, lt, H, A),
    sorted_acc([H | [A | Ta]], Sorted, T, Cmp).

sorted_acc([A | Ta], Sorted, [H | T], Cmp):-
    call(Cmp, ge, H, A),
    sorted_acc_insert([A], Ta, H, Sorted, T, Cmp).

sorted_acc_insert(Skipped, [A|Ta], H, Sorted, T, Cmp):-
    call(Cmp, lt, H, A),
    append(Skipped, [H | [A | Ta]], Acc),
    sorted_acc(Acc, Sorted, T, Cmp).

sorted_acc_insert(Skipped, [], H, Sorted, T, Cmp):-
    append(Skipped, [H], Acc),
    sorted_acc(Acc, Sorted, T, Cmp).

sorted_acc_insert(Skipped, [A|Ta], H, Sorted, T, Cmp):-
    call(Cmp, ge, H, A),
    append(Skipped, [A], ASkipped),
    sorted_acc_insert(ASkipped, Ta, H, Sorted, T, Cmp).

int_cmp(lt, A, B):- A < B.
int_cmp(ge, A, B):- A >= B.
