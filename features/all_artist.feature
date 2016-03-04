Feature: display list of artists
 
  As a contract manager
  I want to see all artists I am working with
  so that I can keep track of all of my contracts

Background: artists have been added to database
  
  Given the following artists exist:
  | artists                   | contract type          | account         |
  | Bianca Cabrera            | Co-Production CCP      | Bianca Cabrera  |


  And I am on the CounterPulse home page

Scenario: display list of artist
  When I am on the home page
  Then I should see Bianca Cabrera