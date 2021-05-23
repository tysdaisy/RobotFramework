*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Firefox
${DELAY}          0
${VALID DIFFICULTY}    1
${VALID LANGUAGE}    1
${INVALID DIFFICULTY}    0
${INVALID LANGUAGE}    0
${CLASSCREATE URL}      http://${SERVER}/createClass.html
${CLASSCREATED URL}    http://${SERVER}/classCreated.html
${ERROR URL}      http://${SERVER}/calssCreationError.html

*** Keywords ***
Open Browser To Create Class Page
    Open Browser    ${CLASSCREATE URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Create Class Page Should Be Open

Create Class Page Should Be Open
    Title Should Be    Create Class Page

Go To Create Class Page
    Go To    ${CLASSCREATE URL}
    Create Class Page Should Be Open

Input Title
    [Arguments]    ${title}
    Input Text    title_field    ${title}

Input Description
    [Arguments]		${description}
    Input Text    description_field    ${description}
	
Select Difficulty
	[Arguments]		${difficulty}
    Select From List By Value 	difficulty_field    ${difficulty}
	
Select Language
	[Arguments]    ${language}
    Select From List By Value   language_field    ${language}
	
Submit Credentials
    Click Button    submit_button

Class Created Page Should Be Open
    Location Should Be    ${CLASSCREATED URL}
    Title Should Be    Class Created Page
