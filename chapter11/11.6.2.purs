
-- Exercise:
-- (Medium) The _Collatz_ function is defined on natural numbers `n` as `n / 2` when `n` is even, and `3 * n + 1` when `n` is odd. For example, the iterated Collatz sequence starting at `10` is as follows:
--
-- ```purescript
-- 10, 5, 16, 8, 4, 2, 1, ...
-- ```
--
-- It is conjectured that the iterated Collatz sequence always reaches `1` after some finite number of applications of the Collatz function.
--
-- Write a function which uses recursion to calculate how many iterations of the Collatz function are required before the sequence reaches `1`.
--
-- Modify your function to use the `Writer` monad to log each application of the Collatz function.


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
