Feature: tracking
  As a Cal dining user
  I want to view my nutrition log
  so that I can keep track of my nutrition intake

Background:
    Given the database is setup
    Given I am logged in

Scenario: user profile
  Given I am on the homepage
  When I click on "User Profile"
  Then I should see "aaaaaa@gmail.com"

Scenario: add a food
    Given I am on the homepage
    When I follow "Show All Items"
    And I type "1" in "amount"
    And I click on "Add to Diet"
    When I go to the User page
    Then I should see "French Fries"
    And I should see "100 cal"

Scenario: add a food - (sad path)
    Given I am on the homepage
    When I follow "Show All Items"
    And I click on "Add to Diet"
    Then I should see "Invalid quantity"

Scenario: Categories
    Given I am on the homepage
    When I follow "Show All Items"
    And I click on "Add"
    When I go to the User page
    Then I should see "Breakfast"
    And I should see "Lunch"
    And I should see "Dinner"
    
Scenario: Expand Categories
    Given I am on the homepage
    When I follow "Show All Items"
    And I click on "Add"
    When I go to the User page
    Then I should see "Breakfast"
    And I click on "Breakfast"
    Then I should see "French Fries"