*** Settings ***
Library    SeleniumLibrary
Library    ExcelLibrary
Library   string

Resource    ../../Resources/Common.robot
Resource    ../../Resources/Home/Home_PO/Homie.robot
Resource    ../../Resources/Fiber/fiberr.robot

Suite Setup    Common.Begin Web Test
Suite Teardown    Common.End Web Test

*** Test Cases ***

  

Quarterly Plan Page UI verification
    Homie.Verifying Content of Navbar
    fiberr.Going to Fiber
    fiberr.Validate Fiber URL
    fiberr.Validate Subnavbar  
    fiberr.Going to Prepaid
    fiberr.Validate Prepaid of Fiber
    fiberr.Going to Quarterly
    fiberr.Text Validation
    fiberr.Filter button & text validation
    fiberr.Verificattion of Plan card
    fiberr.Validate Other Prepaid Plans 
    fiberr.Validate More info


