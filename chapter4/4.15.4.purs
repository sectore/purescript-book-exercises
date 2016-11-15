module Main where

-- Exercise:
-- (Medium) Write reverse in terms of foldl.

import Prelude

import Data.Foldable
import Control.Monad.Eff.Console (logShow)

ex4 :: forall a. Array a -> Array a
ex4 = foldl (\acc x -> [x] <> acc ) []

main = do
  logShow $ ex4 [1, 2, 3]
