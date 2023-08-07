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
&{person}    name=John    age=30    city=New York
@{alphabet}     a    b    c    d    e    f    g    h    i    j    k    l    m    n    o    p    o
${i}    0


*** Test Cases ***
15 Test
    FOR     ${item}     IN     @{fruits}
        Log To Console      ${item}
    END

16 Test
    FOR     ${item}     IN RANGE    0    10
        Log To Console    ${fruits}[${item}]
    END

17 Test
    FOR      ${index}    ${item}     IN ENUMERATE    @{fruits}
        Log To Console    ${item} is number ${index}
    END

18 Test
    ${status}    Run Keyword And Return Status     List Should Contain Value    ${fruits}     Pineapple
    IF    ${status} == True
        Log To Console     Pineapple
    ELSE IF    ${status} == False
        Log To Console     No Pineapple
    ELSE
        Log To Console    We do not have pineapples.
    END

19 Test
    @{my_fruits}    Create List     Kiwi    Mango    Apple    Peach     Grapes     Apricote
    FOR     ${index}    ${item}    IN      @{my_fruits}
        IF    '${index}' != '5'
            Append To List     ${fruits}     ${item}
        END
    END
    Log To Console    ${fruits}

20 Test
    ${alphabet}     Create List    a    b    c    d    e    f    g    h    i    j    k    l    m    n    o    p
    FOR      ${item}      IN     @{alphabet}
        Should Contain      a
    ELSE
        Log To Console    Try more...
    END

