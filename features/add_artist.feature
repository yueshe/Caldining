Feature: add a artist
 
As a contract manager
I want add an artist 
so I can bring more artists to the company

Background: artists have been added to database


  And I am on the CounterPulse home page

Scenario: add a artist
  When I am on the home page
  Then I should see "add a artist"
  When I press "add a artist"
  When I upload with "artist.exl"
  And I press "upload"
  Then I should see "Bianca Cabrera"