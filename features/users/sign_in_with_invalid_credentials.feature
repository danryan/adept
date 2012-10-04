Feature: Sign in with invalid credentials

  Scenario: a valid user is typing an incorrect password
  
    Given a user has signed up
    And is not authenticated
    When he signs in with bad credentials
    Then he should see "Invalid login or password."