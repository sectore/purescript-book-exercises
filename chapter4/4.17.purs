module Main where

import Prelude
import Data.Array (filter)

import Data.Path (isDirectory, Path)
import FileOperations (allFiles')

ex1 :: Path -> Array Path
ex1 =
  filter (not isDirectory) <<< allFiles'
