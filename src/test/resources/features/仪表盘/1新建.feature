@dashboard @dashboardSmoke
Feature: 仪表盘新建（RZY-208至RZY-210）

  Scenario Outline:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
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

  @second
  Scenario: RZY-222:自动登录查看仪表盘的方式
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "PublicNavBarPage" page for uri "/dashboard/login/owner/8e750784517d429f5b27abcd9cfbd473/57f04416bce20f4d0e55738697c5a93d/"
    Then the page's title will be "列表 | 仪表盘"
    And I click the "OwnerIcon" button
    Then I will see the element "LoginUser" name is "owner"