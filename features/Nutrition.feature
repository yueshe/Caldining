Feature: Home page
  As a Cal dining user
  I want to see nutrition value for the food in cal dining
  so that I can decide if I should eat them

Background:
    Given the database is set up
    
Scenario: different restaurant on the homepage
    Given I am on the Crossraod page
    Then I should see "French Fries"
    When I press "French Fries"
    Then I should see "Total Fat"
    And I should see "Tot. Carb"
    And I should see "Cholesterol"
    And I should see "Protein"
    And I should see "Sodium"