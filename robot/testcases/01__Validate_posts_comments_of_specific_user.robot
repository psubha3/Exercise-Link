*** Settings ***
Suite Setup       Create Session For Typicode    ${BASE_URL}
Library           RequestsLibrary
Library           Collections
Library           jsonpath
Library           ../lib/helper.py
Resource          ../keywords/typicode_keyword.robot

*** Test Cases ***
verify and get userid of given user
    [Documentation]    Makes a GET api call for the specific user name provided
    [Tags]    sample    userapi
    ${get_user_output}    Get Users with query string    ${get_users_uri}    ${get_users_querystring}    ${search_username}
    ${validate_status}=    Validate response with given query    ${get_user_output}    $..username    ${search_username}
    ${user_id_output}=    Run Keyword If    ${validate_status}    Jsonpath    ${get_user_output}    $..id
    ...    ELSE    FAIL    There is mismatch in username received
    ${user_id}=    Set Variable    ${user_id_output[0]}
    Set Suite Variable    ${user_id}

verify users post and get postid of given user
    [Documentation]    Makes a GET api call for the specific user name provided
    [Tags]    sample    postapi
    ${get_post_output}=    Get posts with query string    ${get_posts_uri}    ${get_posts_querystring}    ${user_id}
    ${userId_list}    Validate response with given query    ${get_post_output}    $..userId    ${user_id}
    @{post_id_list}=    Run Keyword If    ${userId_list}    Jsonpath    ${get_post_output}    $..id
    Set Suite Variable    @{post_id_list}

verify user comment of given user
    [Documentation]    Makes a GET api call for the specific user name provided
    [Tags]    sample    commentsapi
    : FOR    ${post_id}    IN    @{post_id_list}
    \    ${get_comment_output}=    Get comments with query string    ${get_comments_uri}    ${get_comments_querystring}    ${post_id}
    \    ${postid_verify_status}    Validate response with given query    ${get_comment_output}    $..postId    ${post_id}
    \    @{email_id_list}=    Run Keyword If    ${postid_verify_status}    Jsonpath    ${get_comment_output}    $..email
    \    ${response_Dictionary}=    Validate list of email id    @{email_id_list}
