*** Settings ***

Documentation  This is main page of amazon.com

*** Variables ***

${main_page.verify_text}  Amazon.com
${main_page.search_bar}  id=twotabsearchtextbox
${main_page.go_search}  xpath=//input[@value='Go']

*** Keywords ***

Start Search
    [Arguments]  ${text}
    Input Text  ${main_page.search_bar}  ${text}
    Click Element  ${main_page.go_search}

Verify Page Loaded
    [Documentation]  Verify page contains text
    Wait Until Page Contains  ${main_page.verify_text}
