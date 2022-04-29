@saveDashboardAsReport @createDashboards_report
Feature:1创建仪表盘

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  Scenario Outline: create_dashboards
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "仪表盘_<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

  Examples:
    | name |
    | 序列 |
    | 维度 |
    | 关系 |
    | 复合 |
    | 地图 |
    | 其他 |


  Scenario Outline: 新建第一个tag
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<tag>"
    And I click the "Ensure" button
    Then I wait for "SettingIcon" will be visible

    Examples:
      | name |    tag       |
      | 序列 | LineChart    |
      | 维度 | Pie          |
      | 关系 | Chord        |
      | 复合 | Rangeline    |
      | 地图 | Heatmap      |
      | 其他 | Single       |

  Scenario Outline:  add_tabs
    And I set the parameter "TextFilter" with value "仪表盘_<folder>"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘_<folder>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "ShowDashboards" button
    And I wait for "LastTag" will be visible
    And I open the context menu of the "LastDashboard" element
    And I wait for "500" millsecond
    And I wait for "CreateNewTag" will be visible
    And I click the "CreateNewTag" button
    When I set the parameter "TagName" with value "<tag>"
    And I click the "Ensure" button
    And I wait for "3000" millsecond

  Examples:
    | folder   |  tag         |
    | 序列     | AreaChart    |
    | 序列     | ColumnChart  |
    | 序列     | ScatterChart |
    | 维度     | Rose         |
    | 维度     | Bar          |
    | 维度     | Sun          |
    | 维度     | Flame        |
    | 关系     | Sankey       |
    | 关系     | Force        |
    | 复合     | Multiaxis    |
    | 地图     | Attackmap    |
    | 地图     | Regionmap    |
    | 其他     | Ring         |
    | 其他     | Liquidfill   |
    | 其他     | Wordcloud    |
    | 其他     | Radar        |
    | 其他     | Funnel       |
    | 其他     | Matrixheatmap|
    | 其他     | Table        |