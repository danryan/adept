Feature: Sign in as unconfirmed user

  Scenario: a valid but unconfirmed user tries to sign in
  
    Given a new, unconfirmed user
    And is not authenticated
    When he signs in
    Then he should see "You have to confirm your account before continuing."