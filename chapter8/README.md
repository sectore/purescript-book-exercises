# Chapter 8: "The Eff Monad"

## [8.19.1 - 8.19.3)](./8.19.purs)

1. (Easy) Modify the application to include a work phone number text box.
2. (Medium) Instead of using a ul element to show the validation errors in a list, modify the code to create one div with the alert style for each error.
3. (Medium) Rewrite the code in the Data.AddressBook.UI module without explicit calls to >>=.


## [8.19.4)](./8.19.4/src/)
(Difficult, Extended) One problem with this user interface is that the validation errors are not displayed next to the form fields they originated from. Modify the code to fix this problem.
Hint: the error type returned by the validator should be extended to indicate which field caused the error. You might want to use the following modified Errors type:

```purescript
data Field = FirstNameField
           | LastNameField
           | StreetField
           | CityField
           | StateField
           | PhoneField PhoneType

data ValidationError = ValidationError String Field

type Errors = Array ValidationError
```

You will need to write a function which extracts the validation error for a particular Field from the Errors structure.
