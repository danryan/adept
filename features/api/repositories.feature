@api
Feature: Repositories JSON API
  As an API user
  Adept should
  Provide a resource for interacting with repositories

  Background:
    Given the time is Jan 1 2012, 00:00 UTC
    And the "danryan" user exists:
    And the following repositories exist:
      Scenario Outline: title
        Given context
        When event
        Then outcome
      