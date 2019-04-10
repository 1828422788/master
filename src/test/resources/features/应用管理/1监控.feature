@all @smoke @app @appSmoke
Feature: 应用监控模块（RZY-2122）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "Alert" button
    Then I will see the "alert.ListPage" page

  Scenario: 新建监控
    When I click the "CreateAlert" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "AutoTestAppAlert"
#    And I choose the "AutoTestRoleWithAllResource" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "*"
    And I switch the "AlertEnable" button to "disable"
    And I set the parameter "AlertTriggerInput" with value "1"
    And I set the parameter "AlertLevelInput" with value "1"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Then take a screenshot with name "2122：APP-监控新建"

  Scenario: 编辑监控
    When the data name is "AutoTestAppAlert" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "AutoTestAppAlertChangeName"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Then take a screenshot with name "2122：APP-监控编辑"

  Scenario Outline: 复制监控
    When the data name is "<name>" then i click the "复制" button
    And I refresh the website
    And I will see the search result contains "{'column':'0','name':'<name>(1)'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then take a screenshot with name "2122：APP-监控复制"

    Examples:
      | name                       |
      | AutoTestAppAlertChangeName |

  Scenario: 在搜索中打开
    When the data name is "AutoTestAppAlertChangeName" then i click the "在搜索中打开" button
    And switch to another window
    And the page's title will be "搜索"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then take a screenshot with name "2122：APP-监控在搜索中打开"

  Scenario Outline: 最新状态
    When I click the "LatestStatus" button
    Then I will see the "knowledge.ListPage" page
    When I click the "ArrowDown" button
    Then I will see the "alert.MonitorPage" page
    And I wait for "GroupMenu" will be visible
    And I will see the element "GroupMenu" name is "<groupMenuName>"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then take a screenshot with name "2122：APP-最新状态-下拉框是否正确"

    Examples:
      | groupMenuName                       |
      | 全部监控分组\nAutoTestRoleWithAllResource |

  Scenario Outline: 启用禁用功能
    When I disabled the data "AutoTestAppAlertChangeName"
    And I will see the success message "<message>"
    Then take a screenshot with name "2122：APP-监控启用禁用"

    Examples:
      | message |
      | 启用成功    |
      | 禁用成功    |

  Scenario: 删除
    When the data name is "AutoTestAppAlertChangeName" then i click the "删除" button
    And I click the "EnsureDeleteButton" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then take a screenshot with name "2122：APP-监控删除"

  Scenario: 删除复制监控
    When the data name is "AutoTestAppAlertChangeName(1)" then i click the "删除" button
    And I click the "EnsureDeleteButton" button

