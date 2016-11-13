
-- ex 10.15.1
foreign import data COMFIRM :: !
foreign import confirm :: forall eff. String -> Eff (confirm :: COMFIRM | eff) Boolean


-- ex 10.15.2
foreign import removeItem :: forall eff. String -> Eff (storage :: STORAGE | eff) Unit
