*** Settings ***
Library    Collections

*** Variables ***
@{input_array}    3    2    5    1    8    9    6

*** Test Cases ***
Sort Array Test
    ${output}=    Sort Array    @{input_array}
    Log    Output Array: ${output}

*** Keywords ***
Sort Array
    [Arguments]    @{array}
    ${genap}=    Evaluate    sorted([int(num) for num in ${array} if int(num) % 2 == 0], reverse=True)
    ${ganjil}=     Evaluate    sorted([int(num) for num in ${array} if int(num) % 2 != 0], reverse=True)
    ${sorted_array}=    Evaluate    ${genap} + ${ganjil}
    [Return]    ${sorted_array}