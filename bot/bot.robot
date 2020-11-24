*** Settings ***

Documentation  This is bot main file
Resource  ../config.robot

Suite Setup  Preconditions
Suite Teardown  Send Results

Test Teardown  Close All Browsers

*** Keywords ***

Preconditions
    ${data}=  Read Excel File  TA - RPA Challenge Shopping List.xlsx
    Set Suite Variable  ${data}
    @{heading}=  Create List  Item  Price  Link to cheapest offer
    @{rows}=  Create List
    Append To List  ${rows}  ${heading}
    Set Suite Variable  ${rows}

Send Results
    Log To Console  ${rows}
    Create Excel File  ${rows}  result.xlsx
    Gmail Authorize
    Send Email
    ...  Task Results
    ...  This is an email with attached excel file for all items
    ...  result.xlsx

Search Data
    [Arguments]  ${text}
    Open Browser on Page  ${HOME_URL}
    main_page.Verify Page Loaded
    main_page.Start Search  ${text}
    search_results_page.Verify Page Loaded
    search_results_page.Select Sorting Item  Price: Low to High
    ${link}=  search_results_page.Get Link of Cheapest Item
    ${price}=  search_results_page.Get Price of Cheapest Item
    @{row}=  Create List  ${text}  ${price}  ${link}
    Append To List  ${rows}  ${row}

*** Test Cases ***

Search Results
    [Template]  Search Data
    FOR  ${item}  IN   @{data}
      ${item}[Item]
    END
