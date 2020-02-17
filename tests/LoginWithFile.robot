*** Settings ***
Library    SeleniumLibrary
Library        DataDriver
...            file=../DataFiles/loginData.csv
...            encoding=utf_8
Resource    ../resources/login_resource.robot

Suite Setup    Open my Browser
Suite Teardown    Close browsers
Test Template    HappyLogin

*** Test Cases ***
LoginTest with username ${username} password ${password} for Role ${Role}    0    0    0

*** Keywords ***
HappyLogin
    [Arguments]    ${username}    ${password}    ${Role}
    Wait Until Page Contains Element    id=submit
    Wait For Condition    return jQuery.active == 0
    Input login username    ${username}
    Input login password    ${password}
    Click login btn
    Wait Until Page Contains Element    id=audit
    Wait For Condition    return jQuery.active == 0
    #Wait Until Page Contains Element    xpath=//div[@id='userRole' and text()= "${rolename}"]
    Assert on login for all users   ${Role}
    Click logout btn