Feature: Nutrition
  As a Cal dining user
  I want to see nutrition value for the food in cal dining
  so that I can decide if I should eat them

Background:
    Given the database is setup
    Given I am logged in
    
Scenario: nutrition
    Given I am on the homepage
    When I follow "Crossroads"
    Then I should see "French Fries"
    When I follow "French Fries"
    Then I should see "Fat"
    And I should see "Calories"
    And I should see "Carb"
    And I should see "Cholesterol"
    And I should see "Protein"
    And I should see "Sodium"