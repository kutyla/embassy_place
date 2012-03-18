Feature: Information about Embassy Place
In order to increase revenue
Visitors need to learn about Embassy Place.

Scenario: A visitor wants to see the apartments
  Given a visitor
  When she visits the gallery page
  Then she should see the gallery page
    And not see a 404 page

Scenario: A visitor want to learn about the features
  Given a visitor
  When she visits the features page
  Then she should see the features page
    And not see a 404 page
