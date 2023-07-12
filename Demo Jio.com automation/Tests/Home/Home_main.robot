*** Settings ***

Library  SeleniumLibrary

*** Variables ***

${var1}=    Discover

*** Test Cases ***        

Opening
        
    Open Browser    https://www.jio.com/    ff

    Log To Console    ${var1}