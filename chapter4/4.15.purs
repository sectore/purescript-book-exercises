module Main where

import Prelude

import Data.Foldable
import Control.Monad.Eff.Console (logShow)
import Partial.Unsafe (unsafePartial)
import Data.Array.Partial (head, tail)

ex1 :: Array Boolean -> Boolean
ex1 = foldl (&&) true

ex2 :: Array Boolean -> Boolean
ex2 = foldl (==) false

ex3 :: forall a. (a -> Boolean) -> Array a -> Int
ex3 p = foldr count 0
  where
    count x acc = if p x then acc + 1 else acc

ex4 :: forall a. Array a -> Array a
ex4 = foldl (\acc x -> [x] <> acc ) []

main = do
  logShow $ ex1 [true, true, false]
  logShow $ ex2 [false, true, true]
  logShow $ ex3 ((==) 5) [5, 2, 3, 5, 5, 55, 5]
  logShow $ ex3 ((<) 4) [5, 2, 3, 5, 5, 55, 5]
  logShow $ ex4 [1, 2, 3]
