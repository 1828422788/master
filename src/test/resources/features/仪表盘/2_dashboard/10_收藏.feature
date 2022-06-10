@dashboard @dashboardCollection
Feature: 仪表盘10收藏

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  Scenario Outline: 新建仪表盘，添加第一个标签页
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "标签页"
    And I click the "Ensure" button
    Then I wait for "SettingIcon" will be visible

  Examples:
    | name         |
    | 仪表盘收藏_1 |
    | 仪表盘收藏_2 |
    | 仪表盘收藏_3 |

  Scenario: 仪表盘列表页，收藏
    When the data name is "仪表盘收藏_1" then i click the "收藏" button in more menu
    And I will see the success message "操作成功"
    And I click the "MyCollection" button
    Then I will see the text "仪表盘收藏_1" exist in page
    And I will see the text "仪表盘收藏_2" is not existed in page

  Scenario: 仪表盘标签页，icon收藏
    When I click the detail which name is "仪表盘收藏_2"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    And I will see the "dashboard.DetailPage" page
    And I click the "AddToCollection" button
    And I will see the success message "操作成功"
    And I click the "ShowDashboards" button
    And I click the Element with text "我的收藏"
    Then I will see the element "DashboardList" contains "仪表盘收藏_1"
    And I will see the element "DashboardList" contains "仪表盘收藏_2"
    And I will see the text "仪表盘收藏_3" is not existed in page

  Scenario: 仪表盘标签页，点击鼠标右键，收藏
    When I click the detail which name is "仪表盘收藏_3"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    And I will see the "dashboard.DetailPage" page
    And I click the "ShowDashboards" button
    And I open the context menu of the "{'DashboardName':'仪表盘收藏_3'}" element
    And I choose the "收藏" from the "ContextMenu"
    And I will see the success message "操作成功"
    And I click the Element with text "我的收藏"
    Then I will see the element "DashboardList" contains "仪表盘收藏_1"
    And I will see the element "DashboardList" contains "仪表盘收藏_2"
    And I will see the element "DashboardList" contains "仪表盘收藏_3"

  Scenario Outline:操作-排序
    When I click the "MyCollection" button
    And the data name is "<dashboardName>" then i click the "排序" button and select "<operation>" from menu
    And I will see the success message "操作成功"
    And I wait for loading invisible
    Then I will see the element "FirstDashboardName" contains "<dashboard_1>"
    And I will see the element "SecondDashboardName" contains "<dashboard_2>"
    And I will see the element "ThirdDashboardName" contains "<dashboard_3>"

  Examples:
    | operation | dashboardName | dashboard_1  | dashboard_2  | dashboard_3  |
    | 置顶      | 仪表盘收藏_1  | 仪表盘收藏_1 | 仪表盘收藏_3 | 仪表盘收藏_2 |
    | 置底      | 仪表盘收藏_1  | 仪表盘收藏_3 | 仪表盘收藏_2 | 仪表盘收藏_1 |
    | 下移      | 仪表盘收藏_2  | 仪表盘收藏_3 | 仪表盘收藏_1 | 仪表盘收藏_2 |
    | 上移      | 仪表盘收藏_2  | 仪表盘收藏_3 | 仪表盘收藏_2 | 仪表盘收藏_1 |

  Scenario: 仪表盘列表页，取消收藏
    And I click the "MyCollection" button
    When the data name is "仪表盘收藏_1" then i click the "取消收藏" button in more menu
    And I will see the success message "操作成功"
    And I wait for loading invisible
    Then I will see the text "仪表盘收藏_2" exist in page
    And I will see the text "仪表盘收藏_1" is not existed in page

  Scenario: 仪表盘标签页，icon取消收藏
    When I click the detail which name is "仪表盘收藏_2"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    And I will see the "dashboard.DetailPage" page
    And I click the "CancelCollection" button
    And I will see the success message "操作成功"
    And I click the "ShowDashboards" button
    And I click the Element with text "我的收藏"
    And I click the Element with text "仪表盘收藏_3"
    And I wait for loading invisible
    Then I will see the element "DashboardList" contains "仪表盘收藏_3"
    And I will see the text "仪表盘收藏_2" is not existed in page

  Scenario: 仪表盘标签页，点击鼠标右键，取消收藏
    When I click the detail which name is "仪表盘收藏_1"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    And I will see the "dashboard.DetailPage" page
    And I click the "ShowDashboards" button
    And I open the context menu of the "{'DashboardName':'仪表盘收藏_3'}" element
    And I choose the "取消收藏" from the "ContextMenu"
    And I will see the success message "操作成功"
    And I click the Element with text "我的收藏"
    And I will see the text "仪表盘收藏_3" is not existed in page

  Scenario Outline: 删除仪表盘
    When the data name is "<name>" then i click the "删除" button in more menu
    And I will see the message contains "确认删除仪表盘"
    And I click the "Ensure" button
    And I will see the success message "删除仪表盘成功"

    Examples:
      | name         |
      | 仪表盘收藏_1 |
      | 仪表盘收藏_2 |
      | 仪表盘收藏_3 |