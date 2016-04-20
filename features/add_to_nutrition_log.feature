Feature: add items to nutrition log
  As a Cal dining user
  I want to add items to my nutrition log
  so that I can track my nutritional intake

Background:
    Given the database is setup
    Given I am logged in
    
Scenario: add an item
    Given I am on the homepage
    When I follow "Show All Items"
    And I follow "French Fries"
    And I click on "Add Item to Log"
    Then I should see "Item added to nutrition log"