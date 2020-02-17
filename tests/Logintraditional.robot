*** Settings ***
Library    SeleniumLibrary
#Library        DataDriver    ../DataFiles/new.xlsx    sheet_name=Sheet1
Resource    ../resources/login_resource.robot
Suite Setup    Open my Browser
Suite Teardown    Close browsers
Test Template    HappyLogin

*** Test Cases ***                                   username   	password
Right username Right password wakel awl	            01221111151	    667037
Right username Right password res nyaba 	        01203335246	    525440
Right username Right password moftsh 	            01222333331	    161186
Right username Right password res lagnet taftesh 	01222111118 	388120
    
*** Keywords ***
HappyLogin
    [Arguments]    ${username}    ${password}
    Wait Until Page Contains Element    id=submit
    Wait For Condition    return jQuery.active == 0
    Input login username    ${username}
    Input login password    ${password}
    Click login btn
    Wait Until Page Contains Element    id=audit
    Wait For Condition    return jQuery.active == 0
    #Wait Until Page Contains Element    xpath=//div[@id='userRole' and text()= "${rolename}"]
    Dashboard should be visible
    Click logout btn 