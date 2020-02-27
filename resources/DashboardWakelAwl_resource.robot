*** Settings ***
Library    SeleniumLibrary     
Library    OperatingSystem    
Library    String  
Resource   login_resource.robot

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Wait Until Page Contains Element    id=submit
    Wait For Condition    return jQuery.active == 0
    Input login username    ${username}
    Input login password    ${password}
    Click login btn
    Wait Until Page Contains Element    id=audit
    Wait For Condition    return jQuery.active == 0
    Dashboard should be visible
    
ClickOnAudits
    Click Element    id=audit
    
addNewaudit
    Wait For Condition    return jQuery.active == 0     
    Wait Until Page Contains Element    id=addAudit
    Wait Until Element Is Visible    id=addAudit        
    Wait For Condition    return jQuery.active == 0    
    Click Element    id=addAudit   
    Wait For Condition    return jQuery.active == 0     
    
FillAllAuditFields
    [Arguments]    ${inspectorName}    ${inspectedName}    ${departmentInspector}
    #click on اسم المفتش field
    Wait For Condition    return jQuery.active == 0
    Wait Until Page Contains Element    id=TS_internalAuditcreate-inspectorNameAutoCompelete
    Wait For Condition    return jQuery.active == 0
    #add اسم المفتش
    Input Text    id=TS_internalAuditcreate-inspectorNameAutoCompelete         ${inspectorName} 
    Wait Until Page Contains Element    id=inspector-id-31
    Wait For Condition    return jQuery.active == 0
    Click Element    id=inspector-id-31
    #click on العضو المعنى بتفتيش
    Wait Until Page Contains Element    id=TS_memberLookupAutoComplete.autocomplete
    Wait For Condition    return jQuery.active == 0
    Input Text    id=TS_memberLookupAutoComplete.autocomplete         ${inspectedName}
    #add العضو المعنى بتفتيش
    Wait Until Page Contains Element    id=TS_memberLookupAutoComplete-نوح
    Wait For Condition    return jQuery.active == 0
    Click Element    id=TS_memberLookupAutoComplete-نوح
    #click on وكيل نيابة field
    Wait Until Page Contains Element    id=TS_memberlookup    
    Wait For Condition    return jQuery.active == 0    
    Click Element    id=TS_memberlookup 
    #Add الدرجه
    Wait Until Page Contains Element    id=role   
    Wait For Condition    return jQuery.active == 0
    Select From List By Label    id=role    وكيل نيابة       
    #click on  field
    Wait Until Page Contains Element    id=TS_PREVIOUS_DEPARTMENT
    Wait For Condition    return jQuery.active == 0
    Input Text    id=TS_PREVIOUS_DEPARTMENT         ${departmentInspector} 
    
    Wait Until Page Contains Element    id=TS_PREVIOUS_DEPARTMENT-23
    Wait For Condition    return jQuery.active == 0
    Click Element    id=TS_PREVIOUS_DEPARTMENT-23
    
    Wait Until Page Contains Element    id=auditonlyOneMonth    
    Select Checkbox    id=auditonlyOneMonth
    
    Wait Until Page Contains Element    css=input.md-datepicker-input   
    Wait For Condition    return jQuery.active == 0  
    Click Element    css=input.md-datepicker-input
    Execute Javascript    document.querySelector('[aria-label="February 2019"]').click()
    
    Wait Until Page Contains Element    id=AuditPeriod
    Wait For Condition    return jQuery.active == 0 
    Select From List By Label    id=AuditPeriod     فترة اولى 
    #Click on اضافة رئيس لجنه
    Wait Until Page Contains Element    id=addHeadOFCommittee-id-3   
    Wait For Condition    return jQuery.active == 0  
    Click Element    id=addHeadOFCommittee-id-3
    #ٍselect رامز
    Click Element    id=test-32
    
    Click Element    id=saveButton  
     
    
GetRecordIDFromCurrentURL
    Wait Until Page Contains Element    id=recordsPage   
    ${auditRecordUrl} =  Execute Javascript  return window.location.href;   
    @{parts} =  Split String    ${auditRecordUrl}    /
    [Return]    @{parts}[-2]   

ClickOnrecordsPage
    Wait Until Page Contains Element    id=recordsPage
    Click Element    id=recordsPage 
    
GetCurrentRecordIDFromTable
    Wait Until Page Contains Element    id=auditsInbox        
    Wait Until Page Contains Element    id=AuditIdSpan-0
    Wait For Condition    return jQuery.active == 0
    # Wait For Condition    return angular.element(document.body).injector().get('$http').pendingRequests.length == 0
    # Execute Javascript    window.scrollTo(500, 200)
    # Scroll Element Into View    //*[@id='publishData-0']  
    ${recordID}  Execute Javascript  return document.getElementById("AuditIdSpan-0").innerText 
    [Return]    ${recordID}
    #${rv}    Execute Javascript    return document.evaluate("//*[@id='AuditIdSpan-0']//span", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText
        
CheckTheRecordExistInWakelAwlTafteshInbox
    [Arguments]    ${actualValue}    ${expectedValue}
    Should Be True     """${actualValue}""".strip() == """${expectedValue}""".strip() 
    Log  The record exists
    
CheckThatRecordIsUnpublished
    Wait Until Page Contains Element    id=unpublishData-0    
    Element Should Be Visible    id=unpublishData-0    
    Element Should Not Be Visible    id=publishData-0   
    
 