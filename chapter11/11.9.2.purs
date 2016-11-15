
-- Exercise:
-- (Medium) Write a parser
--
-- ```purescript
-- string :: String -> Parser String
-- ```
-- which matches a string as a prefix of the current state, or fails with an error message.
--
-- Your parser should work as follows:
--
-- ```bash
-- > runParser (string "abc") "abcdef"
--  (Right (Tuple (Tuple "abc" "def") ["The state is abcdef"]))
-- ```
--
-- _Hint:_ you can use the implementation of `split` as a starting point. You might find the `stripPrefix` function useful.

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
