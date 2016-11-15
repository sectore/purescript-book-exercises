
-- Exercise:
-- (Easy) What is the result of replacing execState with runState or evalState in our example above?

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
