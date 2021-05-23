*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               valid_createClass.robot file.
Resource          resource_classCreate.robot
Test Teardown     Close Browser

*** Test Cases ***
Valid Login
    Given browser is opened to create class page
    When user "whatever" titles in with description "whatever" and select select "${difficulty}" in difficulty and select "${language}" in language
    Then class created Page page should be open

*** Keywords ***
Browser is opened to class create page
    Open browser to class create page

User input "${title}" in title, input "${description}" in description also select "${difficulty}" in difficulty and select "${language}" in language
    Input Title           ${title}
    Input Description    ${description}
	Select Difficulty     ${difficulty}
	Select Language       ${language}
    Submit credentials
