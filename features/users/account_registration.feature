Feature: Account registration
  Scenario: A user wants to sign up
    Given the user "danryan" has not signed up
    When he signs up
    Then he should see "a confirmation link has been sent"
    And "dan@appliedawesome.com" receives an email
