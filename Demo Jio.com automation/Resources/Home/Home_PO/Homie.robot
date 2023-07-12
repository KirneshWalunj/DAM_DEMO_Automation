*** Settings ***
Library     SeleniumLibrary
Library    ExcelLibrary
Library    string
Resource    ../Home_PO/ExcelActivity.robot
Resource    ../../Common.robot
*** Keywords ***

Verifying Content of Navbar
    Visit Jio.com
    ExcelActivity.Reading Data of Home Page from Excel    #called from excel activity
    #creating a local variable & running a for loop from 0 to 7 & checking it with the particular xpath
    FOR    ${content}    IN RANGE    0    7
        Wait For And Verify Content    xpath://nav[@id='firstlevel-nav']//descendant::a[${content+1}]    ${navbarcontent[${content}]}  
        
    END
        