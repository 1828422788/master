@dashboard @dashboardCreate
Feature: 仪表盘01新建（RZY-208至RZY-210）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  @dashboardSmoke
  Scenario Outline: 新建(RZY-208，RZY-4472，RZY-4473,RZY-4782)
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "<name>"
    And I will see the text "浏览者" exist in page
    And I choose the "<datauser>" from the "DataUser"
    And I wait for "500" millsecond
    And I choose the "test_app" from the "AppField"
    And I wait for "500" millsecond
    And I choose the "auto_package" from the "TagField"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name          | datauser   |
      | UIautotest    | 浏览者      |
      | FirstAutoTest | 创建者      |

  Scenario: 验证新建成功RZY-208，RZY-4472，RZY-4473）
    Then I will see the data "FirstAutoTest" values "{'column':'3','name':'test_app'}"
    Then I will see the data "UIautotest" values "{'column':'3','name':'test_app'}"

  @dashboardSmoke
  Scenario Outline: 仪表盘授权-数据用户浏览者
    Given the data name is "<name>" then i click the "授权" button in more menu
    Then I will see the element "EmpowerUser" value is "<datauser>"
    And I wait for "EmpowerEdit" will be visible
    And I wait for "EmpowerDelete" will be visible

    Examples:
      | name          | datauser   |
      | UIautotest    | ：浏览者     |

  @dashboardSmoke
  Scenario Outline: 仪表盘授权-数据用户创建者
    Given the data name is "<name>" then i click the "授权" button in more menu
    Then I will see the element "EmpowerUser" value is "<datauser>"
    And I wait for "EmpowerEdit" will be invisible
    And I wait for "EmpowerDelete" will be invisible

    Examples:
      | name          | datauser   |
      | FirstAutoTest    | ：创建者     |