*** Settings ***

Documentation  This file represents all available pages
...  Require here all pages that you add to folder
...  Also it contains top level UI keywords

Resource  main_page.robot
Resource  search_results_page.robot

*** Keywords ***

Open Browser on Page
    [Arguments]  ${url}
    Open Available Browser    ${url}
