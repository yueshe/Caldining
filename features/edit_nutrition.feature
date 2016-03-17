Feature: edit
  As a Cal dining admin
  I want to edit nutrition values on any food
  so that my user can always see the updated nutrition value

Background:
    Given the database is set up
    
Scenario: different restaurant on the homepage
    Given I am on the Crossroads page
    Then I should see "French Fries"
    When I follow "French Fries"
    Then I should see "Edit"
    When I follow "Edit"
    And I fill in "Calories" with "2.3"
    And I press "Update"
    Then I should be on the Nutrition page for "French Fries"
    Then I should see "2.3"