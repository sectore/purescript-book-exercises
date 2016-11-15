
-- Exercise:
-- (Easy) Modify the application to include a work phone number text box.

-- Solution:
-- Update AddressBook.purs with:

examplePerson :: Person
examplePerson =
  person "John" "Smith"
         (address "123 Fake St." "FakeTown" "CA")
         [ phoneNumber HomePhone "555-555-5555"
         , phoneNumber CellPhone "555-555-0000"
         , phoneNumber WorkPhone "555-555-1111"
         ]
