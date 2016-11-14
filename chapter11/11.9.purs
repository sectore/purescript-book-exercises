
-- -------------------------------------------------
-- ex. 11.9.1
-- -------------------------------------------------

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



-- -------------------------------------------------
-- ex. 11.9.2
-- -------------------------------------------------

import Control.Monad.Except.Trans (ExceptT, runExceptT, throwError)
import Control.Monad.State (get, put)
import Control.Monad.State.Trans (StateT, runStateT)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Writer (tell)
import Control.Monad.Writer.Trans (WriterT, runWriterT)
import Data.Identity (Identity)
import Data.Maybe (Maybe(..))
import Data.Newtype (unwrap)
import Data.String (Pattern(Pattern), take, stripPrefix, length)
import Prelude (bind, show, pure, ($), (<>))


type Errors = Array String
type Log = Array String
type Parser = StateT String (WriterT Log (ExceptT Errors Identity))

string :: String -> Parser String
string str = do
  s <- get
  lift $ tell ["The state is " <> show s]
  let mSuffix = stripPrefix (Pattern str) s
  case mSuffix of
    Nothing -> lift $ lift $ throwError [show str <> " not found in " <> s]
    Just suffix -> do
      put suffix
      pure $ take (length suffix) s

runParser p s = unwrap $ runExceptT $ runWriterT $ runStateT p s
