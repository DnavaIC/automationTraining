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

Login Exitoso
    New Page       https://www.saucedemo.com/
    Fill Text      id=user-name    standard_user
    Fill Text      id=password     secret_sauce
    Click          id=login-button
    # Validar la página de productos
    Get Text       css=.title    contains    Products
    # Log Out
    Click          id=react-burger-menu-btn
    Click          id=logout_sidebar_link
    # Validar que volvimos al login
    Get Element States    id=login-button    contains    visible