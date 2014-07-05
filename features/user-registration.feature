@mvp
Feature: Register a new user

  @invite-only
  Scenario: User follows link and is presented with a form
    Given User has received an email containing a registration link
    When User clicks this link
    Then User is presented with registration page
    And registration form has a field containing the code
    
  Scenario: User enters details and submits form
    Given User is at registration page
    When User has completed all required fields
    And clicks "Register"
    Then new User is created in an "inactive" state
    And details are stored
    And confirmation email is sent
  
  Scenario: User confirms email
    Given User has received a registration confirmation email
    When User clicks "Confirm Account" link
    Then User account status is set to "active"
    And User is directed to login page

  