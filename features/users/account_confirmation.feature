Feature: Account confirmation
  Scenario: A new user attempts to confirm his account
    Given the user "danryan" has not signed up
    When he signs up
    And he confirms his account via the confirmation link
    Then he should be confirmed