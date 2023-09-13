dupli([], [], _).
dupli(D, L, N):- dupli(D, L, N, N).


dupli([A | Ta], [A | T], 1, N):- dupli(Ta, T, N).
dupli([A | Ta], [A | T], Na, N):-
    Na > 1,
    N1 is Na - 1,
    dupli(Ta, [A | T], N1, N).
