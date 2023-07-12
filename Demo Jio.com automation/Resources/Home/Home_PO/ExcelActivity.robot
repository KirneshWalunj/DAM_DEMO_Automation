*** Settings ***
Library    SeleniumLibrary
Library    ExcelLibrary
Library   String





*** Keywords ***
#Checking the navbar elements 
Reading Data of Home Page from Excel
    Open Excel Document     C:/Users/Kirnesh.Walunj/OneDrive - Reliance Corporate IT Park Limited/Desktop/Demo Jio.com automation/Resources/workbook.xlsx    Sheet1
    ${navbarcontent}=    Read Excel Cell    1    1    Sheet1
    Log To Console    ${navbarcontent}
    ${navbarcontent}    String.Split String    ${navbarcontent}    ;
    Log To Console    ${navbarcontent}
    Set Global Variable        ${navbarcontent}    ${navbarcontent}