

-- ex. 8.19.1
-- AddressBook.purs
examplePerson :: Person
examplePerson =
  person "John" "Smith"
         (address "123 Fake St." "FakeTown" "CA")
         [ phoneNumber HomePhone "555-555-5555"
         , phoneNumber CellPhone "555-555-0000"
         , phoneNumber WorkPhone "555-555-1111"
         ]


-- ex. 8.19.2
-- Main.purs -> `addressBook`

let renderValidationError err = D.div [ P.className "alert alert-danger"]
                                      [ D.text err ]

    renderValidationErrors [] = []
    renderValidationErrors xs =
      map renderValidationError xs


-- ex. 8.19.3
-- Main.purs -> main

win <- window
doc <- document win
