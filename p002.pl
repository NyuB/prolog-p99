penultimate(E, [E|[_]]).
penultimate(E, [_|T]):- penultimate(E, T).