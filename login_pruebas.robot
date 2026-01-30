*** Settings ***
Library    Browser

*** Test Cases ***
Login Fallido en Saucedemo
    New Browser    browser=chromium    headless=False
    New Page       https://www.saucedemo.com/
    Fill Text      id=user-name    user_error
    Fill Text      id=password     password_error
    Click          id=login-button
    Get Text       css=[data-test="error"]    contains    Epic sadface: Username and password do not match