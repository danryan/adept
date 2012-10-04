Feature: Sign in as confirmed user
  Scenario: a valid, confirmed user attemps to sign in
    Given a user has signed up
    And is not authenticated
    But is confirmed
    When he signs in
    Then he should see "Signed in successfully."