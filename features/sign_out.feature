Feature: Sign
  As a caldining user
  I want to to sign out
  so that I can go back to the items page

Background:
    Given the database is setup
    Given I am logged in
    
Scenario: sign out
    When I follow "Log out"
    Then I should see "Signed out successfully."