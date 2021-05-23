*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Create Class Page
Suite Teardown    Close Browser
Test Setup        Go To Create Class Page
Test Template     Login With Invalid Credentials Should Fail
Resource          resource_createClass.robot

*** Test Cases *** 											TITLE		DESCRIPTION		DIFFICULTY					LANGUAGE
Empty Title 												${EMPTY}	whatever		${VALID DIFFICULTY}			${VALID LANGUAGE}						
Empty Description											whatever	${EMPTY}		${VALID DIFFICULTY}			${VALID LANGUAGE}
Empty Difficulty											whatever	whatever		${INVALID DIFFICULTY}		${VALID LANGUAGE}
Empty Language												whatever	whatever		${VALID DIFFICULTY}			${INVALID LANGUAGE}
Empty Title and Description									${EMPTY}	${EMPTY}		${VALID DIFFICULTY}			${VALID LANGUAGE}
Empty Title and Difficulty									${EMPTY}	whatever		${INVALID DIFFICULTY}		${VALID LANGUAGE}
Empty Title and Language									${EMPTY}	whatever		${VALID DIFFICULTY}			${INVALID LANGUAGE}
Empty Description and Difficulty							whatever	${EMPTY}		${INVALID DIFFICULTY}		${VALID LANGUAGE}
Empty Description and Language								whatever	${EMPTY}		${VALID DIFFICULTY}			${INVALID LANGUAGE}
Empty Difficulty and Language								whatever	whatever		${INVALID DIFFICULTY}		${INVALID LANGUAGE}
Empty Title and Description and Difficulty					${EMPTY}	${EMPTY}		${INVALID DIFFICULTY}		${VALID LANGUAGE}
Empty Title and Description and Language					${EMPTY}	${EMPTY}		${VALID DIFFICULTY}			${INVALID LANGUAGE}
Empty Title and Difficulty and Language						${EMPTY}	whatever		${INVALID DIFFICULTY}		${INVALID LANGUAGE}
Empty Description and Difficulty and Language				whatever	${EMPTY}		${INVALID DIFFICULTY}		${INVALID LANGUAGE}
Empty Title and Description and Difficulty and Language		${EMPTY}	${EMPTY}		${INVALID DIFFICULTY}		${INVALID LANGUAGE}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]           ${title}    ${description}    ${difficulty}    ${language}
    Input Title           ${title}
    Input Description     ${description}
	Select Difficulty     ${difficulty}
	Select Language       ${language}
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page
