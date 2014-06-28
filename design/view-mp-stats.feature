Feature: Viewing MP statistics
  As a user
  I want to be able to see statistics on MP performance
  Because this promotes genuine representation and accountability

    Scenario: User selects MP by 
      Given User has arrived at OpenLetter.org.au
      When User 
      And checks the send by email checkbox
      And clicks "Submit"
      Then an email body should be generated
      And the email headers should be populated
      And email should be sent to MP
      And a copy should be sent to User
      And a record of comments should be written to the DB
      And a follow up date should be computed
    