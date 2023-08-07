*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String

*** Keywords ***
gk.OpenBrowserGoogleChrome
    Open Browser    https://google.com/    ${browser}
    Maximize Browser Window
    Input Text    xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/textarea     german shepherd
    Press Keys	  xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/textarea     ENTER
    sleep    9s
    Close Browser

gk.OpenBrowserYandex
    Open Browser    https://yandex.com/    ${browser}
    Maximize Browser Window
    Input Text    id:text    weather Minsk
    Click Button    xpath:/html/body/main/div[2]/form/div[2]/button
    sleep    7s
    Close Browser