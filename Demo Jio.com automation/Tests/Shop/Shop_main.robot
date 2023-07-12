*** Settings ***
Library    SeleniumLibrary
Library    ExcelLibrary
Library   string

Resource    ../../Resources/Common.robot

Resource    ../../Resources/Home/Home_PO/Homie.robot
Resource    ../../Resources/Shop/Shopp.robot

Suite Setup    Common.Begin Web Test
Suite Teardown    Common.End Web Test

*** Test Cases ***
Confirm the functionality of the 'Have a promocode' Field inside Shopping Cart.
    Homie.Verifying Content of Navbar
    Shopp.Going to Shop
    Shopp.Validate Apps URL
    Shopp.Validate Shop Page Navbar Content
    Shopp.Going to Accessories
    Shopp.Click on Product
    Shopp.Enter Pincode
    Shopp.Scenario Less than 6 digits
    Shopp.Invalid pincode Scenario
    Shopp.Click on Add to cart button
    #Shopp.Verify UI Elements of 'Product has been added to your Cart' Pop-Up.
    Shopp.Validating product popup
        
