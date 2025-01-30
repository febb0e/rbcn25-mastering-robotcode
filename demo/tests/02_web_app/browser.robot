*** Settings ***
Documentation       Example browser tests

Library             Browser
Resource            example/config/webapp.resource
Resource            example/browser/todo_app.resource

Test Setup          New Page    ${WEB_APP_URL}:${PORT}


*** Test Cases ***
Check App Title
    [Documentation]    Verifies the app title of the environment
    [Tags]    title
    Get Title    ==    ${APP_TITLE}

Check Header Content
    [Documentation]    Checks if the header content corresponds to the environment
    [Tags]    header
    Get Text    //div[@id="environment"]    ==    ${APP_HEADER}

Check Header Color
    [Documentation]    Checks the color of the header depending on the environment
    [Tags]    color
    Get Attribute    //div[@id="environment"]    class    contains    ${APP_COLOR}

Verify Url Navigation
    [Documentation]    Verifies the functionality of the url navigation
    [Tags]    functional
    Wait Until Keyword Succeeds    5s    500ms    Verify Url Ends With    todo
    Click    a[href="#/done"]
    Wait Until Keyword Succeeds    5s    500ms    Verify Url Ends With    done

Add And Delete Single Todo
    [Documentation]    Tests the creation and deletion of a single todo in the app
    [Tags]    regression
    VAR    @{todos}    Hold Robocon Workshop
    Add Todos To List    @{todos}
    Verify Todos Exist    @{todos}
    Mark Todos As Done    @{todos}
    Verify Todos Are Done    @{todos}
    Delete Done Elements    @{todos}
    Verify Elements Are Deleted    @{todos}

Add And Delete Multiple Todos
    [Documentation]    Tests the creation and deletion of multiple todos in the app
    [Tags]    regression
    VAR    @{todos}    Charge Laptop
    ...    Install VSCode
    ...    Get To Know Robotcode
    ...    Develop Testautomation
    ...    Visit Sauna
    ...    Get Some Beers
    Add Todos To List    @{todos}
    Verify Todos Exist    @{todos}
    Mark Todos As Done    @{todos}
    Verify Todos Are Done    @{todos}
    Delete Done Elements    @{todos}
    Verify Elements Are Deleted    @{todos}
