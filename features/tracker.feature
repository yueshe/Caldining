Feature: tracking
  As a Cal dining user
  I want to add food to my nutrition tacker
  so that I can keep track of my nutrition intake

Background:
    Given the database is setup
    Given I am logged in
    
Scenario: add a food
    Given I am on the homepage
    When I follow "Show All Items"
    Then I should see "Search"
    When I fill in "Search" with "Apple"
    Then I should see "Apple"
    And I press "Add"
    And I go to "Profile"
    Then I should see "My nutrition intake"
    Then I should see "Fat"
    And I should see "Calories"
    And I should see "Carb"
    And I should see "Cholesterol"
    And I should see "Protein"
    And I should see "Sodium"