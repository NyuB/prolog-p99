:- ensure_loaded(p005).

pack([], []).
pack([[A|As] | TP], [A|T]):- packed(A, [As | TP], T).

packed(_, [[]], []).
packed(A, [[A|As] | TP], [A|T]):- packed(A, [As | TP], T).
packed(A, [[] | TP], [B|T]) :-
    B \= A,
    packed(B, TP, [B|T]).
