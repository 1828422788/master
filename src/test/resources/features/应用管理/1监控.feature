@all @smoke @app @appSmoke
Feature: 应用监控模块（RZY-2122）

  Scenario Outline: 新建单个资源app
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    Given delete file "/target/download-files/<name>.tar"
    And I set the parameter "NameInput" with value "<name>"
    And I click the "AddResource" button
    And I set the parameter "SearchResourceInput" with value "app所选资源"
    And I wait for "SearchLoading" will be invisible
    And I "check" the checkbox which name is "app所选资源" in tiny table
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I wait for "MenuName" will be visible
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    And I choose the "<menuName>" from the "DefaultPage"
    And I click the "CurrentApp" button
    And I click the "ColorPicker" button
    And I set the parameter "ColorValue" with value "<color>"
    And I click the "CreateButton" button under some element
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name     | menuName | url      | color   |
      | AlertApp | 监控       | /alerts/ | #B8FFEE |

  Scenario Outline: 安装资源成功
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/target/download-files/<appName>.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__admin__" from the "Role"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "AutoTestApp"
    And I click the "SearchIcon" button
    And I drag the scroll bar to the element "ResultDataset"
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    And I click the "NextButton" button under some element
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName  |
      | AlertApp |

  Scenario Outline: 验证单个资源的app资源范围是否正确
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I wait for loading invisible
    And I wait for "EmptyText" will be visible
    And I will see the element "Title" name is "<name>"

    Examples:
      | name     |
      | AlertApp |

  Scenario: 新建监控
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AlertApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    Then I will see the "alert.ListPage" page
    When I click the "CreateAlert" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "AutoTestAppAlert"
    And I choose the "username" from the "AlertUsers" with property
    And I set the parameter "SearchContent" with value "*"
    And I set the parameter "TimeInput" with value "100000"
    And I set the parameter "TriggerInput" with value "10000000"
    And I set the parameter "TriggerLevel" with value "1000000000"
    And I click the "CreateButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"

  Scenario: 编辑监控
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AlertApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    Then I will see the "alert.ListPage" page
    When the data name is "{'column':'1','name':'AutoTestAppAlert'}" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    And I will see the "alert.CreatePage" page
    And I wait for loading invisible
    When I set the parameter "AlertName" with value "AutoTestAppAlertChangeName"
    And I set the parameter "TimeInput" with value "30"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

  Scenario Outline: 复制监控
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AlertApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    Then I will see the "alert.ListPage" page
    When the data name is "{'column':'1','name':'<name>'}" then i click the "复制" button
    And I wait for loading invisible
    And I refresh the website
    And I will see the search result contains "{'column':'1','name':'<name>(副本)'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"

    Examples:
      | name                       |
      | AutoTestAppAlertChangeName |

  Scenario: 告警插件
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AlertApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    Then I will see the "alert.ListPage" page
    When I click the "AlertPlugin" button
    And I wait for loading invisible
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    Then I will see the "alert.PluginPage" page
    And I click the "Upload" button
    And I upload a file with name "/src/test/resources/testdata/alertPlugins/sendSms.py"
#    And I wait for "VerifyText" will be visible
    And I click the "EnsureButton" button

  Scenario: 修改标签
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AlertApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    Then I will see the "alert.ListPage" page
    When the data name is "{'column':'1','name':'AutoTestAppAlertChangeName(副本)'}" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "AutoTag"
    And I choose the "AutoTag" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible

  Scenario: 根据标签搜索
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AlertApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    Then I will see the "alert.ListPage" page
    When I wait for loading invisible
    And I choose the "AutoTag" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'AutoTestAppAlertChangeName(副本)'}"
    Then I will see the search result "{'column':'1','name':'AutoTestAppAlertChangeName','contains':'no'}"

  Scenario Outline: 启用禁用功能
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AlertApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    Then I will see the "alert.ListPage" page
    When the data name is "{'column':'1','name':'AutoTestAppAlertChangeName'}" then I "<status>" the switch
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "<message>"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"

    Examples:
      | status | message |
      | close  | 禁用成功    |
      | open   | 启用成功    |

  Scenario: 取消所属应用
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AlertApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    Then I will see the "alert.ListPage" page
    When the data name is "{'column':'1','name':'AutoTestAppAlertChangeName(副本)'}" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    And I will see the "alert.CreatePage" page
    And I wait for "Loading" will be invisible
    And I move the mouse pointer to the "DeleteApp"
    And I click the "DeleteApp" button
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

  Scenario: 验证应用搜索
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    And I choose the "AlertApp" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'AutoTestAppAlertChangeName'}"
    Then I will see the search result "{'column':'1','name':'AutoTestAppAlertChangeName(副本)','contains':'no'}"

  Scenario Outline: 修改app资源范围
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "OverallSituation" button
    And I click the "SaveButton" button

    Examples:
      | name     |
      | AlertApp |

  Scenario Outline: 删除
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AlertApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    Then I will see the "alert.ListPage" page
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "Ensure" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"

    Examples:
      | name                           |
      | AutoTestAppAlertChangeName     |
      | AutoTestAppAlertChangeName(副本) |
