Feature: Food
  As a Cal dining user
  I want to see food listed on the Crossroad page
  so that I can click on any of them to check its information

Background:
    Given the database is setup
    Given I am logged in
    
Scenario: food
    Given I am on the homepage
    When I go to crossroads
    Then I should see "French Fries"