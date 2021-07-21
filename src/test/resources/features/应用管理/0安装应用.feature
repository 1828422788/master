@app @app-install
Feature: 应用安装（RZY-1988）

  Scenario: 新建数据集
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I click the "Create" button
    And I set the parameter "Name" with value "AutoTestApp"
    And I set the parameter "Alias" with value "AutoTestApp"
    And I set the parameter "Spl" with value "*"
    And I click the "Save" button

  Scenario Outline: 安装资源成功
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/target/download-files/<appName>.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I wait for "2000" millsecond
    And I choose the "__admin__" from the "Role"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "AutoTestApp"
    And I wait for "500" millsecond
#    And I click the "SearchIcon" button
    And I drag the scroll bar to the element "ResultDataset"
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    And I wait for "1500" millsecond
    And I click the "Done" button under some element
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName                     |
      | AutoTestAppWithAllResources |
      | AuthApp                     |

  Scenario Outline: 新建测试app
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    Given delete file "/target/download-files/<name>.tar"
    And I set the parameter "NameInput" with value "<name>"
    And I click the "AddResource" button
    And I wait for "500" millsecond
    And I choose the "数据集" from the "ResourceType"
    And I wait for "1500" millsecond
    And I set the parameter "SearchResourceInput" with value "AutoTestApp"
    And I wait for "SearchLoading" will be invisible
    And I "check" the checkbox which name is "AutoTestApp" in tiny table
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I wait for "MenuName" will be visible
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    And I choose the "<menuName>" from the "DefaultPage"
    And I click the "CreateButton" button
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name      | menuName | url            |
      | TestError | 事件操作     | /event/action/ |

  Scenario Outline: 新建无资源app
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    Given delete file "/target/download-files/<name>.tar"
    And I set the parameter "NameInput" with value "<name>"
    And I click the "AddMenuButton" button under some element
    And I wait for "MenuName" will be visible
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    And I choose the "<menuName>" from the "DefaultPage"
    And I click the "CreateButton" button
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name  | menuName | url            |
      | 测试无资源 | 事件操作     | /event/action/ |

  Scenario: 验证无资源app的安装
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/target/download-files/测试无资源.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I wait for "2000" millsecond
    And I choose the "__admin__" from the "Role"
    And I wait for "2000" millsecond
    And I click the "NextButton" button
    And I wait for "Message" will be visible
    Then I will see the message "请勿导入空资源包！"

  Scenario: 验证不允许重复资源的安装
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/target/download-files/TestError.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__admin__" from the "Role"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "AutoTestApp"
    And I wait for "500" millsecond
#    And I click the "SearchIcon" button
    And I drag the scroll bar to the element "ResultDataset"
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    And I wait for "1500" millsecond
    And I click the "Done" button under some element
    And I wait for "ImportSuccess" will be visible
    And I wait for element "ImportSuccess" change text to "添加失败"

  Scenario: 上传APP包失败（上传格式校验）
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    When I upload a file with name "/src/test/resources/testdata/alertPlugins/hengshuiyinhang_socket.py"
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "上传失败"

  Scenario: 上传APP包失败（上传内容校验）
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    When I upload a file with name "/src/test/resources/testdata/resourceGroups/success.tar"
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "上传失败"



    