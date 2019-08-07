*** Settings ***
Library                             XvfbRobot
Library                             SeleniumLibrary
Library                             String
Resource                            ../${set}

*** Variables ***
${createGroup}           //*[@id="app-container"]/div/div/nav/div[2]/ul/a[1]/li/div/span
${name}                  //input[@name="name"]
${EmailOrganizer}        //input[@name="organizerEmail"]
${costInput}             //input[@name="costs[0].amount"]
${SendBnt}               //button[@name="button"]
${MerchanName}           //div[@class="dropdown merchant-selector"]/button/span
${FirstGroup}            //table[@class="data-table table"]/tbody/tr/td[4]
${FirstGroupCode}        //table[@class="data-table table"]/tbody/tr/td[1]/a
${allowMultiPayments}    //input[@name="allowMultiPayments"]
${addPaymentBtn}         //button[@class="btn btn-secondary"]
${costType}              //select[@name="costType"]
*** Keywords ***
Create Group 
    [Arguments]                     ${organizer}                ${groupName}     ${cost}
    Click Element                   xpath:${createGroup}
    Input Text                      xpath:${EmailOrganizer}     ${organizer}  
    Input Text                      xpath:${name}               ${groupName}
    Input Text                      xpath:${costInput}          ${cost}
    Select From List By Value       xpath=${costType}           total
    Click Element                   xpath:${SendBnt}
    Sleep                           3 second

Get merchan name
    Sleep                           3 second
    [Return]                        Get Text                    ${MerchanName}

Get group name
    Sleep                           3 second
    [Return]                        Get Text                    ${FirstGroup}

Get group code
    Sleep                           3 second
    ${code}=                        Get Text                    ${FirstGroupCode}
    [Return]                        ${code}

Click on allow multipaymentss
    Click Element                   xpath:${allowMultiPayments}

Click on add payment  
    Click Element                   xpath:${addPaymentBtn}