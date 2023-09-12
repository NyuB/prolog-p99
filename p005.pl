rev_acc(Rev, Rev, []).
rev_acc(Acc, Rev, [H|T]) :-
    rev_acc([H|Acc], Rev, T).
rev(Rev, L):- rev_acc([], Rev, L).