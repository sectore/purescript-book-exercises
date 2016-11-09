# Chapter 4: "Recursion, Maps And Folds"

## [4.15.](./4.15.purs)

1. (Easy) Use foldl to test whether an array of boolean values are all true.
2. (Medium) Characterize those arrays xs for which the function foldl (==) false xs returns true.
3. (Medium) Rewrite the following function in tail recursive form using an accumulator parameter:

```purescript
import Prelude
import Data.Array.Unsafe (head, tail)

count :: forall a. (a -> Boolean) -> Array a -> Int
count _ [] = 0
count p xs = if p (unsafePartial head xs)
                then count p (unsafePartial tail xs) + 1
                else count p (unsafePartial tail xs)

```

4. (Medium) Write reverse in terms of foldl.


## [4.17](./4.17.purs)

1. (Easy) Write a function onlyFiles which returns all files (not directories) in all subdirectories of a directory.
2. (Medium) Write a fold to determine the largest and smallest files in the filesystem.
3. (Difficult) Write a function whereIs to search for a file by name. The function should return a value of type Maybe Path, indicating the directory containing the file, if it exists. It should behave as follows:

 ```purescript
 > whereIs "/bin/ls"
 Just (/bin/)
 ```

 ```purescript
 > whereIs "/bin/cat"
 Nothing
 ```

Hint: Try to write this function as an array comprehension using do notation.
