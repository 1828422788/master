@createEssentialData @baseUser @setup1
Feature: 新建用户和字段提取

  Scenario: new_user_logdisplay
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "logdisplay"
    And I set the parameter "FullName" with value "logdisplay"
    And I set the parameter "Email" with value "logdisplay@t.cn"
    And I set the parameter "Password" with value "All#123456"
    And I choose the "__admin__" from the "Role"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

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