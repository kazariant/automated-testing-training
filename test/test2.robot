*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String

*** Variables ***
${url}    https://www.google.com/
${browser}    chrome


*** Test Cases ***
5 Test
     [Documentation]
    ...    hello, world
    [Tags]    yandex   translate   chrome
    Open Browser    https://translate.yandex.com/en/   ${browser}
    Maximize Browser Window
    Input Text    xpath:/html/body/div[1]/main/div[1]/div[1]/div[3]/div[1]/div/div[1]/div[1]/div    hello, world
    sleep    7s
    Click Button    xpath:/html/body/div[1]/main/div[1]/div[1]/div[1]/div/div/div/button[2]
    sleep    5s
    Close Browser

6 Test
    Open Browser   https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html  ${browser}
    Input Text    xpath:/html/body/div[2]/div[1]/div/div/div[1]/input    Select Checkbox
    Click Link    xpath:/html/body/div[2]/div[1]/div/div/ul/li[21]/a
    Sleep    10s
