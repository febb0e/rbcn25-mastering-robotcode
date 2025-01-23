*** Settings ***
Documentation       Example resource file


*** Keywords ***
Log ${Str} To Console
    [Documentation]    Logs a string to console
    [Arguments]    ${str}
    Log To Console    ${str}
