*** Settings ***
Resource        ./resource.robot

*** Test Cases ***

01-Login-username-null
    [Tags]    login-test
    ${email-random}    Generate Random String  0  [LETTERS]
    Log    email random: ${email-random}
    ${password-random}    Generate Random String  8  [LETTERS]
    Log    password random: ${password-random}
    Login    ${email-random}     ${password-random}

02-Login-password-is-null
    [Tags]    login-test
    ${email-random}    Generate Random String  4  [LETTERS]
    Log    email random: ${email-random}
    ${password-random}    Generate Random String  0  [LETTERS]
    Log    password random: ${password-random}
    Login    ${email-random}     ${password-random}

03-Login-username-and-password-is-fail
    [Tags]    login-test
    ${email-random}    Generate Random String  4  [LETTERS]
    Log    email random: ${email-random}
    ${password-random}    Generate Random String  8  [LETTERS]
    Log    password random: ${password-random}
    Login    ${email-random}     ${password-random}

02-Login-pass
    [Tags]    login-test
    Login    standard_user     secret_sauce