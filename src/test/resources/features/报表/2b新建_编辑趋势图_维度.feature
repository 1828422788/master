@reportCreateCharts @allReports
Feature: 报表_2_2维度

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now

  Scenario Outline: 维度（饼状图，玫瑰图，条形图）
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I wait for "ChosenTrendLast" will be visible
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

    When I click the "FinishButton" button
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


  Scenario Outline: 旭日图
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I wait for "ChosenTrendLast" will be visible
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

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF @reportSmoke
    Examples:
      |  reportType |   typeChart    |  name      |   color     |
      |  PDF        |  Sun           |  Sun       |   DarkBlue  |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name      |   color    |
      |  EXCEL      |  Sun           |  Sun       |   DarkBlue |

  Scenario Outline: 条形图_标签1
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I wait for "ChosenTrendLast" will be visible
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

    When I click the "FinishButton" button
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

  Scenario Outline: 条形图_标签2
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I wait for "ChosenTrendLast" will be visible
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "vertical_<typeInfo>_<color>_<label_orient>_<value_orient>"
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
    And I choose the "柱状外两侧" from the "LabelLocation"
    And I choose the "纵向" from the "ChartOrientation"
    And I choose the "<label_orient>" from the "LabelOrientation"
    And I choose the "<value_orient>" from the "ValueLabelOrientation"
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name       |  typeInfo     | label_orient | value_orient | color  |
      |  PDF        |  Bar           |  Bar3       |  全部展示     | 横向         | 纵向         | Red    |
      |  PDF        |  Bar           |  Bar4       |  只展示名称   | 纵向         | 横向         | Orange |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name       |  typeInfo     | label_orient | value_orient | color  |
      |  EXCEL      |  Bar           |  Bar3       |  全部展示     | 横向         | 纵向         | Red    |
      |  EXCEL      |  Bar           |  Bar4       |  只展示名称   | 纵向         | 横向         | Orange |

  Scenario Outline: sunburst
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I wait for "ChosenTrendLast" will be visible
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

    When I click the "FinishButton" button
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

  Scenario Outline: 饼状图_内环占外环比
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I wait for "ChosenTrendLast" will be visible
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

    When I click the "FinishButton" button
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

  Scenario Outline: 火焰图
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I wait for "ChosenTrendLast" will be visible
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart AND (apache.status:200) AND NOT (apache.geo.city:黔东南苗族侗族自治州) AND NOT (apache.geo.city:南京市) | stats count() as cnt by apache.method, apache.status, apache.geo.province, apache.geo.city | sort by apache.method, apache.status, apache.geo.province, apache.geo.city" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Dimension" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I wait for "FieldValue" will be visible
    And I set the parameter "FieldValue" with value "cnt"

    And I click the "Divide" button
    And I set the parameter "GroupField" with value "apache.geo.province" and press enter

    And I click the "Exhibition" button
    And I wait for "1000" millsecond

    And I click the "Divide" button
    And I set the parameter "GroupField" with value "apache.geo.city" and press enter
    And I wait for "1000" millsecond
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF @reportSmoke
    Examples:
      |  reportType | typeChart | name   |
      |  PDF        | Flame     | Flame  |

    @reportChartsEXCEL
    Examples:
      |  reportType | typeChart | name   |
      |  EXCEL      | Flame     | Flame  |