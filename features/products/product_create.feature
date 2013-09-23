Feature: Create product
  As a registered user of the website or a visitor
  I want to create a product
  So that I can sell it

    Background: 
      Given I am logged in

    Scenario:
      When I create a product with valid data
      Then I should see a successful listing message


