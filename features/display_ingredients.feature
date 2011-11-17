Feature: Display ingredients
  In order to view available ingredients
  As a user
  I want a list of ingredients
  
  Scenario: Show an ingredient detail
    Given an ingredient exists with name: "Melange", description: "A free-flowing spice"
    When I go to the detail page for that ingredient
    Then I should see the heading "Melange"
    And I should see the description "A free-flowing spice"
  
  Scenario: Show a list of ingredients
    Given the following ingredients exist
      | name           | description          |
      | Red Mushroom   | Grow big and strong! |
      | Green Mushroom | Get a life.          |
      | Fire Flower    | Surprisingly cool    |
    When I go to the index page for ingredients
    Then I should see the following in the index list
      | name           | description          |
      | Red Mushroom   | Grow big and strong! |
      | Green Mushroom | Get a life.          |
      | Fire Flower    | Surprisingly cool    |
    
  
  
  
  
  

  
