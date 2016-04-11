Feature: destroy
  As a Cal dining admin
  I want to destroy either a hall or an food item
  so that I can discard unnecessary information

Background:
    Given the database is setup
    Given I am logged in
    Given I am the admin
    
Scenario: destroy food item
    Given I am on the homepage
    When I follow "Crossroads"
    Then I should see "French Fries"
    When I follow "More nutrition info"
    Then I should see "Edit"
    When I follow "Edit"
    Then I should see "Editing Item"
    When I follow "Destroy"
    Then I should see "Item was successfully destroyed"
    And I should not see "French Fries"
    