Feature: Menu
  As a Cal dining user
  I want to see "Breakfast, lunch and dinner" menus listed on the crossroad page
  so that I can click on any of them to check its information

Background:
    Given the database is set up
    
Scenario: different restaurant on the homepage
    Given I am on the Crossraod page
    Then I should see "Breakfast"
    And I should see "Lunch"
    And I should see "Dinner"