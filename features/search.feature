Feature: search
  As a Cal dining user
  I want to search a food according to a key word
  so that I can get the desired food information I want

Background:
    Given the database is setup
    Given I am logged in
    Given I am the admin
    
Scenario: search a food
    Given I am on the homepage
    When I follow "Show All Items"
    Then I should see "Listing Items"
    When I fill in "search" with "FRENCHFRIES"
    Then I should see "French Fries"


Scenario: search on user profile - meal 
  Given I am on the user page
  When I fill in "search" with "Breakfast"
  Then I should not see "French Fries"

  
Scenario: search on user profile - sad
  Given I am on the user page
  When I fill in "search" with "8790ipojnkhu"
  Then I should not see "French Fries"