*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String

*** Variables ***
${url}    https://www.google.com/
${browser}    chrome
${x}     0
${y}     0

*** Test Cases ***
27 Test
    [Documentation]
    ...    Morse code
    [Tags]    google    Morse code    wikipedia
    Open Browser    https://ru.wikipedia.org/wiki/%D0%97%D0%B0%D0%B3%D0%BB%D0%B0%D0%B2%D0%BD%D0%B0%D1%8F_%D1%81%D1%82%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D0%B0     ${browser}
    Maximize Browser Window
    Page Should Contain Element    //*[@id="searchInput"]
    Input Text    //*[@id="searchInput"]     азбука морзе
    Page Should Contain Element    //*[@id="searchButton"]
    Click Button    //*[@id="searchButton"]
    Sleep    2s
    ${Morse}    Create Dictionary
    FOR    ${list}    IN RANGE    1    33
        ${letter}    Get Text     //*[@id="mw-content-text"]/div[1]/table[1]/tbody[1]/tr[${list}]/td[1]
        ${value}    Get Text     //*[@id="mw-content-text"]/div[1]/table[1]/tbody[1]/tr[${list}]/td[4]
        Set To Dictionary     ${Morse}     ${letter}=${value}
    END
    Log Many    ${Morse}

28 Test
        [Documentation]
        ...    Onliner
        [Tags]    google    onliner    smartphone
        Open Browser    https://catalog.onliner.by/    ${browser}
        Maximize Browser Window
        Click Element    //*[@id="container"]/div/div/div/div/div[1]/ul/li[3]/span[2]
        Click Element    //*[@id="container"]/div/div/div/div/div[1]/div[4]/div/div[2]/div[1]/div/div[1]/div[1]
        Wait Until Element Is Visible    //*[@id="container"]/div/div/div/div/div[1]/div[4]/div/div[2]/div[1]/div/div[1]/div[2]/div/a[1]
        Click Element    //*[@id="container"]/div/div/div/div/div[1]/div[4]/div/div[2]/div[1]/div/div[1]/div[2]/div/a[1]
#        Page Should Contain Checkbox     //*[@id="schema-filter"]/div[5]/div[4]/div[2]/ul/li[1]/label/span[1]/input
#        Scroll Element Into View    //*[@id="schema-filter"]/div[5]/div[5]/div[1]
        Wait Until Element Is Visible      //*[@id="schema-products"]/div[2]/div/div[3]/div[2]/div[1]
        ${firstfive}    Create Dictionary
        FOR    ${list1}     IN RANGE    1    6
            ${phone1}     Get Text     //*[@id="schema-products"]/div[2]/div/div[3]/div[2]/div[1]
            ${price1}     Get Text     //*[@id="schema-products"]/div[2]/div/div[3]/div[1]/div/div/div/div[1]
        Set To Dictionary   ${firstfive}      ${phone1}=${price1}(:-3)
        END
        ${price1}    Split String To Characters    ${price1}
        Convert To String    ${price1}(:-3)
        ${secondfive}    Create Dictionary
        FOR    ${list2}     IN RANGE    6     11
            ${phone2}    Get Text    //*[@id="schema-products"]/div[2]/div/div[3]/div[2]/div[1]
            ${price2}    Get Text    //*[@id="schema-products"]/div[2]/div/div[3]/div[1]/div/div/div/div[1]
        Set To Dictionary   ${secondfive}      ${phone2}=${price2}(:-3)
        END
        ${price2}    Split String To Characters    ${price2}
        Convert To String    ${price2}(:-3)
        Log    ${price1}