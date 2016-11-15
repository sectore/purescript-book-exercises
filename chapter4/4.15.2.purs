module Main where

-- Exercise:
-- (Medium) Characterize those arrays xs for which the function foldl (==) false xs returns true.

import Prelude

import Data.Foldable
import Control.Monad.Eff.Console (logShow)

ex2 :: Array Boolean -> Boolean
ex2 = foldl (==) false

main = do
  logShow $ ex2 [false, true, true]
