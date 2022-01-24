@dashboard6_10 @dashboardChart
Feature: 仪表盘_6_10_网络节点图

 
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 仪表盘网络节点图 |


  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePageDash" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for loading invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "Complete" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | spl                                                                                                                                                                      | name       |
      | tag:sample04061424_chart \| stats count() as cnt by apache.method, apache.geo.province, apache.geo.city \| sort by +apache.geo.province, cnt, apache.go.city \| limit 10 | 仪表盘网络节点图 |

  
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<name>"
    And I click the "EnsureCreateTagButton" button
    And I wait for "2000" millsecond
    And I back to before

    Examples:
      | name |
      | 网络节点图  |

 
  Scenario Outline: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name   |
      | 仪表盘网络节点图 |

  
  Scenario Outline: 修改为网络节点图 RZY-
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "<targetName>" button
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I click the "Exhibition" button
    And I set the parameter "Repulsion" with value "30"
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "Generate" button
    And I wait for "3000" millsecond
    And I click the "Setting" button under some element
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I move the mouse pointer to the "TrendTitle"
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name          | targetName  |
      | 仪表盘网络节点图 | NetworkNode |


  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-4836
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I will see the "TextLayer" result will contain "<json>"

    Examples:
      | name          | json                                                                                                                                                                                                                                                                                                                                                                           |
      | 仪表盘网络节点图 |  \n  "chart": {\n    "chartType": "networknode",\n    "fromField": "apache.method",\n    "toField": "apache.geo.province",\n    "portField": "apache.geo.city",\n    "repulsionField": 30,\n    "precision": "",\n    "expendLevel": 1,\n    "indicatorsField": []\n  } |