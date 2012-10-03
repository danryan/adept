# @javascript
Feature: Authentication

  Scenario: a valid user
    Given a user has signed up
    And is not authenticated
    When he signs in
    Then he should see "Signed in successfully."

  Scenario: a valid user typing incorrect password
    Given a user has signed up
    And is not authenticated
    When he signs in with bad credentials
    Then I should see "Invalid login or password."

  Scenario: an invalid user
    Given a user has not signed up
    And is not authenticated
    When he signs in
    Then he should see "Invalid login or password."

  Scenario: a valid, unconfirmed user
    Given a user has signed up
    And is not authenticated
    And is not confirmed
    When he signs in
    Then he should see "You have to confirm your account before continuing."

  Scenario: a valid, confirmed user
    Given a user has signed up
    And is not authenticated
    But is confirmed
    When he signs in
    Then he should see "Signed in successfully."