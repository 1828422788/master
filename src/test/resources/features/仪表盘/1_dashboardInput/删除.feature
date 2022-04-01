@clearDashboardInput
Feature: 仪表盘输入项删除

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  @cleandbinput
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name         |
      | 仪表盘1669所用趋势图 |
      | 仪表盘所用趋势图     |

  @cleandbinput
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 测试输入项  |
      | 测试输入项1 |
      | 测试输入项2 |
      | 测试输入项3 |
      | 测试输入项4 |
      | 测试输入项5 |
      | 测试输入项6 |
      | 测试输入项7 |


  @cleandashboard34
  Scenario Outline: 删除仪表盘
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name     |
      | 仪表盘输入项联动 |
