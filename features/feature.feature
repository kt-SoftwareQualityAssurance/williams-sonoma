@kt
Feature: Feature name

   Background: 
    Given I am on home page and logged in
Scenario Outline: Test multiple products and details while adding product in cart
     Scenario: Add a prodcut to cart
        When I go to product "<category>" category
         Then I select "<sub_category>" from sub category
         And I select "<product_name>" product from grid
         And I enter the required quantity "<quantity>" to buy product
         And I see the total cost of product 
         And I add the product to cart
         And Confirm checkout overlay shows up and has checkout button
         And I click on checkout and takes me on checkout page
         And Confirm I am navigated to shopping cart page 
         Then confirm product name "<product_name>" and amount is correct

Examples:
| category | sub_category | product_name | quantity |
| cooks-tools | Salt & Pepper Mills | Olivewood Salt Box | 1 |

Scenario Outline: See a Product on Quick Look Overlay
   Scenario: Add a product to cart from quickview 
      When I go to product "<category>" category
        Then I select "<sub_category>" from sub category
        And I search for a product "<product_name>"
        And I fetch the product name and amount
        And I click on quicklook button 
        Then compare "<product_name>" name and amount with overlay details

Examples:
| category | sub_category | product_name | quantity |
| cooks-tools | Salt & Pepper Mills | Olivewood Salt Box | 1 |