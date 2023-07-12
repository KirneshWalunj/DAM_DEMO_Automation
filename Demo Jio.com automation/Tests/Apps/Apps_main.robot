*** Settings ***
Library    SeleniumLibrary
Library    ExcelLibrary
Library   string

Resource    ../../Resources/Common.robot
Resource    ../../Resources/Apps/appp.robot
Resource    ../../Resources/Home/Home_PO/Homie.robot


Suite Setup    Common.Begin Web Test
Suite Teardown    Common.End Web Test

*** Test Cases ***



Content Validation of Homepage
    Homie.Verifying Content of Navbar

Go to Apps section
    appp.Going to Apps


Validation of Apps Page
   appp.Validate Apps URL