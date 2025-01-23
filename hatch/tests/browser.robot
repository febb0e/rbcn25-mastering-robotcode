*** Settings ***
Documentation       Example browser tests

Library             Browser


*** Variables ***
${USERNAME_INPUT}=      input[name="username"]
${PASSWORD_INPUT}=      input[name="password"]
${LOGIN_BUTTON}=        input[type="submit"]


*** Test Cases ***
Test Login
    [Documentation]    Test the login of the example web app
    Open Webapp
    Login With Credentials
    Verify Login Success


*** Keywords ***
Open Webapp
    [Documentation]    Opens the webapp with specified port
    [Arguments]    ${port}=5000
    New Browser    chromium    headless=False
    New Page    127.0.0.1:${port}

Login With Credentials
    [Documentation]    Logs in user with username and password
    [Arguments]    ${username}=admin    ${password}=admin
    Type Text    ${USERNAME_INPUT}    ${username}
    Type Text    ${PASSWORD_INPUT}    ${password}
    Click    ${LOGIN_BUTTON}

Verify Login Success
    [Documentation]    Verifies successfull login
    ${LoginText}=    Get Text    h1
    Should Be Equal    ${LoginText}    Login was successfull!
