
-- Exercise:
-- (Medium) Rewrite the `sumArray` function above using the `Writer` monad and the `Additive Int` monoid from the `purescript-monoid` package.

import Prelude (Unit, ($))
import Data.Foldable (traverse_)
import Control.Monad.Writer (Writer, tell, runWriter)
import Data.Monoid.Additive (Additive(Additive))
import Data.Tuple (Tuple)

sumArrayW :: Array Int -> Writer (Additive Int) Unit
sumArrayW = traverse_ \n -> tell $ Additive n

runSumArrayW :: Array Int -> Tuple Unit (Additive Int)
runSumArrayW = runWriter <<< sumArrayW
