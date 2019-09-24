@dashboard @dashboardSmoke
Feature: 仪表盘新建（RZY-208至RZY-210）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "CreateButton" button

  Scenario Outline:
    When I set the parameter "DashBoardName" with value "<name>"
    And I choose the "<group>" from the "DashBoardGroup"
    Then I click the "EnsureCreateButton" button

    Examples: 新建成功
      | name        | group                  |
      | UIautotest  | default_DashBoardGroup |
      | sxjautotest |                        |

  @first
    Examples:
      | name          | group |
      | FirstAutoTest |       |

  Scenario Outline: 新建失败校验
    When I set the parameter "DashBoardName" with value "<name>"
    Then I click the "EnsureCreateButton" button
    Then I will see the success message "<result>"

    Examples:
      | name | result                      |
      |      | 仪表盘名称不能为空                   |
      | !@   | 名称格式有误, 仅支持汉字，数字，字母，中划线及下划线 |
