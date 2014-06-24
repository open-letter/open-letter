Scenario: User writes to their MP
  Given User has authenticated
  when User enters comments into input fields
  and checks the send by email checkbox
  and clicks "Submit"
  then an email body should be generated
  and the email headers should be populated
  and email should be sent to MP
  and a copy should be sent to User
  and a record of comments should be written to the DB
  and a follow up date should be computed
  
  