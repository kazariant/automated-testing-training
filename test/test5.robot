*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String

*** Variables ***
${name}    John Doe
${age}    30
@{fruits}      Banana    Orange    Pineapple     Raspberry    Papaya     Fig
@{my_fruits}    Kiwi    Raspberry    Apple    Peach     Grapes     Apricote
&{person}    name=John    age=30    city=New York
@{alphabet}     a    b    c    d    e    f    g    h    i    j    k    l    m    n    o    p    q    s    t    v    x    y    z
${i}    0
&{fruits_colour}    Kiwi=green    Raspberry=red    Apple=green    Peach=orange     Grapes=green     Apricote=yellow    Banana=yellow    Orange=orange     Pineapple=green

*** Test Cases ***
21 Test
    [Documentation]
    ...    get fruits with letter ´e´
    ${fruits_with_e}    Create List
    Test Keyword for 21 Test    ${fruits_with_e}

22 Test
    [Documentation]
    ...    add 5 fruits to the list
        ${i}    Convert To Integer    ${i}
        Test Keyword for 22 Test    ${i}

23 Test
    ${abc}     Create List
    Test Keyword for 23 Test    ${abc}    t

24 Test
    [Documentation]
    ...    get fruits with letter ´e´
    ${fruits_with_e}    Create List
    Test Keyword for 24 Test    ${fruits_with_e}    ${fruits}

25 Test
    [Documentation]
    ...    get green fruits
     ${fruits_green}    Create List
     Test Keyword for 25 Test    ${fruits_green}

26 Test
    ${green}     Create List
    ${colour}    Split String To Characters      ${i}
    ${status}    Run Keyword And Return Status      Should Contain     ${colour}    green
    WHILE    '${status}' == 'True'
        Append To List     ${green}      ${i}
    END
    Log To Console    ${green}

*** Keywords ***
Test Keyword for 21 Test
    [Documentation]
    ...    get fruits with letter ´e´
    [Arguments]    ${fruits_with_e}
    FOR     ${index}     ${item}    IN ENUMERATE     @{my_fruits}
       ${status}     Run Keyword And Return Status     Should Contain    ${item}    e
       Run Keyword If    '${status}' == 'True'    Append To List     ${fruits_with_e}      ${item}
    END
       Log To Console    ${fruits_with_e}

Test Keyword for 22 Test
    [Documentation]
    ...    keyword description
    [Arguments]    ${i}
    FOR    ${item}    IN      @{my_fruits}
        Exit For Loop If      ${i} == 5
        Append To List     ${fruits}     ${item}
        ${i}    Evaluate    ${i}+1
    END
    Log To Console    ${fruits}

Test Keyword for 23 Test
    [Documentation]
    ...    alphabet
    [Arguments]    ${abc}     ${x}=default
    ${index}    Get Index From List    ${alphabet}    q
    WHILE    '${i}' != '${index}'
        Append To List     ${abc}     ${alphabet}[${i}]
        ${i}     Evaluate    ${i}+1
    END
    Log To Console     ${abc}
    Log To Console    ${x}

Test Keyword for 24 Test
    [Documentation]
    ...    get fruits with letter ´e´
    [Arguments]    ${fruits_with_e}    ${fruits}
    FOR     ${index}     ${item}    IN ENUMERATE     @{fruits}
       ${characters}    Split String To Characters    ${item}
       ${status}     Run Keyword And Return Status     Should Contain    ${characters}    e
       Run Keyword If    '${status}' == 'True'    Append To List     ${fruits_with_e}      ${item}
    END
       Log To Console    ${fruits_with_e}

Test Keyword for 25 Test
    [Documentation]
    ...    get green fruits
    [Arguments]     ${fruits_green}    ${colour}
    FOR     ${index}     ${item}    IN ENUMERATE     &{fruits_colour}
       ${colour}    Split String To Characters      ${item}
       ${status}     Run Keyword And Return Status     Should Contain    ${colour}    green
       Run Keyword If    '${status}' == 'True'    Append To List     ${fruits_green}       ${item}
     END
       Log To Console    ${fruits_green}

