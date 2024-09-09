% p096
identifier(S):-
    string_codes(S, L),
    identifier_l(L).

identifier_l([H | T]):-
    letter(H),
    dash_alphanum(T).

dash_alphanum([]).
dash_alphanum([H | T]):-
    alphanum(H),
    dash_alphanum(T).
dash_alphanum([Code | [H | T]]):-
    dash(Code),
    alphanum(H),
    dash_alphanum(T).

dash(Code):- string_codes("-", [Code]).
letter(Code):- code_type(Code, alpha).
alphanum(Code):- code_type(Code, alnum).
