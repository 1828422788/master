@reportCreateCharts @allReports
Feature: 报表_2_6其他

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now

  Scenario Outline: 单值1
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
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | stats count() as cnt | eval icon=if(cnt>300,"thumbs-down","thumbs-up")" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "NumericField" with value "cnt"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Green" button
    And I wait for "1000" millsecond
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name      |  color  |
      |  PDF        | Single         | Single     |  Green  |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name      |  color  |
      |  EXCEL      | Single         | Single     |  Green  |

  Scenario Outline: 单值2
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I wait for "ChosenTrendLast" will be visible
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<color>_<iconValue>"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | stats count() as cnt | eval icon=if(cnt>300,"thumbs-down","thumbs-up")" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "NumericField" with value "cnt"
    And I click the "Icon" button
    And I click the "AccordingField" button
    And I set the parameter "FieldValue" with value "<iconValue>"
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "100"
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name         |  color  |  iconValue |
      |  PDF        |    Single      | Single_icon   |  Red    | icon       |

# file is not generated
#    @reportChartsEXCEL
#    Examples:
#      |  reportType |   typeChart    |  name         |  color  |  iconValue |
#      |  EXCEL      |    Single      | Single_icon   |  Red    | icon       |

  Scenario Outline: 单值3
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I set the parameters "Hour" and "Minute" as "6" minutes later from now
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I wait for "ChosenTrendLast" will be visible
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<color>_<fontValue>"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | stats count() as cnt | eval icon=if(cnt>300,"thumbs-down","thumbs-up")" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "NumericField" with value "cnt"
    And I click the "Icon" button
    And I click the "AccordingName" button
    And I set the parameter "IconName" with value "<fontValue>"
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "100"
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name         |  color  |  fontValue        |
      |  PDF        |   Single       | Single_font   |  Orange | font-awesome-flag |

# file is not generated
#    Examples:
#      |  reportType |   typeChart    |  name         |  color  |  fontValue        |
#      |  EXCEL      |   Single       | Single_font   |  Orange | font-awesome-flag |

  Scenario Outline: 单值4_背景
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
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<color1>_range"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | stats count() as cnt | eval cnt = 99 | eval icon=if(cnt>1000000,"thumbs-down","thumbs-up")" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "NumericField" with value "cnt"
    And I click the "Exhibition" button
    And I click the "AccordingArea" button
    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "1"
    And I set the parameter "MaxRange" with value "100"
    And I click the "AddColor" button
    And I click the "<color1>" button
    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "100"
    And I set the parameter "MaxRange" with value "200"
    And I click the "AddColor" button
    And I click the "<color2>" button
    And I wait for "1000" millsecond
    And I click the "Background" button
    And I wait for "1000" millsecond
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name                 |  color1  |  color2 |
      |  PDF        |   Single       | Single_range_backgr   |  Yellow  | Orange  |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name                 |  color1  |  color2 |
      |  EXCEL      |   Single       | Single_range_backgr   |  Yellow  | Orange  |


  Scenario Outline: 环形比例图1
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
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count, apache.clientip |eval count_perc=ip_count/50 | eval count2_perc=ip_count/200 | limit 6" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "count_perc"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF @reportSmoke
    Examples:
      |  reportType |   typeChart    |  name    |  color   |
      |  PDF        |   Ring         | Ring_1   |  Orange  |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name    |  color   |
      |  EXCEL      |   Ring         | Ring_1   |  Orange  |


  Scenario Outline: 环形比例图2
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
    And I set the parameter "TrendDescribeField" with value "<typeChart>_DefaultColor_range"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count, apache.clientip |eval count_perc=ip_count/50 | eval count2_perc=ip_count/200 | limit 6" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "count_perc"
    And I wait for "1000" millsecond
    And I click the "Compare" button
    And I set the parameter "FieldValue" with value "count2_perc"
    And I wait for "1000" millsecond
    And I click the "Exhibition" button
    And I click the "AccordingArea" button
    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "1"
    And I set the parameter "MaxRange" with value "77"
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "77"
    And I set the parameter "MaxRange" with value "80"
    And I wait for "1000" millsecond
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name    |
      |  PDF        |   Ring         | Ring_2   |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name    |
      |  EXCEL      |   Ring         | Ring_2   |


  Scenario Outline: 水球图
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
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | stats count() as cnt| eval cnt_perc=cnt/1000" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "cnt_perc"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF @reportSmoke
    Examples:
      |  reportType |   typeChart    |  name        |  color  |
      |  PDF        |   Liquidfill   | Liquidfill   |  Green  |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name        |  color  |
      |  EXCEL      |   Liquidfill   | Liquidfill   |  Green  |

  Scenario Outline: 字符云图
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
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | stats count() by apache.geo.city" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "count()"
    And I click the "Divide" button
    And I set the parameter "GroupField" with value "apache.geo.city" and press enter
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name        |  color  |
      |  PDF        |   Wordcloud    | Wordcloud    |  Green  |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name        |  color  |
      |  EXCEL      |   Wordcloud    | Wordcloud    |  Green  |

  Scenario Outline: 雷达图
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
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | stats count() by apache.status,apache.geo.city" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "count()"
    And I click the "Indicator" button
    And I set the parameter "FieldValue" with value "apache.geo.city"
    And I wait for "2000" millsecond
    And I click the "UnifyMetric" button
    And I click the "Divide" button

    And I set the parameter "GroupField" with value "apache.geo.city" and press enter
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType | typeChart   |  name     |   color  |
      |  PDF        | Radar       | Radar     | DarkBlue |

    @reportChartsEXCEL
    Examples:
      |  reportType | typeChart   |  name     |   color  |
      |  EXCEL      | Radar       | Radar     | DarkBlue |

  Scenario Outline: 漏斗图
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
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<label>_<color>"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | stats count() by apache.clientip | limit 5" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I click the "Value" button
    And I set the parameter "FieldValue" with value "count()"
    And I click the "Divide" button
    And I set the parameter "GroupField" with value "apache.clientip" and press enter
    And I click the "Example" button
    And I click the "<label>" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType | typeChart   |  name     |   color    |   label          |
      |  PDF        | Funnel      | Funnel    | LightGreen | FirstPosition    |

    @reportChartsEXCEL
    Examples:
      |  reportType | typeChart   |  name     |   color    |   label          |
      |  EXCEL      | Funnel      | Funnel    | LightGreen | FirstPosition    |


  Scenario Outline: 矩阵热力图
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
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | stats count() by apache.status,apache.geo.city" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I click the "Xaxis" button
    And I set the parameter "FieldValue" with value "count()"
    And I click the "Yaxis" button
    And I set the parameter "FieldValue" with value "apache.status"
    And I set the parameter "Segments" with value "10"
    And I wait for "1000" millsecond
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType | typeChart   |  name       |
      |  PDF        |Matrixheatmap|Matrixheatmap|

    @reportChartsEXCEL
    Examples:
      |  reportType | typeChart   |  name       |
      |  EXCEL      |Matrixheatmap|Matrixheatmap|

  Scenario Outline: 统计表
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
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | stats count() by apache.status,apache.geo.city | limit 5" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @report @reportChartsPDF
    Examples:
      |  reportType | typeChart   |  name       |
      |  PDF        |  Table      |  Table      |

    @reportChartsEXCEL
    Examples:
      |  reportType | typeChart   |  name       |
      |  EXCEL      |  Table      |  Table      |