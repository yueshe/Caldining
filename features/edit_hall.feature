Feature: edit hall
  As a Cal dining admin
  I want to edit, destroy, create halls
  so that my user can always see the updated halls available

Background:
    Given the database is setup
    Given I am logged in
    Given I am the admin
    
Scenario: edit hall
    Given I am on the homepage
    When I follow "Edit"
    And I fill in "Cafe 3" for "Name"
    And I press "Update Hall"
    Then I should see "Cafe 3"
    
Scenario: new hall
    Given I am on the homepage
    When I follow "New Hall"
    And I fill in "test hall" for "Name"
    And I press "Create Hall"
    Then I should see "test hall"
    
Scenario: destroy hall
    Given I am on the homepage
    When I follow "Destroy"
    Then I should not see "Cafe 3"