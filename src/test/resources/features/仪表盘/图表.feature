Feature: 仪表盘图表

  Scenario: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "仪表盘图表"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "图表"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete

    Examples:
      | name  |
      | 仪表盘图表 |

  Scenario: 新建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I wait for "SearchInput" will be visible
    And I set the parameter "SearchInput" with value "tag:*| stats count() by apache.clientip,apache.resp_len | limit 10"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "仪表盘测试图表"
    And I click the "Complete" button
    Then I will see the element "SuccessCreate" name is "新建成功！"

  Scenario: 仪表盘添加趋势图
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘图表"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加图表" from the "EventList"
    And I "checked" the checkbox which name is "仪表盘测试图表"
    And I click the "EnsureCreateTagButton" button
    Then I wait for element "SuccessMessage" change text to "添加成功"
