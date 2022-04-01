@dashboard
Feature:仪表盘09校验

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  Scenario Outline: 新建失败校验(RZY-209)
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

  Scenario: 新建失败（前面有空格）RZY-209
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value " test"
    And I click the "Ensure" button
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "名称格式有误, 仅支持汉字，数字，字母，中划线及下划线"

  Scenario: RZY-209新建失败（后面有空格）
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "test "
    And I click the "Ensure" button
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "名称格式有误, 仅支持汉字，数字，字母，中划线及下划线"

