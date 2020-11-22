*** Settings ***

Documentation  All Excel Keywords

*** Keywords ***

Read Excel File
    [Arguments]  ${file}
    Open workbook  ${file}
    ${worksheet}=  Read worksheet  header=${TRUE}
    [Return]  ${worksheet}
    [Teardown]  Close workbook

Create Excel File
    [Arguments]  ${rows}  ${file}
    Create Workbook  ${file}
    Append Rows to Worksheet  ${rows}
    Save Workbook
