*** Settings ***
Library    SeleniumLibrary    timeout=60s

*** Variables ***
${url}=    https://www.saucedemo.com/

*** Keywords ***
Given User access the SauceDemo website
    Open Browser    url=${url}    browser=Chrome
    Maximize Browser Window

User login with the provided username and password
    [Arguments]     ${username}      ${password}
    Title Should Be     Swag Labs
    Wait Until Element Is Visible    id=user-name
    Wait Until Element Is Visible    id=password
    Wait Until Element Is Visible    id=login-button
    Input Text      id=user-name     ${username}
    Input Text      id=password      ${password}
    Click Element                    id=login-button

User add the item to the cart
    Page Should Contain              Products
    Wait Until Element Is Visible    //button[@id='add-to-cart-sauce-labs-backpack']
    Click Element                    //button[@id='add-to-cart-sauce-labs-backpack']
    Wait Until Element Is Visible    //a[@class='shopping_cart_link']
    Click Element                    //a[@class='shopping_cart_link']

User proceeds to checkout
    Page Should Contain             Your Cart
    Wait Until Element Is Visible   //div[@class='inventory_item_price']
    Wait Until Element Is Visible   id=remove-sauce-labs-backpack
    Wait Until Element Is Visible   id=checkout
    Wait Until Element Is Visible   id=continue-shopping
    ${price}                        Get Text      //div[@class='inventory_item_price']
    Click Element                   id=checkout
    [Return]      ${price}

User fills in the checkout information
    [Arguments]                     ${first_name}       ${last_name}      ${postal_code}
    Page Should Contain             Checkout: Your Information
    Wait Until Element Is Visible   id=first-name
    Wait Until Element Is Visible   id=last-name
    Wait Until Element Is Visible   id=postal-code
    Wait Until Element Is Visible   id=continue
    Input Text                      id=first-name       ${first_name}          
    Input Text                      id=last-name        ${last_name}  
    Input Text                      id=postal-code      ${postal_code}
    Click Element                   id=continue

Checkout will be success
    [Arguments]                     ${price}
    Page Should Contain             Checkout: Overview
    Element Text Should Be          //div[@class='summary_subtotal_label']      Item total: ${price}
    Wait Until Element Is Visible   id=finish
    Click Element                   id=finish
    Wait Until Element Is Visible   //h2[@class='complete-header']
    Page Should Contain             Thank you for your order!
    Capture Page Screenshot

    

