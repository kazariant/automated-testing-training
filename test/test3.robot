*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String
#Variables       GlobalVar.robot

*** Variables ***
${name}    John Doe
${age}    30
@{fruits}    Apple    Banana    Orange
&{person}    name=John    age=30    city=New York

*** Test Cases ***
7 Test
    ${favorite}     Create List
    Log       ${favorite}

8 Test
    Set Test Variable    ${favorite}    ["Life is Beautiful", "Léon: The Professional", "The Chorus", "Ayla: The Daughter of War", "Capernaum"]
    Log    ${favorite}

9 Test
    Append To List      ${fruits}     Mango    Pineapple    Kiwi
    Log   ${fruits}

10 Test
    Set Test Variable    ${name}    Tamara
    Log    ${name}

11 Test
    Set Test Variable    ${age}     28
    Log    ${age}

12 Test
    Set To Dictionary    ${person}     surname=Simpson
    Log    ${person}

13 Test
    Remove From Dictionary    ${person}    name
    Log    ${person}

14 Test
    Set Test Variable    &{person}    name=Tamara    age=28    city=Minsk
