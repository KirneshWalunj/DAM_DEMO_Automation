*** Settings ***    

Library    SeleniumLibrary
Resource   ../../Resources/Fiber/ExcelActivity.robot
Variables  ../../Resources/Fiber/fibervariable.yaml
Resource    ../../Resources/Fiber/ExcelActivity.robot

*** Keywords ***

Going to Fiber
    Click Link    JioFiber    #Clicking on Jiofiber from Navbar which is an Link

Validate Fiber URL
    Location Should Be    ${FIBERURL}    #Validating the url page with the stored url in FIBERURL variable

Validate Subnavbar
    Reading Data of Fiber Page from Excel            #Calling the valiable from excel activity file
    #creating a local variable & running a for loop from 0 to 7 & checking it with the particular xpath
    FOR    ${content}    IN RANGE    0    7
        Element Text Should Be    xpath://nav[@parent-attr="JioFiber"]//descendant::a[${content+1}]    ${fibersubnavbarcontent[${content}]}  
        
    END

Going to Prepaid
    Click Link    xpath:(//a[@parent-attr='JioFiber'])[2]        #Clicking on Prepaid from subnavbar

Validate Prepaid of Fiber
    Location Should Be    ${FiberPrepaid}                #Verifying the url of prepaid of fiber page
    Reading Data of Prepaid Page of Fiber from Excel    #Calling the valiable from excel activity file
    #creating a local variable & running a for loop from 0 to 7 & checking it with the particular xpath
    FOR    ${content}    IN RANGE    0    7
        Element Text Should Be    xpath://section[@class='fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex']//descendant::button[${content+1}]    ${fiberprepaidcontent[${content}]}  
        
    END

Going to Quarterly
    Click Button    Quarterly    #Clicking on Quarterly button

Verify if subscription element is present on plan cards    
    #Here we pass argument to index which is an local variable so it will take the value of arugment from the excel activity file & it will run the loop & check if page contains sunscriptons at specified xpaths
    [Arguments]    ${index}
    Page Should Contain Element    xpath=(//div[contains(@class, 'planDetailsCard')])[${index}]//div[@class='Details_subscriptionStyle__1ibDI']


Text Validation
    Reading Text from Excel    #calling it from excel activity
    #creating a local variable & running a for loop from 0 to 6 & checking it with the particular xpath
    FOR  ${i}  IN RANGE    0    6
        Element Should Contain    xpath:(//div[@class="Subcategory_heading__3Y18a j-text j-text-heading-m"])[${i+1}]    ${TextData}[${i}] 
    END
    
Filter button & text validation
    #Validating Page elements like Quarterly, Other Prepaid plans & More informartion & filtyer buttons
    Page Should Contain Button    Other Prepaid plans
    Page Should Contain Button    xpath://button[@class="j-button j-button-size__large secondary icon-primary icon-only"]
    Page Should Contain Element  xpath= //h1[@class='Filter_category__2vFb8 j-text j-text-heading-l']['Quarterly']
    Page Should Contain Element    xpath: //div[@class='changeCategory_moreInfo__2QPjV j-text j-text-heading-l']['Other Prepaid plans']
    Page Should Contain Element    xpath://div[@class='MoreInformation_moreInfo__2qAx3 j-text j-text-heading-s']['More information']

Verificattion of Plan card
    Verify content of plans cards using the excel file    #Calling this from excelactivity
    #creating a local variable & running a for loop from 0 to 7 & checking it with the particular xpath
    FOR  ${i}  IN RANGE  0    7
        Scroll Element Into View    xpath=(//div[contains(@class, 'planDetailsCard')])[${i+1}]
        ${textOfPlanCards}=    Get Text    xpath=(//div[contains(@class, 'planDetailsCard')])[${i+1}]    #getting text from the all the plancards & storing it in textofplancards
        #Log To Console    ${rowData}[${i}]  
        Should Be Equal    ${textOfPlanCards}    ${rowData}[${i}]    strip_spaces=True        #checking the data stored in local variable with rowdata we reading from excel activity while removing all the in btw spaces

        ${check}=    Run Keyword And Return Status    Verify if subscription element is present on plan cards    ${i+1}    
        Log To Console    ${check}
        Should Be Equal As Strings    ${check}    ${subscriptionData}[${i}]    ignore_case=True            #checking if plancard contains subscription element of not
        Verify if the recharge and view details is present on the plan cards    ${i+1}
    END



Verify if the recharge and view details is present on the plan cards
    #Here we pass argument to index which is an local variable so it will take the value of arugment from the excel activity file & it will run the loop & check if page contains sunscriptons at specified xpaths
    [Arguments]    ${index}
    Page Should Contain Element    xpath=(//div[contains(@class, 'planDetailsCard')])[${index}]//div[contains(text(), 'Recharge')]
    Page Should Contain Element    xpath=(//div[contains(@class, 'planDetailsCard')])[${index}]//div[contains(text(), 'View details')]


Validate Other Prepaid Plans 
    Location Should Be    ${OtherPlan}    #checking the page url with the url stored in variable otherplan
    Reading Data of other plan                #called from excelactivity
    #creating a local variable & running a for loop from 0 to 6 & checking it with the particular xpath
    FOR    ${content}    IN RANGE    0    6
        Element Text Should Be    xpath:(//section[@class='changeCategory_flexDisplay__1bVGH j-container l-layout--flex'])//descendant::button[${content+1}]    ${otherprepaidplan[${content}]}  
        
    END

Validate More info
    Location Should Be    ${OtherPlan}    #checking the page url with the url stored in variable otherplan
    Reading Data of more info from Excel    #called from excelactivity
    #creating a local variable & running a for loop from 0 to 3 & checking it with the particular xpath
    FOR    ${content}    IN RANGE    0    3
        Element Text Should Be    xpath:(//div[@class='MoreInformation_buttonCont__1bLIb'])//descendant::button[${content+1}]    ${moreinfo[${content}]} 
        
    END

    