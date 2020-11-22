*** Settings ***

Documentation  This is page with search results

*** Variables ***

${search_results_page.sort_select}  name=s
${search_results_page.price}  xpath=//span[@class='a-price']
${search_results_page.item_link}  ${search_results_page.price}/..
${search_results_page.item_price_symbol}  ${search_results_page.price}//span[@class='a-price-symbol']
${search_results_page.item_price_whole}  ${search_results_page.price}//span[@class='a-price-whole']
${search_results_page.item_price_fraction}  ${search_results_page.price}//span[@class='a-price-fraction']

${search_results_page.verify_text}  Department

*** Keywords ***

Select Sorting Item
    [Documentation]  Values:
    ...  - Featured
    ...  - Price: Low to High
    ...  - Price: High to Low
    ...  - Avg. Customer Review
    ...  - Newest Arrivals
    [Arguments]  ${value}
    Select From List By Label  ${search_results_page.sort_select}  ${value}

Get Link of Cheapest Item
    [Documentation]  Returns link for top item
    Wait Until Page Contains Element  ${search_results_page.price}
    ${link}=  Get Element Attribute  ${search_results_page.item_link}  href
    [Return]  ${link}

Get Price of Cheapest Item
    [Documentation]  Returns price for top item in search
    Wait Until Page Contains Element  ${search_results_page.price}
    ${symbol}=  Get Text  ${search_results_page.item_price_symbol}
    ${whole}=  Get Text  ${search_results_page.item_price_whole}
    ${fraction}=  Get Text  ${search_results_page.item_price_fraction}
    [Return]  ${symbol}${whole}.${fraction}

Verify Page Loaded
    [Documentation]  Verify page contains text
    Wait Until Page Contains  ${main_page.verify_text}
