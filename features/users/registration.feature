@javascript
Feature: Registration

  Scenario: Creating a new user
    Given a user has not signed up
    When he signs up
    Then he should see "a confirmation link has been sent"