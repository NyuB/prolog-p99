:- ensure_loaded(fun).

len_cmp(Order, A, B):-
    length(A, LA),
    length(B, LB),
    int_cmp(Order, LA, LB).

lsort(Sorted, L):-
    sorted_by(Sorted, L, len_cmp).

assoc_len([N, L], L):- len(N, L).

map_freq([], [], _).
map_freq([[AF, A] | Tf], [[AL, A] | Tl], Ref):-
    freq(AF, AL, Ref),
    map_freq(Tf, Tl, Ref).

left_cmp(Order, [A, _], [B, _]):- int_cmp(Order, A, B).

remove_left(A, [_, A]).

freq(F, N, L):- freq_acc(0, F, N, L).

freq_acc(F, F, _, []).

freq_acc(Acc, F, L, [H|T]):-
    length(H, L),
    A1 is Acc + 1,
    freq_acc(A1, F, L, T).

freq_acc(Acc, F, L, [H | T]):-
    length(H, L1),
    L \= L1,
    freq_acc(Acc, F, L, T).

lfsort(Sorted, L):-
    mapf(Len, assoc_len, L),
    map_freq(Freq, Len, L),
    sorted_by(FreqSorted, Freq, left_cmp),
    mapf(Sorted, remove_left, FreqSorted).
