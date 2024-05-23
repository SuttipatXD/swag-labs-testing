*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***
${URL}    https://www.saucedemo.com/

*** Keywords ***

Login
    [Arguments]    ${username}    ${password}    ${time-out}=30s
    Open Browser    ${URL}    browser=chrome
    Wait Until Page Contains Element
    ...    xpath=//input[@data-test="username"]
    ...    timeout=${time-out}
    ...    error=XPath = data-testid input[@data-test="username"] not found.
    Input Text    xpath=//input[@data-test="username"]    ${username}
    Wait Until Page Contains Element
    ...    xpath=//input[@data-test="password"]
    ...    timeout=${time-out}
    ...    error=XPath = data-testid input[@data-test="password"] not found.
    Input Text    xpath=//input[@data-test="password"]    ${password}
    Wait Until Page Contains Element
    ...    xpath=//input[@data-test="login-button"]
    ...    timeout=${time-out}
    ...    error=XPath = data-testid input[@data-test="login-button"] not found.
    Click Element    xpath=//input[@data-test="login-button"]
    Run Keyword And Ignore Error    Log Element Text    xpath=//h3[@data-test="error"]
    Close Browser

Log Element Text
    [Arguments]    ${locator}
    ${status}    ${text}=    Run Keyword And Ignore Error    Get Text    ${locator}
    Log    ${status}
    Run Keyword If    '${status}' == 'PASS'
    ...    Log    Element text: ${text}
    ...    ELSE
    ...    Log    Element not found or error occurred