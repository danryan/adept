Feature: Sign up
  Background:
     Given I am an unregistered user
       And I am not signed in
       
  @wip
  Scenario: User signs up with valid data
      When I sign up with valid data
      Then I should see a successful sign up message
       And I should not be confirmed
       And "dan@appliedawesome.com" should receive an email

  @wip
  Scenario: A new user attempts to confirm his account
      When I sign up with valid data
       And I confirm my account via the confirmation link
      Then I am confirmed

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