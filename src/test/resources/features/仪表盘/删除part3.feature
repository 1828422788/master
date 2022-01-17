@cleardashboardpart3
Feature: 仪表盘删除

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  @cleanDashboard1
  Scenario: 删除知识库
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I set the parameter "SearchInput" with value "apache"
    And I wait for "Loading" will be invisible
    Given the data name is "apache" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    When I click the "Ensure" button
    And I will see the success message "删除知识成功"

  @cleanDashboard1
  Scenario: 删除字段提取
    Given open the "configs.ListPage" page for uri "/configs/"
    And I set the parameter "SearchInput" with value "仪表盘配置字段提取"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'仪表盘配置字段提取'}" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

  @cleanDashboard1
  Scenario: 删除事件操作
    Given open the "event.ListPage" page for uri "/event/action/"
    And I set the parameter "SearchInput" with value "仪表盘测试事件列表"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'仪表盘测试事件列表'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除事件操作成功"

  @cleanDashboard1
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "Loading" will be invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name    |
      | 仪表盘事件操作 |


  @cleanDashboard2
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "Loading" will be invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name    |
      | 仪表盘关联搜索 |

  @cleanDashboard2
  Scenario Outline: 删除字段提取
    Given open the "configs.ListPage" page for uri "/configs/"
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
#    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除成功"

    Examples:
      | name             |
      | 仪表盘关联搜索_workflow |
      | 仪表盘关联搜索_return   |
      | 仪表盘关联搜索_message  |


  @cleanDashboard2
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    Given I wait for loading complete
    And I wait for "3000" millsecond
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name        |
      | 仪表盘workflow |
      | 仪表盘return   |
      | 仪表盘message  |


  @cleandashboard43 @dashboard43j1
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "Loading" will be invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 测试高级编辑 |


  @cleandashboard43 @dashboard43j2
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    Given I wait for loading complete
    And I wait for "3000" millsecond
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name  |
      | 仪表盘所有 |


