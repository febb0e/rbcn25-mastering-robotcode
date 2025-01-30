*** Settings ***
Resource            example/config/common.resource
Library             Browser

Suite Setup         New Browser    ${BROWSER}    ${HEADLESS}
Suite Teardown      Close Browser
