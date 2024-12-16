digit(1). digit(2). digit(3). digit(4).

unique(P, Q, R, S) :-
    digit(P), digit(Q), digit(R), digit(S),
    \+ P=Q, \+ P=R, \+ P=S,
    \+ Q=R, \+ Q=S,
    \+ R=S.

solutions(
    R11, R12, R13, R14,
	R21, R22, R23, R24,
	R31, R32, R33, R34,
	R41, R42, R43, R44
) :-
    unique(R11, R12, R13, R14),
    unique(R21, R22, R23, R24),
    unique(R31, R32, R33, R34),
    unique(R41, R42, R43, R44),
    
    unique(R11, R21, R31, R41),
    unique(R12, R22, R32, R42),
    unique(R13, R23, R33, R43),
    unique(R14, R24, R34, R44),
    
    unique(R11, R12, R21, R22),
    unique(R13, R14, R23, R24),
    unique(R31, R32, R41, R42),
    unique(R33, R34, R43, R44).
