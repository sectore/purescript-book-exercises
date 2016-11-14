
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

import Prelude (Unit, (<<<), ($), (*), (+), (/), otherwise)
import Control.Monad.Writer (Writer, tell, runWriter)
import Data.Tuple (Tuple)
import Data.Int (odd)
import Data.Array (cons)

collatz :: Int -> Array Int
collatz 1 = [1]
collatz n	| odd n 		= cons n $ collatz (3 * n + 1)
					| otherwise	= cons n $ collatz (n / 2)

collatzW :: Int -> Writer (Array Int) Unit
collatzW 1 = tell [1]
collatzW n	| odd n 		= tell $ cons n $ collatz (3 * n + 1)
						| otherwise	= tell $ cons n $ collatz (n / 2)

runCollatzW :: Int -> Tuple Unit (Array Int)
runCollatzW = runWriter <<< collatzW
