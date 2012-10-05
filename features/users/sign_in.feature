Feature: Sign in
  Scenario: User signs in successfully
    Given I am a registered user
    But I am not signed in
    When I sign in with valid credentials
    Then I should be signed in

  Scenario: User is not signed up
    And I am an unregistered user
    When I sign in with valid credentials
    Then I should see an invalid login message
    And I should be signed out

  Scenario: User is signed up but not confirmed
    Given I am an unconfirmed user
    And I am not signed in
    When I sign in with valid credentials
    Then I should see an unconfirmed account message
    And I should be signed out

  Scenario: User enters wrong username
    Given I am a registered user
    And I am not signed in
    When I sign in with a wrong username
    Then I should see an invalid login message 

  Scenario: User enters wrong email
    Given I am a registered user
    And I am not signed in
    When I sign in with a wrong email
    Then I should see an invalid login message

  Scenario: User enters wrong password
    Given I am a registered user
    And I am not signed in
    When I sign in with a wrong password
    Then I should see an invalid login message

  Scenario: User is already signed in
    Given I am a registered user
    And I am signed in
    When I go to the sign in page
    Then I should see an unsuccessful sign in message