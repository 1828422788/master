@dashboard @dashboardSmoke
Feature: 仪表盘标签操作

  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "CreateButton" button
    When I set the parameter "DashBoardName" with value "<name>"
    Then I click the "EnsureCreateButton" button

    Examples:
      | name    |
      | 测试标签页   |
      | 测试标签页移出 |

  Scenario: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试标签页"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "第一个标签"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete

  Scenario Outline: 新建标签页失败
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试标签页"
    Then I will see the "dashboard.DetailPage" page
    And I click the "AddTag" button
    When I set the parameter "TagName" with value "<tagName>"
    And I click the "EnsureCreateTagButton" button
    Then I will see the success message "<message>"

    Examples:
      | tagName | message                     |
      |         | 标签页名称不能为空                   |
      | t e s t | 名称格式有误, 仅支持汉字，数字，字母，中划线及下划线 |

  Scenario: 跳转到其他仪表盘（RZY-240）
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试标签页"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SwitchButton" button
    And I wait for "Circular" will be invisible
    And I click the "TestMoveTag" button
    And I wait for loading invisible
    Then the page's title will be "测试标签页移出 | 仪表盘"

  Scenario: RZY-241:关闭标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试标签页"
    Then I will see the "dashboard.DetailPage" page
    And I click the "CloseTag" button
    And I wait for loading invisible
    Then I will see the element "DropDownLinkButton" contains "1"
    Then I will see the success message "当前仪表盘无开启状态标签页, 请新建或者恢复关闭状态标签页"

  Scenario: RZY-242:回收站-恢复
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试标签页"
    Then I will see the "dashboard.DetailPage" page
    And I click the "RecoverTag" button

  Scenario: 关闭标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试标签页"
    Then I will see the "dashboard.DetailPage" page
    And I click the "CloseTag" button

  Scenario: RZY-243:回收站-移出
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试标签页"
    Then I will see the "dashboard.DetailPage" page
    And I click the "MoveoutTag" button
    And I check "测试标签页移出" from the "CheckBox"
    And I click the "EnsureMoveTagButton" button
    And I refresh the website
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    Then I will see the data "测试标签页移出" values "{'column':'2','name':'第一个标签'}"
    Then I will see the data "测试标签页" values "{'column':'2','name':''}"

  Scenario: RZY-244:回收站-删除
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试标签页移出"
    Then I will see the "dashboard.DetailPage" page
    And I click the "DeleteTag" button
    And I click the "EnsureDeleteTagButton" button
    And I refresh the website
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    Then I will see the data "测试标签页移出" values "{'column':'2','name':''}"
    Then I will see the data "测试标签页" values "{'column':'2','name':''}"
