Feature: Food
  As a Cal dining user
  I want to see food listed on the Crossroad page
  so that I can click on any of them to check its information

Background:
    Given the database is setup
    Given I am logged in
    Given I am the admin
    
Scenario: food
    Given I am on the homepage
    Then I should see "See menu for Crossroads"
    When I follow "See menu for Crossroads"
    Then I should see "Menu Items"