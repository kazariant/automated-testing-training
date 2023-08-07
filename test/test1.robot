*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String
Resource        GlobalKeywords.robot

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
    gk.OpenBrowserYandex

3 Test
    [Documentation]
    ...    German Shepherd Click ENTER
    [Tags]    testcase    automation    chrome    yandex   translate   chrome
    gk.OpenBrowserGoogleChrome

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
