:- ensure_loaded(p005).

compress_acc(Acc, Compressed, []) :- rev(Acc, Compressed).

compress_acc([A|TAcc], Compressed, [A|T]) :-
    compress_acc([A|TAcc], Compressed, T).

compress_acc([A|TAcc], Compressed, [B|T]) :-
    A \= B,
    compress_acc([B|[A|TAcc]], Compressed, T).

compress_acc([], Compressed, [A|T]) :-
    compress_acc([A], Compressed, T).

compress(Compressed, L) :- compress_acc([], Compressed, L).
