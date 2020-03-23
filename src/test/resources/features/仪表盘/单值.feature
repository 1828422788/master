Feature: 仪表盘单值

  Scenario Outline: 新建成功
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I set the parameter "ResourceInput" with value "AutoTest"
    And I choose the "AutoTest" from the "LastDropdownList"
    And I click the "Ensure" button
    Then I will see the success message "新建成功"

    Examples:
      | name    |
      | 仪表盘图表管理 |

  Scenario Outline: 新建趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | spl                                                                                                | name  |
      | tag:*display \| stats avg(apache.status) as a_\|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\") | 仪表盘单值 |

  Scenario: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘图表管理"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "chart"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete

  Scenario: 添加图表并验证单值结果是否正确
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘图表管理"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I choose the "添加图表" from the "EventList"
    And I wait for "SpinDot" will be invisible
    And I "checked" the checkbox which name is "仪表盘单值"
    And I click the "Ensure" button
    And I wait for "SingleChartFieldA" will be visible
    And I set value with element "SingleChartFieldA"
    And I wait for "FadingLeave" will be invisible
    And I click the "Type" button
    And I click the "Single" button
    And I wait for "SingleChartStatic" will be visible
    And I hide the element "SelectionPopover"
    And I click the "Setting" button
    And I choose the "a_" from the "FieldValue"
    And I click the "Generate" button
    And I hide the element "Content"
    And I click the "MainTitle" button
    And I wait for "Progress" will be invisible
    Then I compare with list "SingleChartStatic"

  Scenario: 单值背景色
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘图表管理"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Setting" will be visible
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "Range" button
    And I click the "AddColourRange" button
    And I set the parameter "StartColour" with value "10"
    And I set the parameter "EndColour" with value "300"
    And I click the "ColorTrigger" button
    And I click the "Green" button
    And I click the "Background" button
    And I click the "Generate" button
    And I click the "MainTitle" button
    Then I will see the element "BackgroundColour" style contains "rgb(37, 155, 36)"

  Scenario: 单值字体色
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘图表管理"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "Setting" will be visible
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "Text" button
    And I click the "Generate" button
    And I click the "MainTitle" button
    Then I will see the element "ChartContainer" style contains "rgb(37, 155, 36)"

  Scenario: 恢复至初始
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘图表管理"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartSetting" button
    And I click the "Recover" button
    And I click the "SettingEnsure" button
    And I wait for "Progress" will be invisible
    Then I wait for "Table" will be visible

  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name    |
      | 仪表盘图表管理 |

  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name  |
      | 仪表盘单值 |
