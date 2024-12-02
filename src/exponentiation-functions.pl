/* This program defines two variants of functions for calculating powers:
 * `pow` and `tr_pow`. Both implement exponentiation for integers, 
 * allowing positive, negative, and zero exponents.
 *
 * - It assumes that 0^0 equals 1, following Python's convention.
 * - The `pow` function uses standard recursion, while `tr_pow` employs 
 *   tail recursion, optimized to avoid stack overflow during calculations 
 *   with large exponents.
 *
 * For negative exponents, the base is inverted (1 / Base), and the 
 * corresponding positive exponent is used to perform the calculation. 
 * The function correctly handles the exception that the base cannot 
 * be zero when the exponent is negative.
 */

/* Standard Recursion */

pow(Base, Exponent, Result) :-
	Exponent >= 0,
    pow_impl(Base, Exponent, Result).

pow(Base, Exponent, Result) :-
	(Exponent < 0, Base \= 0),
    NewBase is 1 / Base,
    NewExponent is -1 * Exponent,
    pow_impl(NewBase, NewExponent, Result).

pow_impl(_, 0, 1).

pow_impl(Base, Exponent, Result) :-
    Exponent > 0,
    NewExponent is Exponent - 1,
    pow(Base, NewExponent, NewResult),
    Result is Base * NewResult.

/* Tail Recursion */

tr_pow(Base, Exponent, Result) :-
    Exponent >= 0,
    tr_pow_impl(Base, Exponent, 1, Result).

tr_pow(Base, Exponent, Result) :-
    (Exponent < 0, Base \= 0),
    NewBase is 1 / Base,
    NewExponent is -1 * Exponent,
    tr_pow_impl(NewBase, NewExponent, 1, Result).

tr_pow_impl(_, 0, Accumulator, Accumulator).

tr_pow_impl(Base, Exponent, Accumulator, Result) :-
    Exponent > 0,
    NewExponent is Exponent - 1,
    NewAccumulator is Base * Accumulator,
    tr_pow_impl(Base, NewExponent, NewAccumulator, Result).

/* Interaction with the user to get the base and exponent */

main :-
    write('Enter the base: '),
    read(Base),
    write('Enter the exponent: '),
    read(Exponent),
    
    pow(Base, Exponent, Result_pow),
    write('Result of pow: '), write(Result_pow), nl,
    
    tr_pow(Base, Exponent, Result_tr_pow),
    write('Result of tr_pow: '), write(Result_tr_pow), nl.