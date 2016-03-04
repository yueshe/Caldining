Feature: display more info
 
  As a contract manager
  I want to see detailed info of artists
  so that I can keep track of detailed contracts of artists

Background: artists have been added to database
  
  Given the following artists exist:
  | artists                   | contract type          | account         |
  | Bianca Cabrera            | Co-Production CCP      | Bianca Cabrera  |


  And I am on the CounterPulse home page

Scenario: display more info
  When I am on the home page
  Then I should see Bianca Cabrera
  When I press more info
  Then I should see Phone
  And  I should see Email