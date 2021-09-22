@reportCreateCharts @allReports
Feature: 报表新建_编辑_维度

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now

  Scenario Outline: new_report_trend_Dimension
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试"
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeInfo>_<color>"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart  | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 5" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Dimension" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I wait for "FieldValue" will be visible
    And I set the parameter "FieldValue" with value "ip_count"

    And I click the "Divide" button
    And I set the parameter "GroupField" with value "apache.clientip" and press enter

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I choose the "<typeInfo>" from the "ShowLabel"
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name      |  typeInfo     |   color   |
      |  PDF        |  Pie           |  Pie       |  只展示名称    |   Red     |
      |  PDF        |  Rose          |  Rose      |  全部展示      |   Green   |
      |  PDF        |  Bar           |  Bar       |  不展示        |   Yellow  |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name      |  typeInfo     |   color   |
      |  EXCEL      |  Pie           |  Pie       |  只展示名称    |   Red     |
      |  EXCEL      |  Rose          |  Rose      |  全部展示      |   Green   |
      |  EXCEL      |  Bar           |  Bar       |  不展示        |   Yellow  |


  Scenario Outline: new_report_trend_Dimension_Sun
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试"
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "status_province_<color>"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart  | stats count() by apache.status,apache.geo.province, apache.geo.city" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Dimension" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I wait for "FieldValue" will be visible
    And I set the parameter "FieldValue" with value "count()"

    And I click the "Divide" button
    And I set the parameter "GroupField" with value "apache.status" and press enter

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button

    And I click the "Divide" button
    And I set the parameter "GroupField" with value "apache.geo.province" and press enter

    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name      |   color     |
      |  PDF        |  Sun           |  Sun       |   DarkBlue  |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name      |   color    |
      |  EXCEL      |  Sun           |  Sun       |   DarkBlue |

  Scenario Outline: new_report_trend_bar_label
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试"
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeInfo>_<option>_<color>"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart  | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 5" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Dimension" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I wait for "FieldValue" will be visible
    And I set the parameter "FieldValue" with value "ip_count"

    And I click the "Divide" button
    And I set the parameter "GroupField" with value "apache.clientip" and press enter

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I choose the "<typeInfo>" from the "ShowLabel"
    And I choose the "<option>" from the "LabelLocation"
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name       |  typeInfo     | option         |  color   |
      |  PDF        |  Bar           |  Bar1       |  只展示名称    |  柱状外右侧    | Red      |
      |  PDF        |  Bar           |  Bar2       |  全部展示      |  柱状内靠左侧  | Green    |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name       |  typeInfo     | option         |  color   |
      |  EXCEL      |  Bar           |  Bar1       |  只展示名称    |  柱状外右侧    | Red      |
      |  EXCEL      |  Bar           |  Bar2       |  全部展示      |  柱状内靠左侧  | Green    |

  Scenario Outline: new_report_trend_sunburst
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试"
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<color>"
    And I set the value "<SPL>" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Dimension" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "2000" millsecond
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType | typeChart   | color     |  name     | SPL   |
      |  PDF        | Sun         | DarkBlue  |Sunburst   | \| makeresults count=10 \| eval app="test_1" \| eval tag="T_1" \| append [[ \| makeresults count=10 \| eval app="test_2" \| eval tag="T_2"]] \| chart rendertype="sunburst" count() over tag by app|

    @reportChartsEXCEL
    Examples:
      |  reportType | typeChart   | color     |  name     | SPL   |
      |  EXCEL      | Sun         | DarkBlue  |Sunburst   | \| makeresults count=10 \| eval app="test_1" \| eval tag="T_1" \| append [[ \| makeresults count=10 \| eval app="test_2" \| eval tag="T_2"]] \| chart rendertype="sunburst" count() over tag by app|

  Scenario Outline: new_report_trend_pie
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试"
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<color>_ratio<ratio>_seg<segments_num>"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 5" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Dimension" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I wait for "FieldValue" will be visible
    And I set the parameter "FieldValue" with value "ip_count"

    And I click the "Divide" button
    And I set the parameter "GroupField" with value "apache.clientip" and press enter

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I set the parameter "SegmentsNumber" with value "<segments_num>"
    And I set the parameter "RatioInnerToOuter" with value "<ratio>"
    And I wait for "1000" millsecond
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType | typeChart | color  |  name  | segments_num | ratio |
      |  PDF        | Pie       | Red    |  Pie_1 | 2            | 0.9   |
      |  PDF        | Pie       | Green  |  Pie_2 | 3            | 0     |

    @reportChartsEXCEL
    Examples:
      |  reportType | typeChart | color  |  name  | segments_num | ratio |
      |  EXCEL      | Pie       | Red    |  Pie_1 | 2            | 0.9   |
      |  EXCEL      | Pie       | Green  |  Pie_2 | 3            | 0     |