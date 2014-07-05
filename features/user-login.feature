@mvp
Feature: Login a registered user

  Scenario: A user logs in
    Given User has already registered
    And status is "active"
    When 
