*** Settings ***    
#Test Comment
Library    SeleniumLibrary
Variables   appsvariable.yaml

Resource    ../../Resources/Common.robot
*** Keywords ***

#1 comment
Going to Apps
        Click Element    (//section[a])[6]    #Clicking on Apps from Navbar which is an Link 

Validate Apps URL
    URL Validation    ${APPSURL}    #Validating the url of the apps page, which is stored in APPSURL variable

######please check