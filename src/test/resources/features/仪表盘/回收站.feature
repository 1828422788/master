@dashboard @dashboardSmoke
Feature: 仪表盘标签操作

  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    Then I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name  |
      | 接收标签页 |
      | 标签页移出 |

  Scenario: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "标签页移出"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "第一个标签"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete

  Scenario: 移出标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "接收标签页"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I click the "MoveoutTag" button
    And I "checked" the checkbox which name is "接收标签页"
    And I click the "Ensure" button

#  Scenario: RZY-241:关闭标签页
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    And I click the detail which name is "接收标签页"
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "CloseTag" button
#    And I wait for loading invisible
#    Then I will see the element "DropDownLinkButton" contains "1"
#    Then I will see the success message "当前仪表盘无开启状态标签页, 请新建或者恢复关闭状态标签页"
#
#  Scenario: RZY-242:回收站-恢复
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    And I click the detail which name is "接收标签页"
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "RecoverTag" button
#
#  Scenario: 关闭标签页
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    And I click the detail which name is "接收标签页"
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "CloseTag" button
#    And I wait for loading invisible
#    Then I will see the element "DropDownLinkButton" contains "1"
#    Then I will see the success message "当前仪表盘无开启状态标签页, 请新建或者恢复关闭状态标签页"
#
#  Scenario: RZY-243:回收站-移出
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    And I click the detail which name is "接收标签页"
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "MoveoutTag" button
#    And I check "测试标签页移出" from the "CheckBox"
#    And I click the "EnsureMoveTagButton" button
#    And I refresh the website
#    And open the "dashboard.ListPage" page for uri "/dashboard/"
#    Then I will see the data "测试标签页移出" values "{'column':'2','name':'第一个标签'}"
#    Then I will see the data "接收标签页" values "{'column':'2','name':''}"
#
#  Scenario: RZY-244:回收站-删除
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    And I click the detail which name is "测试标签页移出"
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "DeleteTag" button
#    And I click the "EnsureDeleteTagButton" button
#    And I refresh the website
#    And open the "dashboard.ListPage" page for uri "/dashboard/"
#    Then I will see the data "测试标签页移出" values "{'column':'2','name':''}"
#    Then I will see the data "接收标签页" values "{'column':'2','name':''}"

  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name    |
      | 测试标签页移出 |
      | 接收标签页   |
