*** Settings ***
Library    SeleniumLibrary
Library    ExcelLibrary
Library   String





*** Keywords ***

Reading Data of Shop Page from Excel
    #Open Excel Document    ../../Resources/workbook.xlsx    Sheet 2
    ${shopsubnavbarcontent}=    Read Excel Cell    1    1    Sheet2            #reading data from excel & storing it in local variable
    #Log To Console    ${shopsubnavbarcontent}
    ${shopsubnavbarcontent}    String.Split String    ${shopsubnavbarcontent}    ;        #spliting the data stored in local variable on the basis of ';'
    #Log To Console    ${shopsubnavbarcontent}
    Set Global Variable        ${shopsubnavbarcontent}    ${shopsubnavbarcontent}
    #Close All Excel Documents

Validating less than 6 digits
    Reading Data of Shop Page from Excel
    ${less}=     Read Excel Cell    3    1    Sheet3                                        #reading data from excel & storing it in local variable
    #Log To Console    ${less}
    Set Global Variable    ${less}    ${less}                                                #setting local variable as global variable
    #Close All Excel Documents

Validating invalid pincode
    ${invalid}=    Read Excel Cell    4    1    Sheet3                 #reading data from excel & storing it in local variable                       
    #Log To Console    ${invalid}
    Set Global Variable    ${invalid}    ${invalid}                                #setting local variable as global variable
    #Close All Excel Documents

Validating product
    ${popup}=    Read Excel Cell    5    1    Sheet3                                            #reading data from excel & storing it in local variable
    Set Global Variable    ${popup}    ${popup}                                    #setting local variable as global variable
    ${popup1}=   Read Excel Cell    6    1    Sheet3
    Set Global Variable    ${popup1}    ${popup1}                        #setting local variable as global variable
    #Close All Excel Documents