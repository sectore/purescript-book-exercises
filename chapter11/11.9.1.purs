-- Exercise:
-- (Easy) Use the `ExceptT` monad transformer over the `Identity` functor to write a function `safeDivide` which divides two numbers, throwing an error if the denominator is zero.

import Prelude ((<<<), ($), (/))
import Control.Monad.Except.Trans (ExceptT, throwError, runExceptT)
import Control.Monad.Trans.Class (lift)
import Data.Either (Either)
import Data.Identity (Identity(Identity))

safeDivide :: Int -> Int -> ExceptT String Identity Int
safeDivide _ 0 = throwError "denominator is zero"
safeDivide a b = lift <<< Identity $ (/) a b

runSafeDivide :: Int -> Int -> Identity (Either String Int)
runSafeDivide a =  runExceptT <<< safeDivide a
