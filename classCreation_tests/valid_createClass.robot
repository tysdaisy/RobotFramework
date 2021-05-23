*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource_createClass.robot

*** Test Cases ***
Valid Login
    Open Browser To Create Class Page
    Input Title    whatever
    Input Description    whatever
	Select Difficulty    ${VALID DIFFICULTY}
	Select Language    ${VALID LANGUAGE}
    Submit Credentials
    Class Created Page Should Be Open
    [Teardown]    Close Browser
