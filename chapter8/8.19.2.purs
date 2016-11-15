
-- Exercise:
-- (Medium) Instead of using a ul element to show the validation errors in a list, modify the code to create one div with the alert style for each error.

-- Solution:
-- Update Main.purs -> `addressBook` with:

let renderValidationError err = D.div [ P.className "alert alert-danger"]
                                      [ D.text err ]

    renderValidationErrors [] = []
    renderValidationErrors xs =
      map renderValidationError xs
