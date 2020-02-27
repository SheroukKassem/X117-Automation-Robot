*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${URLlocal}    http://127.0.0.1:8080/index.html?#/
${browser}    chrome

*** Keywords ***
Open my Browser
    Open Browser    ${URLlocal}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    0.25s
    
Close browsers
    Close All Browsers
    
Input login username
    [Arguments]    ${username}
    Input Text    id=phoneNumber    ${username}
    
Input login password
    [Arguments]    ${password}
    Input Password    id=password    ${password}
    
Click login btn
    Click Button    id=submit
    
Click logout btn
    Click Element    id=user_info
    Wait For Condition    return jQuery.active == 0
    Click Element    id=logout
    
Dashboard should be visible
    Page Should Contain Element    id=audit      
   
Assert on login for all users
    [Arguments]    ${Role}
    Element Text Should Be    id=userRole    ${Role}         