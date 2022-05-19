@cleanDashboardInput
Feature: 仪表盘输入项_删除

  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name         |
      | 仪表盘1669所用趋势图 |
      | 仪表盘所用趋势图     |

  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name                     |
      | 测试输入项1              |
      | 测试输入项_时间范围      |
      | 测试输入项_文本输入      |
      | 测试输入项_标识前后缀    |
      | 测试输入项_下拉菜单      |
      | 测试输入项_下拉菜单_多选 |
      | 测试输入项_动态菜单_单选 |
      | 测试输入项_动态菜单_多选 |
      | 仪表盘输入项联动         |