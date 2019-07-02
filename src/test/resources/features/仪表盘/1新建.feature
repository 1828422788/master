@dashboard @dashboardSmoke
Feature: 仪表盘新建（RZY-208至RZY-210）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline:
    Given I click the "CreateButton" button
    Then I set the parameter "DashBoardName" with value "<name>"
    Then I choose the "<group>" from the "DashBoardGroup"
    Then I click the "EnsureCreateButton" button

    Examples: 新建成功
      | name        | group                  |
      | UIautotest  | default_DashBoardGroup |
      | sxjautotest |                        |

  @first
    Examples:
      | name          | group |
      | FirstAutoTest |       |