Feature: Creating a repository
    Background:
      Given a user exists
      And is authenticated
      And no repositories exist

  Scenario: A user creates a new repository
    When he visits the new repositories page
    And he creates a new repository named "testrepo"
    Then he should see "testrepo"
