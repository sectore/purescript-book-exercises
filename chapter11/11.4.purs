
-- -------------------------------------------------
-- ex. 11.4.1
-- -------------------------------------------------

-- execState :: forall s a. State s a -> s -> s
execState (do
    sumArray [1.0, 2.0, 3.0]
    sumArray [4.0, 5.0]
    sumArray [6.0]) 0.0
-- 21

-- runState :: forall s a. State s a -> s -> Tuple a s
runState (do
    sumArray [1.0, 2.0, 3.0]
    sumArray [4.0, 5.0]
    sumArray [6.0]) 0.0
-- (Tuple unit 21.0)

-- evalState :: forall s a. State s a -> s -> a
evalState (do
    sumArray [1.0, 2.0, 3.0]
    sumArray [4.0, 5.0]
    sumArray [6.0]) 0.0
-- Unit


-- -------------------------------------------------
-- ex. 11.4.2
-- -------------------------------------------------

import Prelude (Unit, (+), ($), (==), negate)
import Data.Foldable (traverse_)
import Data.String (toCharArray)
import Control.Monad.State (State, execState)
import Control.Monad.State.Class (modify)

sumParens :: Array Char -> State Number Unit
sumParens = traverse_ \c -> modify $ (+) $ parseChar c

parseChar :: Char -> Number
parseChar '(' = 1.0
parseChar ')' = negate 1.0
parseChar _ = 0.0

testParens :: String -> Boolean
testParens str = (==) 0.0 $ execState st 0.0
	where st = sumParens $ toCharArray str
