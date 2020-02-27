*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem    
Library    String    
Resource    ../resources/DashboardWakelAwl_resource.robot
Suite Setup    Open my Browser
Test Teardown    Close All Browsers

*** Variables ***
${username}    01221111151
${password}    667037
#UsersData
${inspectorName}    مهند أحمد
${inspectedName}    نوح
${departmentInspector}    وسط القاهرة الكلية

${inspectorNameLocator}    id=inspectorName-0 
${inspectedNameLocator}    id=inspectedName-0 
${departmentInspectorLocator}    id=departmentInspector-0

*** Test Cases ***
CreateAudit
    LoginAsWakelAwlTaftesh
    ClickOnAudits
    addNewaudit
    ${ID} =  FillAllAuditFields    ${inspectorName}    ${inspectedName}    ${departmentInspector}
    ${ActualRecordID}  GetRecordIDFromCurrentURL
    ClickOnrecordsPage
    ${expectedRecordID}  GetCurrentRecordIDFromTable
    CheckTheRecordExistInWakelAwlTafteshInbox    ${ActualRecordID}    ${expectedRecordID}
    CheckThatRecordIsUnpublished
    Click logout btn
    CheckThatAllUsersCanNotSeeTheRecord    ${ActualRecordID}   
   
    
*** Keywords ***
CheckThatAllUsersCanNotSeeTheRecord
    [Arguments]    ${actualValue}
    ${File}=    Get File    ${EXECDIR}\\DataFiles\\UsersData.txt
    @{list}=    Split to lines  ${File}
    :FOR    ${line}     IN      @{list}
    \    @{words} =  Split String    ${line}
    \    Login    @{words}[0]    @{words}[1]
    \    ClickOnAudits
    \    Wait Until Page Contains Element    id=inspectorName-0  
    \    ${expectedValue}  GetCurrentRecordIDFromTable
    \    Should Not Be True    """${actualValue}""".strip() == """${expectedValue}""".strip()       
    \    Click logout btn
    

LoginAsWakelAwlTaftesh
    Login    ${username}    ${password}
