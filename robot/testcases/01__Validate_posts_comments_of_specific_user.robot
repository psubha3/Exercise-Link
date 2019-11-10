*** Settings ***
Suite Setup       Create Session For Typicode    ${BASE_URL}
Library           RequestsLibrary
Library           Collections
Library           jsonpath
Resource          ../keywords/typicode_keyword.robot

*** Test Cases ***
verify and get userid of given user
    [Documentation]    Makes a GET api call for the specific user name provided
    [Tags]    sample    userapi
    ${get_user_output}    Get Users with query string    username    Samantha
    ${validate_status}=    Validate response with given query    ${get_user_output}    $..username    Samantha
    ${user_id_output}=    Run Keyword If    ${validate_status}    Jsonpath    ${get_user_output}    $..id
    ...    ELSE    FAIL    There is mismatch in username received
    ${user_id}=    Set Variable    ${user_id_output[0]}
    Set Suite Variable    ${user_id}

verify users post and get postid of given user
    [Documentation]    Makes a GET api call for the specific user name provided
    [Tags]    sample    postapi
    ${get_post_output}=    Get posts with query string    userId    ${user_id}
    ${userId_list}    Validate response with given query    ${get_post_output}    $..userId    ${user_id}
    ${post_id_list}=    Run Keyword If    ${userId_list}    Jsonpath    ${userId_list}    $..id
    Set Suite Variable    ${post_id_list}

verify user comment of given user
    [Documentation]    Makes a GET api call for the specific user name provided
    [Tags]    sample    commentsapi
    ${get_post_output}=    Get posts with query string    userId    ${user_id}
    ${userId_list}    Validate response with given query    ${get_post_output}    $..userId    ${user_id}
    ${post_id_list}=    Run Keyword If    ${userId_list}    Jsonpath    ${userId_list}    $..id
    Set Suite Variable    ${post_id_list}
