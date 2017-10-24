@example @google_search
Feature: Searching Google

  As an internet user
  I want to be able to search for something that I take interest in
  In order to find results relating to my search term

  Background:
    Given I navigate to "Home"
    When I search for "Facebook"

  Scenario: A search should bring back a result
    Then I should see a result

  Scenario:
    When I follow the first relevant result
    Then I should be on the "Facebook Home" page


