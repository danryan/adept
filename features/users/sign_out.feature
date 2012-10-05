Feature: Sign out
  Background:
    Given I am a registered user
    And I am signed in

  Scenario: User signs out successfully
    When I sign out
    Then I should see a successful sign out message
    And I should be signed out