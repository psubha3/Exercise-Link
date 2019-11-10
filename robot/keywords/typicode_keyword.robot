*** Settings ***
Library           RequestsLibrary
Library           ../lib/helper.py

*** Keywords ***
Create Session For Typicode
    [Arguments]    ${BASE_URL}
    [Documentation]    Makes a GET api call for the specific user name provided
    [Tags]    sample
    ${headers}=    Create Dictionary    Accept    application/json
    Create Session    getUser    ${BASE_URL}    headers=${headers}    disable_warnings=1

Get Users with query string
    [Arguments]    ${querystring}    ${verify_string}
    ${res}=    RequestsLibrary.Get Request    getUser    /users?${querystring}=${verify_string}
    log    ${res.json()}
    Should Be Equal As Strings    ${res.status_code}    200
    [Return]    ${res.json()}

Validate response with given query
    [Arguments]    ${json_response}    ${query_String}    ${verify_string}
    ${output_list}=    Jsonpath    ${json_response}    ${query_String}
    ${output}=    Run Keyword If    ${output_list}    Validate List With SearchString    ${output_list}    ${verify_string}
    ...    ELSE    FAIL    List is empty
    [Return]    ${output}

Get posts with query string
    [Arguments]    ${querystring}    ${verify_string}
    ${res}=    RequestsLibrary.Get Request    getUser    /posts?${querystring}=${verify_string}
    log    ${res.json()}
    Should Be Equal As Strings    ${res.status_code}    200
    [Return]    ${res.json()}
