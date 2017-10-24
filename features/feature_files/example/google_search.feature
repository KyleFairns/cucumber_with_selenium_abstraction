@example @google @search
Feature: Searching Google

  As an internet user
  I want to be able to search for something that I take interest in
  In order to find results relating to my search term

  Background:
    Given I navigate to "Home"
    When I search for "Facebook"

  @find_result
  Scenario: A search should bring back a result
    Then I should see a result

  @follow_result
  Scenario: A search result is followable
    When I follow the first relevant result
    Then I should be on the "Facebook Home" page


