@cleanDashboard
Feature: 仪表盘删除

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline: 删除仪表盘
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name          |
      | FirstAutoTest |
      | UI自动化创建       |

  Scenario Outline: 验证删除成功
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name          |
      | FirstAutoTest |
      | UI自动化创建       |
