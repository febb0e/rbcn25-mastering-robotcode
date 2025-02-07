*** Settings ***
Documentation       Initializes browser test environment

Resource            demo/config/common.resource
Library             Process
Library             Browser

Suite Setup         Init Webapps And Browser
Suite Teardown      Close Browser And Stop Webapps


*** Keywords ***
Init Webapps And Browser
    [Documentation]    Start Webapps instances and open browser
    Run Process    hatch    run    start-webapps
    New Browser    ${BROWSER}    ${HEADLESS}

Close Browser And Stop Webapps
    [Documentation]    Close Browser and stop web app instances
    Close Browser
    Run Process    hatch    run    stop-webapps
