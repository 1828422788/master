@dashboard
Feature: 仪表盘新建（RZY-208至RZY-210）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline: 新建
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "<name>"
    And I set the parameter "ResourceInput" with value "AutoTest"
    And I choose the "AutoTest" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name          |
      | UIautotest    |
      | FirstAutoTest |

  Scenario: 验证新建成功
    Then I will see the data "FirstAutoTest" values "{'column':'3','name':'AutoTest'}"

  Scenario Outline: 新建失败校验
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "<result>"

    Examples:
      | name  | result                      |
      | t est | 名称格式有误, 仅支持汉字，数字，字母，中划线及下划线 |
      |       | 仪表盘名称不能为空                   |
      | !@    | 名称格式有误, 仅支持汉字，数字，字母，中划线及下划线 |

  Scenario: 新建失败（前面有空格）
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value " test"
    And I click the "Ensure" button
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "名称格式有误, 仅支持汉字，数字，字母，中划线及下划线"

  Scenario: 新建失败（后面有空格）
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "test "
    And I click the "Ensure" button
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "名称格式有误, 仅支持汉字，数字，字母，中划线及下划线"
