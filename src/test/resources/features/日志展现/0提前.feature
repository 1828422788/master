@setup1
Feature: 创建用户和上传log

  Scenario: 新建用户
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

  Scenario: 更改密码
    Given open the "users.ListPage" page for uri "/account/users/"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    And I wait for title change text to "登录"
    When I set the parameter "Username" with value "logdisplay"
    And I set the parameter "Password" with value "All!123456"
    And I click the "LoginButton" button
    And I wait for "Modify" will be visible
    And I click the "Modify" button
    And I set the parameter "NewPassword" with value "All#123456"
    And I set the parameter "RepeatPassword" with value "All#123456"
    And I click the "Update" button

  Scenario Outline: 上传log
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appname>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>.txt"
    And I click the "UploadButton" button
    And I wait for "VerifyText" will be visible
    And I will see the element "VerifyText" contains "上传完成"
    And I wait for "5000" millsecond

    Examples:
      |    tag         | log        | appname   |
      | display_may    | display_may| apache    |