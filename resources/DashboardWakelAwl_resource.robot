*** Settings ***
Library    SeleniumLibrary    
Resource   login_resource.robot

*** Variables ***
${x}    0
*** Keywords ***
WakelAwlLogin
    [Arguments]    ${username}    ${password}
    Wait Until Page Contains Element    id=submit
    Wait For Condition    return jQuery.active == 0
    Input login username    ${username}
    Input login password    ${password}
    Click login btn
    Wait Until Page Contains Element    id=audit
    Wait For Condition    return jQuery.active == 0
    Dashboard should be visible
ClickOnAudit
    Click Element    id=audit
    
addNewaudit
    Wait For Condition    return jQuery.active == 0     
    Wait Until Page Contains Element    id=addAudit    
    Wait For Condition    return jQuery.active == 0    
    Click Element    id=addAudit   
    Wait For Condition    return jQuery.active == 0     
    
FillAllAuditFields
    #clickOn اسم المفتش field
    Wait For Condition    return jQuery.active == 0
    Wait Until Page Contains Element    id=TS_internalAuditcreate-inspectorNameAutoCompelete
    Wait For Condition    return jQuery.active == 0
    Input Text    id=TS_internalAuditcreate-inspectorNameAutoCompelete         مهند أحمد 
    
    #addit
    Wait Until Page Contains Element    id=inspector-id-31
    Wait For Condition    return jQuery.active == 0
    Click Element    id=inspector-id-31
    #addالعضو المعنى بتفتيش
    Wait Until Page Contains Element    id=TS_memberLookupAutoComplete.autocomplete
    Wait For Condition    return jQuery.active == 0
    Input Text    id=TS_memberLookupAutoComplete.autocomplete          نوح
    
    Wait Until Page Contains Element    id=TS_memberLookupAutoComplete-نوح
    Wait For Condition    return jQuery.active == 0
    Click Element    id=TS_memberLookupAutoComplete-نوح
    
    Wait Until Page Contains Element    id=TS_memberlookup    
    Wait For Condition    return jQuery.active == 0    
    Click Element    id=TS_memberlookup 
    
    Wait Until Page Contains Element    id=role   
    Wait For Condition    return jQuery.active == 0
    Select From List By Label    id=role    وكيل نيابة       
    
    Wait Until Page Contains Element    id=TS_PREVIOUS_DEPARTMENT
    Wait For Condition    return jQuery.active == 0
    Input Text    id=TS_PREVIOUS_DEPARTMENT         وسط القاهرة الكلية 
    
    Wait Until Page Contains Element    id=TS_PREVIOUS_DEPARTMENT-23
    Wait For Condition    return jQuery.active == 0
    Click Element    id=TS_PREVIOUS_DEPARTMENT-23
    
    Wait Until Page Contains Element    id=auditonlyOneMonth    
    Select Checkbox    id=auditonlyOneMonth
    
    Wait Until Page Contains Element    css=input.md-datepicker-input   
    Wait For Condition    return jQuery.active == 0  
    Click Element    css=input.md-datepicker-input 
        