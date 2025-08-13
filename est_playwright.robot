*** Settings ***
Library    Browser

*** Test Cases ***
Verify Text On Page
    New Browser    chromium
    New Page    https://robotframework.org
    ${content}=    Get Text    xpath=//h1
    Should Contain    ${content}    Robot Framework
    Close Browser