@all @smoke @app @appSmoke
Feature: 应用打开

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page

  Scenario Outline: 验证全部资源下拉框是否正确
    Given I click the "<rightArrow>" button
    And I click the "<menu>" button
    Then I will see the "knowledge.ListPage" page
    When I click the "ArrowDown" button
    And I wait for "GroupMenu" will be visible
#    And I will see the element "GroupMenu" name is "<groupMenuName>"
    And I click the "Setting" button
    And the page's title will be "资源分组管理"
    Then I will see the element "Title" name is "AutoTest...pWithAllResources"

    Examples:
      | rightArrow | menu        | groupMenuName                                                                                                     |
      | RightArrow | Knowledge   | 设置\n全部资源\nAutoTestRoleWithAllResource                                                       |
      |            | Alert       | 设置\n全部资源\nAutoTestRoleWithAllResource                                                                             |
      |            | Report      | 设置\n全部资源\nAutoTestRoleWithAllResource                                                                             |
      |            | Topology    | 设置\n全部资源\nAutoTestRoleWithAllResource                                                                             |
      |            | TimedTask   | 设置\n全部资源\nAutoTestRoleWithAllResource                                                                             |
      |            | Trend       | 设置\n全部资源\nAutoTestRoleWithAllResource\nAutoTestForTrend                                              |
      |            | SearchMacro | 设置\n全部资源\nAutoTestRoleWithAllResource\nAutoTestRoleWithMacro                                                      |
      |            | Config      | 设置\n全部资源\nAutoTestRoleWithAllResource                                                                             |
      |            | Source      | 设置\n全部资源\nAutoTestAppWithAllResources\nAutoTestRoleWithAuth&SourceGroup\nAutoTestRoleWithAllResource\nAutoTestApp |
#      | RightArrow | Agent       | 设置\n全部资源\nAutoTestRoleWithAllResource                                                                             |
#      |            | Event       | 设置\n全部资源\nAutoTestRoleWithAllResource                                                                             |
#      | RightArrow | Indexsetting       | 设置\n全部资源\nAutoTestRoleWithAllResource                                                                             |
#      |            | Search      | 设置\n全部资源\nAutoTestRoleWithAllResource |
#      | RightArrow | Ingestpriority       | 设置\n全部资源\nAutoTestRoleWithAllResource                                                                             |
#      | RightArrow | Download       | 设置\n全部资源\nAutoTestRoleWithAllResource                                                                             |
#      | RightArrow | OfflineTask       | 设置\n全部资源\nAutoTestRoleWithAllResource                                                                             |
#      | RightArrow | Role       | 设置\n全部资源\nAutoTestRoleWithAllResource                                                                             |

  Scenario Outline: 验证资源筛选是否正确
    Given I click the "<rightArrow>" button
    And I click the "<menu>" button
    Then I will see the "knowledge.ListPage" page
    When I click the "ArrowDown" button
    And I set the parameter "SearchGroup" with value "default"
    And I wait for "NoMatch" will be visible

    Examples:
      | rightArrow | menu        |
      | RightArrow | Knowledge   |
      |            | Alert       |
      |            | Report      |
      |            | Topology    |
      |            | TimedTask   |
      |            | Trend       |
      |            | SearchMacro |
      |            | Config      |
      |            | Source      |
#      | RightArrow | Agent       |