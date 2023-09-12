nth_element(E, 1, [E|_]).
nth_element(E, N, [_|T]) :-
    N1 is N - 1,
    N1 > 0,
    nth_element(E, N1, T).