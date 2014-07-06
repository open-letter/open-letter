@mvp
Feature: Sending email to MPs
  As a user
  I want to send emails to MPs
  Because they are cheaper than real mail
  And I want my MP to know how I feel

    Scenario: Authenticated User writes to their MP
      Given User has authenticated
      When User enters comments into input fields
      And checks the send by email checkbox
      And clicks "Submit"
      Then an email body should be generated
      And the email headers should be populated
      And email should be sent to MP
      And a copy should be sent to User
      And a record of comments should be written to the DB
      And a follow up date should be computed
    
