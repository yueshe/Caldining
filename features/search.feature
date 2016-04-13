Feature: search
  As a Cal dining user
  I want to search a food according to a key word
  so that I can get the desired food information I want

Background:
    Given the database is setup
    Given I am logged in
    
Scenario: search a food
    Given I am on the homepage
    When I follow "Show All Items"
    Then I should see "Listing Items"
    When I fill in "search" with "French Fries"
    Then I should see "French Fries"