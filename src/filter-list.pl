filter(_, [], []) :- !.

filter(Element, [Element|Tail], Result) :-
    filter(Element, Tail, Result), !.

filter(Element, [Head|Tail], [Head|Result]) :-
    filter(Element, Tail, Result), !.