Feature: Food
  As a Cal dining user
  I want to see food listed on the Crossroad page
  so that I can click on any of them to check its information

Background:
    Given the database is set up
    
Scenario: different restaurant on the homepage
    Given I am on the Crossroads page
    Then I should see "French Fries"