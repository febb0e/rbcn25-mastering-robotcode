*** Settings ***
Documentation       Initializes browser test environment

Resource            demo/config/common.resource
Library             Process
Library             Browser

Suite Setup         Init Webapps And Browser
Suite Teardown      Stop Webapps And Close Browser


*** Keywords ***
Init Webapps And Browser
    [Documentation]    Start Webapps and open browser
    Run Process    hatch run start-webapps
    New Browser    ${BROWSER}    ${HEADLESS}

Stop Webapps And Close Browser
    [Documentation]    Stop Webapps and close browser
    Run Process    hatch run stop-webapps
    Close Browser
