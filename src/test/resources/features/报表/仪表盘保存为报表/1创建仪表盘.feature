@saveDashboardAsReport @createDashboards_report
Feature:创建仪表盘

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond

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
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<tag>"
    And I click the "EnsureCreateTagButton" button
    And I wait for "2000" millsecond
    And I back to before

    Examples:
      | name |    tag       |
      | 序列 | LineChart    |
      | 维度 | Pie          |
      | 关系 | Chord        |
      | 复合 | Rangeline    |
      | 地图 | Heatmap      |
      | 其他 | Single       |

  Scenario Outline:  add_tabs
    And I set the parameter "SearchInput" with value "仪表盘_<folder>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<folder>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "TagIcon" will be visible
    And I click the "TagIcon" button
    And I wait for "500" millsecond
    And I click the "CreatNewTag" button
    When I set the parameter "TagName" with value "<tag>"
    And I click the "EnsureCreateTagButton" button
    And I wait for "3000" millsecond

  Examples:
    | folder   |  tag         |
    | 序列     | AreaChart    |
    | 序列     | ColumnChart  |
    | 序列     | ScatterChart |
    | 维度     | Rose         |
    | 维度     | Bar          |
    | 维度     | Sun          |
    | 关系     | Sankey       |
    | 关系     | Force        |
    | 复合     | Multiaxis    |
    | 地图     | Attackmap    |
    | 地图     | Regionmap    |
    | 其他     | Liquidfill   |
    | 其他     | Wordcloud    |
    | 其他     | Radar        |
    | 其他     | Funnel       |
    | 其他     | Matrixheatmap|
    | 其他     | Table        |