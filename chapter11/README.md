# Chapter 11: "Monadic Adventures"

## [11.4.](./11.4.purs)

1. (Easy) What is the result of replacing execState with runState or evalState in our example above?

2. (Medium) A string of parentheses is _balanced_ if it is obtained by either concatenating zero-or-more shorter balanced strings, or by wrapping a shorter balanced string in a pair of parentheses.

Use the `State` monad and the `traverse_` function to write a function

```purescript
testParens :: String -> Boolean
```

which tests whether or not a `String` of parentheses is balanced, by keeping track of the number of opening parentheses which have not been closed. Your function should work as follows:

```purescript
> testParens ""
 true

 > testParens "(()(())())"
 true

 > testParens ")"
 false

 > testParens "(()()"
 false
```

_Hint:_ you may like to use the `toCharArray` function from the `Data.String` module to turn the input string into an array of characters.

## [11.6.](./11.6.purs)


1. (Medium) Rewrite the `sumArray` function above using the `Writer` monad and the `Additive Int` monoid from the `purescript-monoid` package.

2. (Medium) The _Collatz_ function is defined on natural numbers `n` as `n / 2` when `n` is even, and `3 * n + 1` when `n` is odd. For example, the iterated Collatz sequence starting at `10` is as follows:

```purescript
10, 5, 16, 8, 4, 2, 1, ...
```

It is conjectured that the iterated Collatz sequence always reaches `1` after some finite number of applications of the Collatz function.

Write a function which uses recursion to calculate how many iterations of the Collatz function are required before the sequence reaches `1`.

Modify your function to use the `Writer` monad to log each application of the Collatz function.
