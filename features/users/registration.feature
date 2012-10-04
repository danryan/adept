# @javascript
Feature: Registration

  Scenario: Creating a new user
    Given the user "danryan" has not signed up
    When he signs up
    Then he should see "a confirmation link has been sent"
    And "dan@appliedawesome.com" receives an email

  Scenario: Confirming the user
    Given the user "danryan" has not signed up
    When he signs up
    And he confirms his account via the confirmation link
    Then he should be confirmed