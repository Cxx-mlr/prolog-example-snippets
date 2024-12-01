/* This program defines two variants of functions to calculate the Fibonacci sequence:
 * `fibonacci` and `tr_fibonacci`. Both calculate the n-th Fibonacci number using 
 * recursion, but with different methods.
 *
 * - The `fibonacci` function uses standard recursion.
 * - The `tr_fibonacci` function uses tail recursion, optimized to avoid stack 
 *   overflow when calculating Fibonacci numbers for large indices.
 * /

/* Standard Recursion */

fibonacci(0, 0).
fibonacci(1, 1).

fibonacci(Index, Result) :-
    PrevIndex is Index - 1,
    PrevPrevIndex is Index - 2,
    fibonacci(PrevIndex, A),
    fibonacci(PrevPrevIndex, B),
    Result is A + B.

/* Tail Recursion */

tr_fibonacci(Index, Result) :-
    tr_fibonacci_impl(Index, 0, 1, Result).

tr_fibonacci_impl(0, A, _, A).
tr_fibonacci_impl(1, _, B, B).

tr_fibonacci_impl(Index, A, B, Result) :-
    NewA is B,
    NewB is A + B,
    NewIndex is Index - 1,
    tr_fibonacci_impl(NewIndex, NewA, NewB, Result).