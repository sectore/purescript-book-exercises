# Chapter 11: "Monadic Adventures"

## [11.4.](./11.4.purs))

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
