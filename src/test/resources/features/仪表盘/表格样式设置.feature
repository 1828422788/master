Feature: 仪表盘表格样式设置

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 仪表盘表格样式设置 |

  @dashboard @dashboardSmoke
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<name>"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete
    And I wait for "5000" millsecond
    And I back to before

    Examples:
      | name |
      | 表格样式设置  |

  @dashboard @dashboardSmoke
  Scenario Outline: 创建仪表盘所用趋势图
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
      | spl                                                           | name   |
      | tag:sample04061424_chart \|stats count() by 'apache.geo.city' | 仪表盘表格样式 |

  @dashboard @dashboardSmoke
  Scenario Outline: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I click the "Ensure" button

    Examples:
      | name         |
      | 仪表盘表格样式 |
  @dashboard @dashboardSmoke
  Scenario: 编辑图表样式-颜色-值-默认
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartEditorNumber" will be visible
    When I click the "ChartEditorNumber" button
#    And I click the "ChartEditorNumber" button
    And I choose the "值" from the "ChartEditorColor"
    And I wait for "500" millsecond
    And I click the "ColorValueDefault" button
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the element "ValueOfNanjing" style contains "background-color: rgb(230, 247, 255)"

  @dashboard @dashboardSmoke
  Scenario: 编辑图表样式-颜色-值-随机
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘表格样式设置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartEditorNumber" will be visible
    When I click the "ChartEditorNumber" button
#    And I click the "ChartEditorNumber" button
    And I choose the "值" from the "ChartEditorColor"
    And I wait for "500" millsecond
    And I click the "ColorValueRandom" button
    And I wait for "500" millsecond
    And I click the "ChartEditorEnsure" button
    Then I will see the "ValueOfNanjing" is not exist
    Then I will see the element "ValueOfNanjingTd" style contains "background-color"

