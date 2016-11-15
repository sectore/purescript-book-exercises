

foreign import data COMFIRM :: !
foreign import confirm :: forall eff. String -> Eff (confirm :: COMFIRM | eff) Boolean
