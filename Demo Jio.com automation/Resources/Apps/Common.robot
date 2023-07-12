*** Settings ***
Library   SeleniumLibrary

*** Keywords ***

#This will begin the automation test & this will be called in the main file to initiate the test
Begin Test

    Open Browser    https://www.jio.com/    edge    #Opening the browser
       Set Selenium Speed    1s        #this will perform the test at speed of 1S
       Maximize Browser Window        #It will maximize the window to it fullest according to screen

#This will end the automation test & this will be called in the main file while ending the test
End Test
    #Sleep    5s    #When the test is performed it will keep the window open for 5S on the last step of the test
    Close Browser
