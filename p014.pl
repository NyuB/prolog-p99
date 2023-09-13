dupli([], []).
dupli([A | [A | Ta]], [A | T]) :- dupli(Ta, T).
