module Main where

-- Exercise:
-- (Medium) Rewrite the following function in tail recursive form using an accumulator parameter:
--
-- ```purescript
-- import Prelude
-- import Data.Array.Unsafe (head, tail)
--
-- count :: forall a. (a -> Boolean) -> Array a -> Int
-- count _ [] = 0
-- count p xs = if p (unsafePartial head xs)
--                 then count p (unsafePartial tail xs) + 1
--                 else count p (unsafePartial tail xs)
--
-- ```

import Prelude

import Data.Foldable
import Control.Monad.Eff.Console (logShow)

ex3 :: forall a. (a -> Boolean) -> Array a -> Int
ex3 p = foldr count 0
  where
    count x acc = if p x then acc + 1 else acc

main = do
  logShow $ ex3 ((==) 5) [5, 2, 3, 5, 5, 55, 5]
  logShow $ ex3 ((<) 4) [5, 2, 3, 5, 5, 55, 5]
