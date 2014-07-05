@mvp
Feature: Sending physical mail to MPs
  As a user
  I want to send physical mail to MPs
  Because they have greater impact than email
  And I want my MP to know how I feel

    Scenario: User writes to their MP
      Given User has authenticated
      And has not previously stored payment details
      When User enters comments into input fields
      And checks the send by physical mail box
      And clicks "Submit"
      Then User should be prompted to enter payment details
      And clicks "Proceed with payment"
      Then details of the recipient should be retrieved
      Then additional postal details of the User should be retrieved
      Then a pdf version of the letter should be rendered
      Then the pdf should be sent via email to the printer
      And a copy should be sent to User via email
      And a record of comments should be written to the DB
      And a follow up date should be computed

