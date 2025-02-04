*** Settings ***
Documentation       Keywords for Todo App Browser tests

Library             Browser


*** Variables ***
${TODO_INPUT}       input[id="todo-input"]
${ADD_BUTTON}       button[id="add-todo-button"]
${TODO_ID}          ${0}


*** Keywords ***
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
