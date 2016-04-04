Feature: Menu
  As a Cal dining user
  I want to see menus listed on the crossroad page
  so that I can click on any of them to check its information

Background:
    Given the database is setup
    
Scenario: menu
    Given I am on the homepage
    When I go to crossroads
    Then I should see "Menu Items"
