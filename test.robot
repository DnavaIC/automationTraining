*** Settings ***
Library    Browser

*** Test Cases ***
Open Browser And Check Title
    New Browser    chromium
    New Page    https://robotframework.org
    ${title}=    Get Title
    Should Be Equal    ${title}    Robot Framework
    Close Browser