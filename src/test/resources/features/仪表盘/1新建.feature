@dashboard @dashboardSmoke
Feature: 仪表盘新建（RZY-208至RZY-210）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button

  Scenario Outline:
    When I set the parameter "DashBoardName" with value "<name>"
    And I set the parameter "ResourceInput" with value "AutoTest"
    And I choose the "AutoTest" from the "LastDropdownList"
    And I click the "Ensure" button
    Then I will see the success message "新建成功"

    Examples: 新建成功
      | name          |
      | UIautotest    |
      | FirstAutoTest |

  Scenario Outline: 新建失败校验
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the error message "<result>"

    Examples:
      | name | result                      |
      |      | 仪表盘名称不能为空                   |
      | !@   | 名称格式有误, 仅支持汉字，数字，字母，中划线及下划线 |
