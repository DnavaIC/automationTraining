*** Settings ***
Library    Browser
Documentation    This is a test suite for Diego's Automation Test project. 
Suite Setup    New Page    https://www.saucedemo.com/    wait_until=load
Suite Teardown    Browser.Close Browser

*** Test Cases ***
Login with invalid credentials shows error message
    [Documentation]    This test case verifies that an error message is displayed when logging in with invalid credentials.
    Type Text  id=user-name    invalid_user   
    Type Text  id=password    secret_saucer
    Click    id=login-button
    ${error_message}=    Get Text    css=.error-message-container
    Should Be Equal As Strings    ${error_message}    Epic sadface: Username and password do not match any user in this service 
    

Login with valid credentials navigates to products page
    [Documentation]    This test case verifies that logging in with valid credentials navigates to the products page. 
    Type Text    id=user-name    standard_user
    Type Text    id=password    secret_sauce
    Click    id=login-button
    Wait For Elements State    css=.inventory_list    visible
    Wait For Elements State    css=.header_secondary_container    visible
    ${current_url}=    Get Url
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory.html
    ${title}=    Get Text    css= .title
    Should Be Equal As Strings    ${title}    Products
    

Log out from products page returns to login page
    [Documentation]    This test case verifies that logging out from the products page returns to the login page.
    Click    id=react-burger-menu-btn
    Wait For Elements State    id=logout_sidebar_link    visible
    Click    id=logout_sidebar_link
    Wait For Elements State    id=login-button    visible
    ${current_url}=    Get Url
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/ 