*** Settings ***
Documentation       Example browser tests

Library             Browser

Test Teardown       Close Browser


*** Variables ***
${TODO_INPUT}=      input[id="todo-input"]
${ADD_BUTTON}=      button[id="add-todo-button"]
${TODO}=            Hello Robocon
${TODO_ID}=         ${0}


*** Test Cases ***
Test Todo App
    [Documentation]    Test the login of the example web app
    Open Todo App
    Add Todo To List
    Verify Todo Exists
    Mark Todo As Done
    Verify Todo Is Done
    Delete Done Element
    Verify Element Is Deleted


*** Keywords ***
Open Todo App
    [Documentation]    Opens the webapp on localhost
    New Browser    ${browser}    ${headless}
    New Page    ${web_app_url}:${port}

Add Todo To List
    [Documentation]    Adds a Todo
    [Arguments]    ${todo}=${TODO}
    Type Text    ${TODO_INPUT}    ${todo}
    Click    ${ADD_BUTTON}
    VAR    ${TODO_ID}    ${${TODO_ID} + 1}    scope=SUITE    # noqa 

Verify Todo Exists
    [Documentation]    Verifies Todo is existant
    Take Screenshot
    ${todo_text}    Get Text    //div[@id="${TODO_ID}"]//span
    Should Be Equal    ${todo_text}    ${TODO}

Mark Todo As Done
    [Documentation]    Marks the todo as done
    Click    //div[@id="${TODO_ID}"]//button[@id="done-todo-button"]

Verify Todo Is Done
    [Documentation]    Changes into the done view and checks todo is done
    Click    a[href="#/done"]
    Take Screenshot
    ${done_text}    Get Text    //div[@id="${TODO_ID}"]//span
    Should Be Equal    ${done_text}   ${TODO}

Delete Done Element
    [Documentation]    Deletes the done element
    Click    //div[@id="${TODO_ID}"]//button[@id="done-todo-button"]

Verify Element Is Deleted
    [Documentation]    Verifies the deleted element
    Take Screenshot
    Get Element Count    //div[@id="${TODO_ID}"]    ==    0
