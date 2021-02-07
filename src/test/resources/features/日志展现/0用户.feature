@createEssentialData @baseUser @setup1
Feature: 新建用户和字段提取

  Scenario: new_user_logdisplay
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "logdisplay"
    And I set the parameter "FullName" with value "logdisplay"
    And I set the parameter "Email" with value "ekaterina.kiseleva@yottabyte.cn"
    And I set the parameter "Password" with value "All!123456"
    And I choose the "__admin__" from the "Role"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  Scenario: change_password
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "logdisplay"
    And I set the parameter "Password" with value "All!123456"
    And I click the "LoginButton" button
    And I wait for "Modify" will be visible
    And I click the "Modify" button under some element
    And I set the parameter "NewPassword" with value "All#123456"
    And I hide the element "InnerContent"
    And I set the parameter "RepeatPassword" with value "All#123456"
    And I click the "Update" button

  Scenario Outline: upload_logs
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "apache"
    And I set the parameter "Tag" with value "<name>"
    And I upload a file with name "/src/test/resources/testdata/log/<name>.txt"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "5000" millsecond

    Examples:
      |    name             |
      |  display_may          |