@saveDashboardAsReport
Feature:4保存为报表

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  @dashboardSaveAsReport_create
  Scenario Outline: 存为报表
    And I set the parameter "SearchInput" with value "仪表盘_<dashboard_name>"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘_<dashboard_name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "ShowDashboards" button
    And I wait for "LastTag" will be visible

    And I click the Element with text "<chart>"
    And I wait for "3000" millsecond
    And I click the "SettingIcon" button
    And I click the "SaveAs" button
    And I click the "SaveAsReport" button
    And switch to another window
    And I close all tabs except main tab
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "仪表盘保存为报表_<chart>"
    And I choose the "PDF" from the "ReportType"
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I click the "NextButton" button
    And I wait for "TopoTitle" will be visible
    And I click the "FinishButton" button
    And I wait for "3000" millsecond
    Then I will see the text "新建成功" exist in page

    Examples:
      | dashboard_name|  chart       |
      | 序列          | LineChart    |
      | 序列          | AreaChart    |
      | 序列          | ColumnChart  |
      | 序列          | ScatterChart |
      | 维度          | Pie          |
      | 维度          | Rose         |
      | 维度          | Bar          |
      | 维度          | Sun          |
      | 维度          | Flame        |
      | 关系          | Chord        |
      | 关系          | Sankey       |
      | 关系          | Force        |
      | 复合          | Rangeline    |
      | 复合          | Multiaxis    |
      | 地图          | Heatmap      |
      | 地图          | Attackmap    |
      | 地图          | Regionmap    |
      | 其他          | Single       |
      | 其他          | Ring         |
      | 其他          | Liquidfill   |
      | 其他          | Wordcloud    |
      | 其他          | Funnel       |
      | 其他          | Radar        |
      | 其他          | Matrixheatmap|
      | 其他          | Table        |

    @save_dashboard_report
  Scenario Outline: 下载PDF报表
    Given open the "report.ListPage" page for uri "/reports/"
      And I wait for loading invisible
    When I set the parameter "SearchInput" with value "仪表盘保存为报表_<chart>"
      And I wait for loading invisible
    And the data name is "{'column':'1','name':'仪表盘保存为报表_<chart>'}" then i click the "仪表盘保存为报表_<chart>" button
    And I wait for element "SelectedReport" change text to "仪表盘保存为报表_<chart>"
    Then I will see the element "LastGeneratedReport" contains ".pdf"
    And I click the "Download" button
    And I wait for "4000" millsecond
    And I download the latest report to local
    And I wait for "2000" millsecond

    Examples:
      |  chart       |
      | LineChart    |
      | AreaChart    |
      | ColumnChart  |
      | ScatterChart |
      | Pie          |
      | Rose         |
      | Bar          |
      | Sun          |
      | Flame        |
      | Chord        |
      | Sankey       |
      | Force        |
      | Rangeline    |
      | Multiaxis    |
      | Heatmap      |
      | Attackmap    |
      | Regionmap    |
      | Single       |
      | Ring         |
      | Liquidfill   |
      | Wordcloud    |
      | Funnel       |
      | Radar        |
      | Matrixheatmap|
      | Table        |