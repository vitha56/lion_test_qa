*** Settings ***
Library             RequestsLibrary

*** Variables ***
${url}         https://reqres.in/api/users
${name}=       Testing QA
${job}=        Tech Engineer

*** Test Cases ***
Create User
    ${header}=         Create Dictionary    Content-Type=application/json
    ${payload}=        Create Dictionary    name=${name}                job=${job}
    ${response}=       POST   ${url}        json=${payload}             headers=${header}
    Should Be Equal As Numbers              ${response.status_code}     201
    Should Be Equal As Strings              ${response.json()}[name]    ${name}
    Should Be Equal As Strings              ${response.json()}[job]     ${job}