*** Settings ***
Library             SeleniumLibrary    timeout=60s
Resource            keyword_checkout.robot
Test Teardown       Close Browser

*** Variables ***
${username}=        standard_user
${password}=        secret_sauce
${first_name}=      QA
${last_name}=       Engineer
${postal_code}=     10000 

*** Test Cases ***
Shopping Cart Checkout
    Given User access the SauceDemo website
    And User login with the provided username and password       ${username}      ${password}
    And User add the item to the cart
    ${price}        When User proceeds to checkout
    And User fills in the checkout information   ${first_name}   ${last_name}     ${postal_code}
    Then Checkout will be success                ${price}
