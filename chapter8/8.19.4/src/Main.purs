module Main where

import Prelude
import React.DOM as D
import React.DOM.Props as P
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Except (runExcept)
import DOM (DOM)
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToDocument)
import DOM.HTML.Window (document)
import DOM.Node.NonElementParentNode (getElementById)
import DOM.Node.Types (ElementId(..), documentToNonElementParentNode)
import Data.AddressBook (Address(..), Person(..), PhoneNumber(..), examplePerson)
import Data.AddressBook.Validation (ValidationError(ValidationError), Errors
, Field(..), validatePerson', hasFieldInErrors, getFieldFromErrors)
import Data.Array ((..), length, modifyAt, zipWith)
import Data.Either (Either(..))
import Data.Foldable (for_)
import Data.Foreign (F, readString, toForeign)
import Data.Foreign.Index (prop)
import Data.Maybe (Maybe(..), fromJust, fromMaybe)
import Data.Nullable (toMaybe)
import Partial.Unsafe (unsafePartial)
import React (ReactClass, ReadWrite, ReactState, Event, ReactThis, ReactElement, createFactory, readState, spec, createClass, writeState)
import ReactDOM (render)

newtype AppState = AppState
  { person :: Person
  , errors :: Errors
  }

initialState :: AppState
initialState = AppState
  { person: examplePerson
  , errors: []
  }

valueOf :: Event -> F String
valueOf e = do
  target <- prop "target" (toForeign e)
  value <- prop "value" target
  readString value

updateAppState
  :: forall props eff
   . ReactThis props AppState
  -> (String -> Person)
  -> Event
  -> Eff ( console :: CONSOLE
         , state :: ReactState ReadWrite
         | eff
         ) Unit
updateAppState ctx update e =
  for_ (runExcept $ valueOf e) \s -> do
    let newPerson = update s

    log "Running validators"
    case validatePerson' newPerson of
      Left errors -> writeState ctx (AppState { person: newPerson, errors: errors })
      Right _ -> writeState ctx (AppState { person: newPerson, errors: [] })

addressBook :: forall props. ReactClass props
addressBook = createClass $ spec initialState \ctx -> do
  AppState { person: Person person@{ homeAddress: Address address }, errors } <- readState ctx

  let
      formField :: String -> String -> String -> (String -> Person) -> Field -> Errors -> ReactElement
      formField label hint value update field errors' =
        let
          hasError = hasFieldInErrors field errors'
          errorText = case getFieldFromErrors field errors' of
                        Nothing -> ""
                        Just (ValidationError msg _) -> msg
        in
          D.div' [
              D.div [ P.className "text-danger"] [ D.text errorText]
              , D.div [ P.className $ "form-group " <> if hasError then "has-error" else ""  ]
                    [ D.label [ P.className "col-sm-2 control-label" ]
                              [ D.text label]
                    , D.div [ P.className "col-sm-3" ]
                            [ D.input [ P._type "text"
                                      , P.className "form-control"
                                      , P.placeholder hint
                                      , P.value value
                                      , P.onChange (updateAppState ctx update)
                                      ] []
                            ]
                    ]
                ]

      updatePhoneNumberAt index value = Person $ person {
        phones = fromMaybe person.phones $ modifyAt index (updatePhoneNumber value) person.phones
      }

      renderPhoneNumber (PhoneNumber phone) index =
        formField (show phone."type") "XXX-XXX-XXXX" phone.number
          (updatePhoneNumberAt index) (PhoneField phone."type") errors

      updateFirstName s = Person $ person { firstName = s }
      updateLastName  s = Person $ person { lastName  = s }

      updateStreet s = Person $ person { homeAddress = Address $ address { street = s } }
      updateCity   s = Person $ person { homeAddress = Address $ address { city   = s } }
      updateState  s = Person $ person { homeAddress = Address $ address { state  = s } }

      updatePhoneNumber s (PhoneNumber o) = PhoneNumber $ o { number = s }

  pure $
    D.div [ P.className "container" ]
          [ D.div [ P.className "row" ]
                  [ D.form [ P.className "form-horizontal" ] $
                           [ D.h3' [ D.text "Basic Information" ]

                           , formField "First Name" "First Name" person.firstName updateFirstName FirstNameField errors
                           , formField "Last Name"  "Last Name"  person.lastName  updateLastName LastNameField errors

                           , D.h3' [ D.text "Address" ]

                           , formField "Street" "Street" address.street updateStreet StreetField errors
                           , formField "City"   "City"   address.city   updateCity CityField errors
                           , formField "State"  "State"  address.state  updateState StateField errors

                           , D.h3' [ D.text "Contact Information" ]
                           ]
                           <> zipWith renderPhoneNumber person.phones (0 .. length person.phones)
                  ]
          ]

main :: Eff ( console :: CONSOLE
            , dom :: DOM
            ) Unit
main = void do
  log "Rendering address book component"
  let component = D.div [] [ createFactory addressBook unit ]
  doc <- window >>= document
  ctr <- getElementById (ElementId "main") (documentToNonElementParentNode (htmlDocumentToDocument doc))
  render component (unsafePartial fromJust (toMaybe ctr))
