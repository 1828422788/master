@all @smoke @app @appSmoke
Feature: 应用已存搜索（RZY-2125）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "Search" button
    Then I will see the "splSearch.SearchPage" page

  Scenario: 新建已存搜索
    When I click the "SavedSearch" button
    And I set the parameter "OfflineTaskName" with value "AutoApp"
    And I choose the "AutoTestRoleWithAllResource" from the "GroupComboBox"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "创建成功"

  Scenario Outline: 搜索已存搜索
    Given I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I set the parameter "SearchSavedList" with value "<name>"
    Then I will see the column "1" contains "<name>"
    Then I will see the column "3" contains "索引模式"

    Examples:
      | name    |
      | AutoApp |

  Scenario: 存为趋势图
    Given I set the parameter "SearchInput" with value "tag:sample04061424_chart | bucket timestamp span=1h as ts | stats count(apache.clientip) as c_ip by ts"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "Trend" button
    And I set the parameter "TaskName" with value "AutoCreateApp"
    And I click the "EnsureCreateTrend" button
    Then I will see the success message "创建成功"

  Scenario Outline: 删除已存搜索
    Given I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    Then "删除" the data "<name>" in columnNum "1"
    Then I click the "DeleteSavedSearch" button
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "AutoCreateApp" then i click the "删除" button
    And I click the "EnsureButton" button

    Examples:
      | name    |
      | AutoApp |
