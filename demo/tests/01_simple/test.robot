*** Settings ***
Documentation       Example test suite

Library             demo.mylib
Resource            demo/myrsc.resource


*** Test Cases ***
Test Print
    [Documentation]    Print from mylib.py
    Print Something

Test Return
    [Documentation]    Print from mylib.py
    ${str}    Return Something
    Log    ${str}

Test Resource
    [Documentation]    Print from myrsc.resource
    Log Str To Console    Hello from Resource
