*** Settings ***    

Library    SeleniumLibrary
Resource   ../../Resources/Shop/ExcelActivity.robot
Variables  ../../Resources/Shop/Shoppvariable.yaml

*** Keywords ***

Going to Shop
    Visit Jio.com And Goto    (//section[a])[5]

Validate Apps URL
    URL Validation    ${SHOPURL}    #CHECKING THE PAGE URL WITH THE URL STORED IN VARIABLE NAMED SHOPURL
    
Validate Shop Page Navbar Content
    Reading Data of Shop Page from Excel
    #creating a local variable & running a for loop from 0 to 5 & checking it with the particular xpath
    FOR    ${content}    IN RANGE    0    5
        Wait For And Verify Content    xpath://nav[@parent-attr="Shop"]//descendant::a[${content+1}]    ${shopsubnavbarcontent[${content}]}  
        
    END
Going to Accessories
    Wait For And Click Element    (//section[a])[27]

Validate URL for Accessories
    URL Validation    ${ACCURL}      #CHECKING THE PAGE URL WITH THE URL STORED IN VARIABLE NAMED ACCURL    

Click on Product
    Wait For And Click Element    (//div[@class="pop-prod-title"])[1]

Enter Pincode
    Wait For And Input Text    //input[@id='address.postcode']    32        #ENTERING 32 IN THE PINCODE SECTION
    Wait For And Click Element    //button[@class="pincode-button btn btn-primary"]   

Scenario Less than 6 digits    
    Validating less than 6 digits
    Wait For And Verify Content    xpath=//div[@class='digital-pincode-validations error-text validation-msg pin-code-input-error']     ${less}
  

Invalid pincode Scenario
    Validating invalid pincode
    Sleep    1s
    Wait For And Input Text    //input[@id='address.postcode']    421309
    Wait For And Click Element    //button[@class='pincode-button btn btn-primary']
    Wait For And Verify Content    //div[contains(text(), 'Invalid Pincode')]    ${invalid}
    Wait For And Input Text    //input[@id='address.postcode']    421306
    Element Should Be Disabled    xpath=//button[@id='AddToCartBTN']
    Wait For And Click Element    //button[@class='pincode-button btn btn-primary']
    Element Should Be Enabled    xpath=//button[@id='AddToCartBTN']

Click on Add to cart button
    Wait For And Click Element    xpath=//button[@id='AddToCartBTN']

Validating product popup
    Validating product
    Sleep    1s
    Log To Console       ${popup}
    Page Should Contain    ${popup}
    Element Text Should Be    xpath=//div[@class='digi-cartpopup-content']//div    ${popup1}
    Page Should Contain Link    xpath=//div[@id='digi-cartpopup-ContinueShopping']//a
    Page Should Contain Link    xpath=//div[@id='digi-cartpopup-GotoCart']//a
