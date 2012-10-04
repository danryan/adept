@javascript
Feature: Sign out
  Background:
    Given a user exists
    And is authenticated

  Scenario: An authenticated user wants to sign out
    When he clicks "Sign out"
    Then he should see "Signed out successfully."
