Feature: Menu
  As a Cal dining user
  I want to see menus listed on the crossroad page
  so that I can click on any of them to check its information

Background:
    Given the database is setup
    Given I am logged in
    
Scenario: menu
    Given I am on the homepage
    When I follow "Crossroads"
    Then I should see "Menu Items"
