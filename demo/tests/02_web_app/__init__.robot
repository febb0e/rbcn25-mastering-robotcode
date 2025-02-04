*** Settings ***
Documentation       Initializes browser test environment

Resource            demo/config/common.resource
Library             Browser

Suite Setup         New Browser    ${BROWSER}    ${HEADLESS}
Suite Teardown      Close Browser
