*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/DashboardWakelAwl_resource.robot
Suite Setup    Open my Browser

*** Test Cases ***
workflowscenario
    WakelAwlLogin    01221111151    667037
    ClickOnAudit
    addNewaudit
    FillAllAuditFields