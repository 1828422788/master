@cleanDashboard
Feature: 仪表盘删除

  Scenario Outline:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "仪表盘删除成功"

    Examples:
      | name          |
      | FirstAutoTest |
      | UI自动化创建       |

  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name         |
      | 仪表盘所用趋势图     |
      | 仪表盘1669所用趋势图 |