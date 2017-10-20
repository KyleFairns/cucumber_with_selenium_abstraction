@example @google_search
Feature: Searching Google

  As an internet user
  I want to be able to search for something that I take interest in
  In order to find results relating to my search term

  Scenario: A search should bring back a result
    Given I navigate to the "Home" page
    When I search for "Facebook"
    Then I should see a result