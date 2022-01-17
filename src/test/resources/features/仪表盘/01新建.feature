@dashboard @dashboard01
Feature: 仪表盘01新建（RZY-208至RZY-210）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  @dashboardSmoke
  Scenario Outline: 新建(RZY-208，RZY-4472，RZY-4473,RZY-4782)
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "<name>"
    And I click the "ResourceInput" button
    And I wait for "1000" millsecond
    And I set the parameter "ResourceTagInput" with value "AutoTest"
    And I wait for "500" millsecond
    Then I will see the element "DataUser" value is "浏览者"
    And I choose the "AutoTest" from the "LastDropdownList"
    And I wait for "3000" millsecond
    And I click the "DashBoardName" button
    And I wait for "2000" millsecond
    And I click the "DataUser" button
    And I choose the "<datauser>" from the "LastDropdownList"
    And I click the "Ensure" button
    Given I wait for loading complete
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name          | datauser   |
      | UIautotest    | 浏览者      |
      | FirstAutoTest | 创建者      |

  Scenario: 验证新建成功RZY-208，RZY-4472，RZY-4473）
    And I will see the text "UIautotest" exist in page
    Then I will see the text "FirstAutoTest" exist in page
#    Then I will see the data "FirstAutoTest" values "{'column':'4','name':'app之api全部用例'}"

  @dashboardSmoke
  Scenario Outline: 仪表盘授权-数据用户浏览者
    Given the data name is "<name>" then i click the "更多" button
    And I wait for "1000" millsecond
    And I click the "GiveRight" button
    Then I will see the element "EmpowerUser" value is "<datauser>"
    And I wait for "EmpowerEdit" will be visible
    And I wait for "EmpowerDelete" will be visible

    Examples:
      | name          | datauser   |
      | UIautotest    | ：浏览者     |

  @dashboardSmoke
  Scenario Outline: 仪表盘授权-数据用户创建者
    Given the data name is "<name>" then i click the "更多" button
    And I wait for "1000" millsecond
    And I click the "GiveRight" button
    Then I will see the element "EmpowerUser" value is "<datauser>"
    And I wait for "EmpowerEdit" will be invisible
    And I wait for "EmpowerDelete" will be invisible

    Examples:
      | name          | datauser   |
      | FirstAutoTest    | ：创建者     |

