module Main where

-- Exercise:
-- (Easy) Use foldl to test whether an array of boolean values are all true.

import Prelude

import Data.Foldable
import Control.Monad.Eff.Console (logShow)

ex1 :: Array Boolean -> Boolean
ex1 = foldl (&&) true

main = do
  logShow $ ex1 [true, true, false]
