Feature: Sign in as invalid user
  Scenario: an invalid user
    Given a user has not signed up
    When he signs in
    Then he should see "Invalid login or password."