*** Settings ***                                                                                         
Library    RequestsLibrary

*** Variables ***
${url}         https://reqres.in/api/users

*** Test Cases ***
Get All User
    ${headers}=      Create Dictionary    Content-Type=application/json
    ${result}=       Get All User
    ${response}=     GET    ${url}/${result.user_id}    headers=${headers}
    Should Be Equal As Numbers              ${response.status_code}     200
    User Compare the Result                 ${response}     ${result}  

*** Keywords ***
Get All User
    ${response}=    GET             ${url}
    ${user_id}      Set Variable    ${response.json()['data'][0]['id']}
    ${email}        Set Variable    ${response.json()['data'][0]['email']}
    ${first_name}   Set Variable    ${response.json()['data'][0]['first_name']}
    ${last_name}    Set Variable    ${response.json()['data'][0]['last_name']}
    &{result}=      Create Dictionary             user_id=${user_id}      email=${email}
    ...             first_name=${first_name}      last_name=${last_name}      
    [Return]        ${result}

User Compare the Result
    [Arguments]     ${response}     ${result}
    Should Be Equal As Numbers              ${response.json()}[data][id]            ${result.user_id}
    Should Be Equal As Strings              ${response.json()}[data][email]         ${result.email}
    Should Be Equal As Strings              ${response.json()}[data][first_name]    ${result.first_name}
    Should Be Equal As Strings              ${response.json()}[data][last_name]     ${result.last_name}