*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String

*** Variables ***
${url}    https://translate.yandex.com/en/
${browser}    chrome
${email}     ktamara@kortext.com
${password}    FunTest345

*** Test Cases ***
1 Test
    [Documentation]
    ...    Open Browser
    [Tags]    yandex   translate   chrome
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    sleep    5s
    Close Browser

2 Test
    [Documentation]
    ...    weather Minsk
    [Tags]    testcase    automation    chrome    yandex   weather  chrome
    Open Browser    https://yandex.com/    ${browser}
    Maximize Browser Window
    Input Text    id:text    weather Minsk
    Click Button    xpath:/html/body/main/div[2]/form/div[2]/button
    sleep    7s
    Close Browser

3 Test
    [Documentation]
    ...    German Shepherd Click ENTER
    [Tags]    testcase    automation    chrome    yandex   translate   chrome
    Open Browser    https://google.com/    ${browser}
    Maximize Browser Window
    Input Text    xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/textarea     german shepherd
    Press Keys	  xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/textarea     ENTER
    Click Link    xpath:/html/body/div[6]/div/div[5]/div/div/div[1]/div[1]/div/a[1]
    sleep    20s
    Close Browser

4 Test
     [Documentation]
    ...    Kortext Click Back
    Open Browser    https://www.kortext.com/    ${browser}
#    Maximize Browser Window
    Click Link    xpath:/html/body/div[1]/div[1]/div[1]/nav/div/div[2]/ul/li[3]/a
    Execute Javascript     history.back()
    sleep    20s
    Close Browser










*** Keywords ***
