Feature: Home page
  As a Cal dining user
  I want to see different dining halls listed on the homepage
  so that I can follow any of them to check its informationcd

Background:
    Given the database is set up
    
Scenario: different restaurant on the homepage
    Given I am on the homepage
    Then I should see "Crossroad"
    And I should see "Cafe3"
    And I should see "Foothill"
    And I should see "CKC"
    And I should see "Cafe3"
    