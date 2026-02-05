*** Settings ***
Resource   ../../resources/saucedemo.resource
Suite Setup     Open Saucedemo
Suite Teardown  Close Browser

*** Test Cases ***
Login fallido - credenciales incorrectas
    Login With    ${BAD_USER}    ${BAD_PASS}
    Wait For Elements State    css=h3[data-test="error"]    visible    10s
    ${msg}=    Get Text    css=h3[data-test="error"]
    Should Contain    ${msg}    Epic sadface

Login exitoso - valida Products
    Go To    ${BASE_URL}
    Login With    ${VALID_USER}    ${VALID_PASS}
    Verify Products Page

Log Out - valida login screen
    Logout
