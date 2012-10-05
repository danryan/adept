# Feature: Creating a repository
#     Background:
#       Given I am a registered user
#       And I am authenticated
#       And I have no repositories

#   Scenario: A user creates a new repository
#     When I visit the new repositories page
#     And I create a new repository named "testrepo"
#     Then I should see "testrepo"
#     And I should have 1 repository
