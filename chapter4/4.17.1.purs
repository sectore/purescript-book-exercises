module Main where

-- Exercise:
-- (Easy) Write a function onlyFiles which returns all files (not directories) in all subdirectories of a directory.

import Prelude
import Data.Array (filter)

import Data.Path (isDirectory, Path)
import FileOperations (allFiles')

ex1 :: Path -> Array Path
ex1 =
  filter (not isDirectory) <<< allFiles'
