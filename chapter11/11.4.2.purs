-- Exercise:
-- (Medium) A string of parentheses is _balanced_ if it is obtained by either concatenating zero-or-more shorter balanced strings, or by wrapping a shorter balanced string in a pair of parentheses.
--
-- Use the `State` monad and the `traverse_` function to write a function
--
-- ```purescript
-- testParens :: String -> Boolean
-- ```
--
-- which tests whether or not a `String` of parentheses is balanced, by keeping track of the number of opening parentheses which have not been closed. Your function should work as follows:
--
-- ```purescript
-- > testParens ""
--  true
--
--  > testParens "(()(())())"
--  true
--
--  > testParens ")"
--  false
--
--  > testParens "(()()"
--  false
-- ```
--
-- _Hint:_ you may like to use the `toCharArray` function from the `Data.String` module to turn the input string into an array of characters.


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
