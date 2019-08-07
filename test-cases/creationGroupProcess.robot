*** Settings ***
Suite Setup                         Preparation
Library                             SeleniumLibrary
Resource                            ../resources/helpers/login.robot
Resource                            ../resources/pages/bussinesPage.robot

*** Variables ***
${nameGroup}                        Test to test 
${costGroup}                        560000

*** Test Cases ***
# Create a group
#     [Documentation]                 User should be able to create a new group
#     Create Group                    ${organizer_email}          ${nameGroup}        ${costGroup}
#     Should Be Equal                 Get group name              ${nameGroup}

Claim group
    ${group}                        Get group code        
    Go to                           ${claim_page}${group}

*** Keywords ***
Preparation
    Star Browser                    ${business_page}              
    Login Business Page       