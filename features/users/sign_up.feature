Feature: Sign up
  Background:
    Given I am an unregistered user
    And I am not signed in
       
  # @wip
  Scenario: User signs up with valid data
    When I sign up with valid data
    Then I should see a confirmation request message
    And I should receive an email with subject "Confirmation instructions"

  # @wip
  Scenario: User confirms account
    When I sign up with valid data
    Then I should receive an email
    And I open the email
    And I follow "Confirm my account" in the email
    Then I should see "Your account was successfully confirmed."
    And I should see "You are now signed in."

  Scenario: User signs up with invalid email
    When I sign up with an invalid email
    Then I should see an invalid email message

  Scenario: User signs up with invalid username
    When I sign up with an invalid username
    Then I should see an invalid username message

  Scenario: User signs up without password
    When I sign up without a password
    Then I should see a missing password message

  Scenario: User signs up without password confirmation
    When I sign up without a password confirmation
    Then I should see a missing password confirmation message

  Scenario: User signs up with mismatched password and confirmation
    When I sign up with a mismatched password confirmation
    Then I should see a mismatched password message

  Scenario: An authenticated user attempts to sign up
    Given I am a registered user
    And I am signed in
    When I go to the sign up page
    Then I should see an unsuccessful sign up message