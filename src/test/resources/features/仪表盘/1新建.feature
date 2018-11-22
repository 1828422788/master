@dashboard
Feature: 仪表盘新建

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline:
    Given I click the "CreateButton" button
    Then I set the parameter "DashBoardName" with value "<name>"
    Then I choose the "<group>" from the "DashBoardGroup"
    Then I click the "EnsureCreateButton" button
    Then I will see the <result>

  @all @smoke @dashboardSmoke
    Examples: 新建成功
      | name        | group                       | result                    |
      | autotest    | AutoTestRoleWithAllResource | success message "仪表盘新建成功" |
      | sxjautotest |                             | success message "仪表盘新建成功" |

  @all
    Examples: 新建失败
      | name               | group | result                                               |
      |                    |       | success message "仪表盘名称不能为空"                          |
      | #@$@               |       | success message "名称格式有误, 仅支持汉字，数字，字母，中划线及下划线"        |
      | 我是超长的名称我有十八个字哦不信你查 |       | success message "名称字数超过限制, 字符最多不能超过32位 (单个汉字为2字符占比)" |

