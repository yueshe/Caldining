Feature: edit nutrition
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
    When I follow "French Fries"
    Then I should see "Edit"
    When I follow "Edit"
    Then I should see "Editing Item"
    When I fill in "1000" for "Calories"
    And I press "Submit"
    Then I should see "1000"
    
Scenario: new food
    Given I am on the homepage
    When I follow "Crossroads"
    When I follow "Add New Item"
    When I fill in "French Fries" for "Name"
    And I select "Crossroads" from "Location"
    And I press "Submit"
    Then I should see "French Fries"