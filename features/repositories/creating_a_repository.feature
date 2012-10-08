Feature: Creating a repository
  Background:
    Given I am a registered user
    And I am signed in

  Scenario: User creates a new repository
    Given I have no repositories
    When I go to the new repository page
    And I create a new apt repository named "testrepo"
    Then I should see a successful repository create message
    And I should see my repository "testrepo"

