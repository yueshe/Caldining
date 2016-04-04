Feature: Home page
  As a Cal dining user
  I want to see different dining halls listed on the homepage
  so that I can follow any of them to check its information

Background:
    Given the database is setup
    Given I am logged in
    
Scenario: different restaurant on the homepage
    Given I am on the homepage
    Then I should see "Crossroads"
    And I should see "Cafe 3"
    And I should see "Foothill"
    And I should see "CKC"
