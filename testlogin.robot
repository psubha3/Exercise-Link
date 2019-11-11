*** Settings ***
Suite Setup       Open Login Page    ${login_page}    ${browser}    # Setup to open login page
Library           SeleniumLibrary

*** Variables ***
${login_page}     http://automationpractice.com/index.php    # login url
${browser}        firefox    # Invoke execution in chrom browser

*** Test Cases ***
TestLogin suit
    Click Element    //*[@id="header"]/div[2]/div/div/nav/div[1]
    Click Element    //*[@id="email_create"]
    Wait Until Element Is Enabled    //*[@id="email_create"]
    Input Text    //*[@id="email_create"]    te23424st30@gmail.com
    Click Button    //*[@id="SubmitCreate"]
    Wait Until Element Is Visible    //*[@class="page-heading"]
    Wait Until Element Contains    //*[@class="page-heading"]    CREATE AN ACCOUNT
    Wait Until Element Is Visible    //*[@id="id_gender1"]
    Click Element    //*[@id="id_gender1"]
    Wait Until Element Is Enabled    //*[@id="customer_firstname"]
    Input Text    //*[@id="customer_firstname"]    Test
    Input Text    //*[@id="customer_lastname"]    sample
    Input Password    //*[@id="email"]    \    clear=False
    Input Password    //*[@id="passwd"]    Admin123!
    Select From List By Value    //*[@id="days"]    10
    Select From List By Value    //*[@id="months"]    4
    Select From List By Value    //*[@id="years"]    2011
    Input Password    //*[@id="firstname"]    \    clear=False
    Input Password    //*[@id="lastname"]    \    clear=False
    Input Password    //*[@id="address1"]    tesint
    Input Password    //*[@id="city"]    Chennai
    Select From List By Value    //*[@id="id_state"]    19
    Input Text    //*[@id="postcode"]    32708
    Input Text    //*[@id="phone_mobile"]    8234231213
    Input Text    //*[@id="alias"]    sample
    Click Button    //*[@id="submitAccount"]
    Wait Until Element Is Visible    //*[@class="logout"]
    Click Element    //*[@class="logout"]

*** Keywords ***
Open Login Page
    [Arguments]    ${login_page}    ${browser}
    Open Browser    ${login_page}    ${browser}
    Maximize Browser Window
