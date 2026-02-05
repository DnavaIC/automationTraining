*** Settings ***
Library    Browser

*** Variables ***
${BASE_URL}    https://www.saucedemo.com/
${VALID_USER}  standard_user
${VALID_PASS}  secret_sauce
${BAD_USER}    locked_out_user
${BAD_PASS}    wrong_pass

*** Keywords ***
Open Saucedemo
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1280, 'height': 720}
    New Page       ${BASE_URL}
    Wait For Elements State    css=input[data-test="username"]    visible    10s

Login With
    [Arguments]    ${username}    ${password}
    Fill Text    css=input[data-test="username"]    ${username}
    Fill Text    css=input[data-test="password"]    ${password}
    Click        css=input[data-test="login-button"]

Verify Products Page
    Wait For Elements State    css=.inventory_list    visible    10s
    Get Url    ==    https://www.saucedemo.com/inventory.html

Logout
    Click    css=#react-burger-menu-btn
    Wait For Elements State    css=#logout_sidebar_link    visible    10s
    Click    css=#logout_sidebar_link
    Wait For Elements State    css=input[data-test="login-button"]    visible    10s
