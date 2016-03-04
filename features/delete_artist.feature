Feature: modify a artist
 
As a contract manager
I want to modify an artist information
so I can keep their information up-to-date

Background: artists have been added to database
  
  Given the following artists exist:
  | artists                   | contract type          | account         |
  | Bianca Cabrera            | Co-Production CCP      | Bianca Cabrera  |


  And I am on the CounterPulse home page

Scenario: modify an artist
  When I am on the home page
  Then I should see "Bianca Cabrera"
  When I press "more info"
  Then I should see phone as "123456789"
  When I press "edit"
  When I press upload with "artist.exl"
  When I press "more info"
  Then I should see phone as "987654321"