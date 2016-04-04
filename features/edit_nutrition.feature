Feature: edit
  As a Cal dining admin
  I want to edit nutrition values on any food
  so that my user can always see the updated nutrition value

Background:
    Given the database is setup
    Given I am logged in
    Given I am the admin
    
Scenario: edit calories
    Given I am on the homepage
    When I follow "Crossroads"
    Then I should see "French Fries"
    When I follow "More nutrition info"
    Then I should see "Edit"
    When I follow "Edit"
    Then I should see "Editing Item"
    When I fill in "1000" for "Calories"
    And I press "Update Item"
    Then I should see "1000"