
-- -------------------------------------------------
-- ex. 11.6.1
-- -------------------------------------------------

import Prelude (Unit, ($))
import Data.Foldable (traverse_)
import Control.Monad.Writer (Writer, tell, runWriter)
import Data.Monoid.Additive (Additive(Additive))
import Data.Tuple (Tuple)

sumArrayW :: Array Int -> Writer (Additive Int) Unit
sumArrayW = traverse_ \n -> tell $ Additive n

runSumArrayW :: Array Int -> Tuple Unit (Additive Int)
runSumArrayW = runWriter <<< sumArrayW


-- -------------------------------------------------
-- ex. 11.6.2
-- -------------------------------------------------

import Prelude ((<<<), ($), (*), (+), (/), (<>), otherwise, bind,
  pure, show)
import Control.Monad.Writer (Writer, tell, runWriter)
import Data.Tuple (Tuple)
import Data.Int (odd)
import Data.Array (cons)

collatz :: Int -> Array Int
collatz 1 = [1]
collatz n | odd n     = cons n $ collatz (3 * n + 1)
          | otherwise = cons n $ collatz (n / 2)

collatzW :: Int -> Writer (Array String) (Array Int)
collatzW n = do
  tell ["collatz of " <> show n]
  pure $ collatz n

runCollatzW :: Int -> Tuple (Array Int) (Array String)
runCollatzW = runWriter <<< collatzW
