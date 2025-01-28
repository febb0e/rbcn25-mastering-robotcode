*** Settings ***
Documentation       Example browser tests

Library             Browser

Test Teardown       Close Browser


*** Variables ***
${BROWSER}=         chromium
${HEADLESS}=        False
${WEB_APP_URL}=     localhost
${PORT}=            3000

${TODO_INPUT}=      input[id="todo-input"]
${ADD_BUTTON}=      button[id="add-todo-button"]
${TODO_ID}=         ${0}


*** Test Cases ***
Check App Title Test Environment
    [Documentation]    Verifies the app title for the test environment
    VAR    ${PORT}=    3000    scope=SUITE    # noqa
    Open Todo App
    Check App Title    Test: Todo App

Check App Title Development Environment
    [Documentation]    Verifies the app title for the test environment
    VAR    ${PORT}=    3001    scope=SUITE    # noqa
    Open Todo App
    Check App Title    Development: Todo App

Check Test Environment Header
    [Documentation]    Checks if the web app is in the test environment
    VAR    ${PORT}=    3000    scope=SUITE    # noqa
    Open Todo App
    Check Header Environment    Test Environment

Check Development Environment Header
    [Documentation]    Checks if the web app is in the development environment
    VAR    ${PORT}=    3001    scope=SUITE    # noqa
    Open Todo App
    Check Header Environment    Development Environment

Check Test Environment Color
    [Documentation]    Checks the color of the header in test environment
    VAR    ${PORT}=    3000    scope=SUITE    # noqa
    Open Todo App
    Check Header Color    bg-red-400

Check Development Environment Color
    [Documentation]    Checks the color of the header in development environment
    VAR    ${PORT}=    3001    scope=SUITE    # noqa
    Open Todo App
    Check Header Color    bg-blue-400

Verify Url Navigation
    [Documentation]    Verifies the functionality of the url navigation
    Open Todo App
    Verify Url Ends With    todo
    Click    a[href="#/done"]
    Wait Until Keyword Succeeds    5s    500ms    Verify Url Ends With    done

Add And Delete Single Todo
    [Documentation]    Tests the creation and deletion of a single todo in the app
    VAR    @{todos}    Hold Robocon Workshop
    Open Todo App
    Add Todos To List              @{todos}
    Verify Todos Exist             @{todos}
    Mark Todos As Done             @{todos}
    Verify Todos Are Done          @{todos}
    Delete Done Elements           @{todos}
    Verify Elements Are Deleted    @{todos}

Add And Delete Multiple Todos
    [Documentation]    Tests the creation and deletion of multiple todos in the app
    VAR    @{todos}    Charge Laptop
    ...    Install VSCode
    ...    Get To Know Robotcode
    ...    Develop Testautomation
    ...    Visit Sauna
    ...    Get Some Beers
    Open Todo App
    Add Todos To List              @{todos}
    Verify Todos Exist             @{todos}
    Mark Todos As Done             @{todos}
    Verify Todos Are Done          @{todos}
    Delete Done Elements           @{todos}
    Verify Elements Are Deleted    @{todos}


*** Keywords ***
Open Todo App
    [Documentation]    Opens the webapp on localhost
    New Browser    ${BROWSER}    ${HEADLESS}
    New Page    ${WEB_APP_URL}:${PORT}
    Wait For Load State

Check App Title
    [Documentation]    Checks the app title against the expected value
    [Arguments]    ${expected_title}
    ${current_title}    Get Title
    Should Be Equal    ${expected_title}    ${current_title}

Check Header Environment
    [Documentation]    Checks the app header against the expected value
    [Arguments]    ${expected_env}
    ${current_env}    Get Text    //div[@id="environment"]
    Should Be Equal    ${expected_env}    ${current_env}

Check Header Color
    [Documentation]    Checks the app header color against the expected value
    [Arguments]    ${expected_color}
    ${class}    Get Attribute    //div[@id="environment"]    class
    Should Contain    ${class}    ${expected_color}

Verify Url Ends With
    [Documentation]    Checks the apps last url path against the expected path
    [Arguments]    ${expected_path}
    ${current_url}    Get Url
    VAR    ${current_path}=    ${current_url.split('/')[-1]}
    Should Be Equal    ${current_path}    ${expected_path}

Add Todos To List
    [Documentation]    Adds a list of todos
    [Arguments]    @{todos}
    FOR    ${todo}    IN    @{todos}
        Type Text    ${TODO_INPUT}    ${todo}
        Click    ${ADD_BUTTON}
        VAR    ${TODO_ID}    ${${TODO_ID} + 1}    scope=SUITE    # noqa
    END

Verify Todos Exist
    [Documentation]    Verifies a list of todos exist
    [Arguments]    @{todos}
    Take Screenshot
    VAR    ${id}    ${1}
    FOR    ${todo}    IN    @{todos}
        ${todo_text}    Get Text    //div[@id="${id}"]//span
        Should Be Equal    ${todo_text}    ${todo}
        VAR    ${id}    ${id + 1}
    END

Mark Todos As Done
    [Documentation]    Marks a list of todos as done
    [Arguments]    @{todos}
    VAR    ${id}    ${1}
    FOR    ${todo}    IN    @{todos}    # noqa
        Click    //div[@id="${id}"]//button[@id="done-todo-button"]
        VAR    ${id}    ${id + 1}
    END

Verify Todos Are Done
    [Documentation]    Verifies a list of todos are done
    [Arguments]    @{todos}
    Click    a[href="#/done"]
    Take Screenshot
    VAR    ${id}    ${1}
    FOR    ${todo}    IN    @{todos}
        ${done_text}    Get Text    //div[@id="${id}"]//span
        Should Be Equal    ${done_text}    ${todo}
        VAR    ${id}    ${id + 1}
    END

Delete Done Elements
    [Documentation]    Deletes a list of done elements
    [Arguments]    @{todos}
    VAR    ${id}    ${1}
    FOR    ${todo}    IN    @{todos}    # noqa
        Click    //div[@id="${id}"]//button[@id="done-todo-button"]
        VAR    ${id}    ${id + 1}
    END

Verify Elements Are Deleted
    [Documentation]    Verifies all elements are deleted
    [Arguments]    @{todos}
    Take Screenshot
    VAR    ${id}    ${1}
    FOR    ${todo}    IN    @{todos}    # noqa
        Get Element Count    //div[@id="${id}"]    ==    0
        VAR    ${id}    ${id + 1}
    END
