@all @smoke @app @appSmoke
Feature: 应用监控模块（RZY-2122）

  Background:

  Scenario: 新建监控
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AlertApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    Then I will see the "alert.ListPage" page
    When I click the "CreateAlert" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AlertApp"
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "AutoTestAppAlert"
    And I set the parameter "SearchContent" with value "*"
    And I set the parameter "AlertTriggerInput" with value "10000000"
    And I set the parameter "AlertLevelInput" with value "1000000000"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: 编辑监控
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AlertApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    Then I will see the "alert.ListPage" page
    When the data name is "{'column':'1','name':'AutoTestAppAlert'}" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AlertApp"
    And I will see the "alert.CreatePage" page
    And I wait for loading invisible
    When I set the parameter "AlertName" with value "AutoTestAppAlertChangeName"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

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

  Scenario: 在搜索中打开
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AlertApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    Then I will see the "alert.ListPage" page
    When the data name is "{'column':'1','name':'AutoTestAppAlertChangeName'}" then i click the "在搜索中打开" button
    And switch to another window
    And I wait for loading invisible
    And the page's title will be "搜索"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"

  Scenario: 告警插件
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AlertApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    Then I will see the "alert.ListPage" page
    When I click the "AlertPlugin" button
    And I wait for loading invisible
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AlertApp"
    Then I will see the "alert.PluginPage" page
    And I click the "Upload" button
    And I choose the "告警类型" from the "PluginType"
    And I upload a file with name "/src/test/resources/testdata/alertPlugins/sendSms.py"
    And I wait for "VerifyText" will be visible
    And I click the "EnsureButton" button

  Scenario: 修改标签
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AlertApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AlertApp"
    Then I will see the "alert.ListPage" page
    When the data name is "{'column':'1','name':'AutoTestAppAlertChangeName(副本)'}" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTag"
    And I choose the "AutoTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"

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
    And I will see the element "OldTitle" name is "AlertApp"
    And I will see the "alert.CreatePage" page
    And I wait for "DeleteApp" will be visible
    And I click the "DeleteApp" button
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

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
    Then I will see the success message "保存成功"

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
