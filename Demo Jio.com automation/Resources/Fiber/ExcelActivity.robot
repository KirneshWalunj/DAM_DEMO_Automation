*** Settings ***
Library    SeleniumLibrary
Library    ExcelLibrary
Library   String

Resource    ../../Resources/Fiber/fiberr.robot



*** Keywords ***

Reading Data of Fiber Page from Excel
    ${fibersubnavbarcontent}=    Read Excel Cell    1    1    Sheet4                   #Reading data from sheet4 of excel doc at 1st row & 1st col & storing it in local variable fibersubnabarcontent
    #Log To Console    ${fibersubnavbarcontent}
    ${fibersubnavbarcontent}    String.Split String    ${fibersubnavbarcontent}    ;   #Splitting the data present in excel sheet 4 on the basis of ';' which is stored it in local variable fibersubnabarcontent
    #Log To Console    ${fibersubnavbarcontent}
    Set Global Variable        ${fibersubnavbarcontent}    ${fibersubnavbarcontent}    #Setting local varibale as global variable  
    Close All Excel Documents                                                          #Closing all excel doc

Reading Data of Prepaid Page of Fiber from Excel
    ${fiberprepaidcontent}=    Read Excel Cell    2    1    Sheet4                     #Reading data from sheet4 of excel doc at 2nd row & 1st col & storing it in local variable fiberprepaidcontent
    #Log To Console    ${fiberprepaidcontent}                                                     
    ${fiberprepaidcontent}    String.Split String    ${fiberprepaidcontent}    ;       #Splitting the data present in excel sheet 4 on the basis of ';' which is stored it in local variable fiberprepaidcontent
    #Log To Console    ${fiberprepaidcontent}
    Set Global Variable        ${fiberprepaidcontent}    ${fiberprepaidcontent}        #Setting local varibale as global variable
    Close All Excel Documents                                                          #Closing all excel doc

Verify content of plans cards using the excel file
    ${rowData}=    Read Excel Row    1    0    7    Sheet5                            #Reading data from sheet4 of excel doc at 1st row from col 0 to 7 & storing it in local variable rowData
    ${subscriptionData}=    Read Excel Row    4    0    7    Sheet5                   #Reading data from sheet4 of excel doc at 4nd row from col 0 to 7 & storing it in local variable subscriptionData
    Set Global Variable    ${rowData}    ${rowData}                                   #Setting local varibale as global variable
    Set Global Variable    ${subscriptionData}    ${subscriptionData}                 #Setting local varibale as global variable

    Close All Excel Documents                                                         #Closing all excel doc

   
Reading Data of other plan
    ${otherprepaidplan}=    Read Excel Cell    3    1    Sheet4                    #Reading data from sheet4 of excel doc at 3rd row & 1st col & storing it in local variable otherprepaidplan
    #Log To Console    ${otherprepaidplan}
    ${otherprepaidplan}    String.Split String    ${otherprepaidplan}    ;         #Splitting the data present in excel sheet 4 on the basis of ';' which is stored it in local variable otherprepaidplan
    Set Global Variable        ${otherprepaidplan}    ${otherprepaidplan}          #Setting local varibale as global variable
    Close All Excel Documents                                                      #Closing all excel doc


Reading Data of more info from Excel
    ${moreinfo}=    Read Excel Cell    4    1    Sheet4                            #Reading data from sheet4 of excel doc at 4th row & 1st col & storing it in local variable moreinfo
    #Log To Console     ${moreinfo}
    ${moreinfo}    String.Split String    ${moreinfo}    ;                         #Splitting the data present in excel sheet 4 on the basis of ';' which is stored it in local variable moreinfo
    #Log To Console    ${moreinfo}  
    Set Global Variable    ${moreinfo}      ${moreinfo}                            #Setting local varibale as global variable
    Close All Excel Documents                                                      #Closing all excel doc  


Reading Text from Excel           
    ${TextData}=    Read Excel Cell    7    1    Sheet5                            #Reading data from sheet4 of excel doc at 7th row & 1st col & storing it in local variable TextData                  
    ${TextData}    String.Split String    ${TextData}    ;                         #Splitting the data present in excel sheet 4 on the basis of ';' which is stored it in local variable TextData                               
    Set Global Variable    ${TextData}    ${TextData}                              #Setting local varibale as global variable     
    Close All Excel Documents                                                      #Closing all excel doc