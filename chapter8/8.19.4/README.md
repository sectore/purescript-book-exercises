## Exercise [8.19.4](./8.19.4/src/)
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
