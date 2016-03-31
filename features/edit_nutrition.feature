Feature: edit
  As a Cal dining admin
  I want to edit nutrition values on any food
  so that my user can always see the updated nutrition value

Background:
    Given I am logged in
    
Scenario: different restaurant on the homepage
    Given I am on the Crossroads page
    Then I should see "French Fries"
    When I follow "French Fries"
    Then I should see "Edit"
    When I press "Edit"
    And I fill in "2.3g" for "Total Fat"
    And I press "Finish"
    Then I should be on the Nutrition page for "French Fries"
    And I should see "2.3g"