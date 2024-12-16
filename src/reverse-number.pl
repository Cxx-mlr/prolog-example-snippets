length_number(0, 1) :- !.

length_number(Number, Result) :-
    Result is floor(log10(abs(Number))) + 1.

reverse_number(Number, Result) :-
    Number >= 0,
    length_number(Number, Length),
    reverse_number_impl(Number, Length, Result), !.

reverse_number(Number, Result) :-
    Number < 0,
    length_number(-1 * Number, Length),
    reverse_number_impl(-1 * Number, Length, SubResult),
    Result is -1 * SubResult, !.

reverse_number_impl(Number, _, Number) :-
    Number < 10, !.

reverse_number_impl(Number, Length, Result) :-
    LastDigit is Number mod 10,
    NewNumber is Number div 10,
    NewLength is Length - 1,
    reverse_number_impl(NewNumber, NewLength, SubResult),
    Result is LastDigit * 10**(NewLength) + SubResult.
 
tr_reverse_number(Number, Result) :-
    Number >= 0,
    tr_reverse_number_impl(Number, 0, Result), !.

tr_reverse_number(Number, Result) :-
    Number < 0,
    tr_reverse_number_impl(-1 * Number, 0, SubResult),
    Result is -1 * SubResult, !.

tr_reverse_number_impl(Number, Accumulator, Result) :-
    Number < 10,
    Result is Accumulator + Number, !.

tr_reverse_number_impl(Number, Accumulator, Result) :-
    LastDigit is Number mod 10,
    NewNumber is Number div 10,
    length_number(NewNumber, NewNumberLength),
    NewAccumulator is LastDigit * 10**NewNumberLength + Accumulator,
    tr_reverse_number_impl(NewNumber, NewAccumulator, Result).