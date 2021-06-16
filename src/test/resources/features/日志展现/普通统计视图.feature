@all @logDisplay @logDisplayGeneral
Feature: 日志展现_普通统计视图

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side

  Scenario Outline: count(RZY-807,808,809,810)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I wait for "1000" millsecond
    And I will see the "splSearch.StatisticalPage" page
    And I choose the "<chart>" from the "PresentType"
    And I wait for "2000" millsecond
    And I choose the "<value1>" from the "FieldValue"
    And I click the "AddButton" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/<caseNum>"
    Then I compare source image "actual/普通统计视图/<caseNum>" with target image "expect/普通统计视图/<caseNum>"

    Examples:
      | chart   | value1                | caseNum            |
      | 曲线图   | logtype               | 807_事件计数_曲线图 |
      | 面积图   | apache.geo.city       | 808_事件计数_面积图 |
      | 散点图   | apache.x_forward      | 810_事件计数_散点图 |
      | 柱状图   | apache.referer_domain | 809_事件计数_柱状图 |


  Scenario Outline: count_independent(RZY-2718)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I wait for "1000" millsecond
    And I will see the "splSearch.StatisticalPage" page
    And I choose the "<value1>" from the "FieldValue" in config
    And I wait for "2000" millsecond
    And I choose the "<chart>" from the "PresentType" in config
    And I click the "AddButton" button
    And I click the "IndependentStats" button
    And I choose the "<value2>" from the "FieldValue" in config
    And I click the "AddButton" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/<caseNum>"
    Then I compare source image "actual/普通统计视图/<caseNum>" with target image "expect/普通统计视图/<caseNum>"

    Examples:
      | chart   | value1                |     value2    |     caseNum              |
      | 曲线图   | apache.clientip      | appname       |2718_事件计数_独立数统计 |


  Scenario Outline: timeslice(RZY-812,813,2721,2722,2723,2724)
    When I set the parameter "SearchInput" with value "tag:sample04061424_display"
    And I click the "DateEditor" button
    And I click the "CustomTimeTab" button
    And I set the parameter "StartDateField" with yesterday date
    And I set the parameter "StartTimeField" with value "08:00:00.000"
    And I set the parameter "EndDateField" with current date
    And I set the parameter "EndTimeField" with value "08:00:00.000"
    And I click the "ApplyCustomTime" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    Given I click the "TimeSlice" button
    And I wait for "1000" millsecond
    Then I choose the "apache.resp_len" from the "FieldValue" in config
    And I wait for "2000" millsecond
    And I set the parameter "StartDate" with yesterday date
    And I set the parameter "StartTime" with value "08:00:00"
    And I set the parameter "EndDate" with current date
    And I set the parameter "EndTime" with value "08:00:00"
    And I wait for "2000" millsecond
    Then I choose the "<statisticType>" from the "StatisticType" in config
    And I wait for "2000" millsecond
    And I click the "Generate" button under some element
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/<caseNum>"
    And I wait for "1500" millsecond
    And I move the mouse pointer to the "ColumnChartElement"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "<tooltip>"
    Then I compare source image "actual/普通统计视图/<caseNum>" with target image "expect/普通统计视图/<caseNum>"

    Examples:
      | statisticType | caseNum              | tooltip            |
      |计数           | 812_时间分段_计数    | count : 254        |
      |独立数         | 813_时间分段_独立数  | count : 5          |
      |总计           | 2721_时间分段_总计   | count : 1795176    |
      |平均值         | 2722_时间分段_平均值 | count : 7067.62204 |
      |最大值         | 2723_时间分段_最大值 | count : 173837     |
      |最小值         | 2724_时间分段_最小值 | count : 61         |


  Scenario Outline: dataslice(RZY-814,3137)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for "1500" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    Given I click the "DataSlice" button
    And I wait for "1000" millsecond
    When I choose the "<fieldValue>" from the "FieldValue" in config
    And I set the parameter "StartDataValue" with value "<start1>"
    And I set the parameter "EndDataValue" with value "<end1>"
    And I click the "AddNum" button
    And I set the parameter "StartDataValue" with value "<start2>"
    And I set the parameter "EndDataValue" with value "<end2>"
    And I click the "AddNum" button
    And I set the parameter "StartDataValue" with value "<start3>"
    And I set the parameter "EndDataValue" with value "<end3>"
    And I click the "Generate" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/<caseNum>"
    And I wait for "1500" millsecond
    And I move the mouse pointer to the "ColumnChartElement<num>"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "<tooltip1>"
    And I will see the element "Tooltip" contains "<tooltip2>"
    Then I compare source image "actual/普通统计视图/<caseNum>" with target image "expect/普通统计视图/<caseNum>"

    Examples:
      | fieldValue           | start1 | end1   | start2  |end2    | start3 | end3 | caseNum            | tooltip1     | tooltip2     | num |
      | apache.resp_len      |1       | 100    | 100     | 500    |500     | 10000| 814_数值分段_整数  | count : 220  | 1 - 100      |     |
      | apache.geo.latitude  |0       | 22.5   | 22.5    | 32.05  |32.05   | 39.90| 3137_数值分段_实数 | count : 120  | 22.5 - 32.05 | 2   |


  Scenario Outline: timehistogram(RZY-815)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    Given I click the "TimeHistogram" button
    And I wait for "1000" millsecond
    When I set the parameter "TimeSpan" with value "<timeSpan>"
    And I choose the "<time>" from the "Time" in config
    And I click the "Generate" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/<caseNum>"
    And I wait for "1500" millsecond
    And I move the mouse pointer to the "ColumnChartElement"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "count : 59"
    And I will see the element "Tooltip" contains "00:00 -"
    And I will see the element "Tooltip" contains "01:00"
    And I wait for "1500" millsecond
    And I move the mouse pointer to the "ColumnChartElement2"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "count : 60"
    And I will see the element "Tooltip" contains "01:00 -"
    And I will see the element "Tooltip" contains "02:00"
    Then I compare source image "actual/普通统计视图/<caseNum>" with target image "expect/普通统计视图/<caseNum>"

    Examples:
      | timeSpan | time   | caseNum                   |
      | 1        |        | 815_时间直方图/815_1h     |
      | 3600     | 秒     | 815_时间直方图/815_3600s  |
      | 60       | 分钟   | 815_时间直方图/815_60m    |


  Scenario Outline: timehistogram(RZY-2725)
    When I set the parameter "SearchInput" with value "tag:display_may"
    And I click the "DateEditor" button
    And I click the "CustomTimeTab" button
    And I set the parameter "StartDateField" with value "2020-05-01"
    And I set the parameter "StartTimeField" with value "08:00:00.000"
    And I set the parameter "EndDateField" with value "2020-05-31"
    And I set the parameter "EndTimeField" with value "08:00:00.000"
    And I click the "ApplyCustomTime" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    Given I click the "TimeHistogram" button
    And I wait for "1000" millsecond
    When I set the parameter "TimeSpan" with value "<timeSpan>"
    And I choose the "<time>" from the "Time" in config
    And I click the "Generate" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/<caseNum>"
    And I wait for "1500" millsecond
    And I move the mouse pointer to the "ColumnChartElement"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "05/15 00:00 - 05/22 00:00"
    And I wait for "1500" millsecond
    And I move the mouse pointer to the "ColumnChartElement2"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "05/22 00:00 - 05/29 00:00"
    Then I compare source image "actual/普通统计视图/<caseNum>" with target image "expect/普通统计视图/<caseNum>"

    Examples:
      | timeSpan | time   | caseNum              |
      | 7        | 天     | 2725_时间直方图/2725_7d    |
      | 1        | 周     | 2725_时间直方图/2725_1w    |



  Scenario Outline: datehistogram(RZY-816)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    Given I click the "DataHistogram" button
    And I wait for "1000" millsecond
    When I choose the "apache.resp_len" from the "FieldValue" in config
    And I wait for "1000" millsecond
    And I set the parameter "DataSpan" with value "<number>"
    And I click the "Generate" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/816_数值直方图/<caseNum>"
    And I wait for "1500" millsecond
    And I move the mouse pointer to the "ColumnChartElement"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "<tooltip1>"
    And I will see the element "Tooltip" contains "<tooltip2>"
    Then I compare source image "actual/普通统计视图/816_数值直方图/<caseNum>" with target image "expect/普通统计视图/816_数值直方图/<caseNum>"

    Examples:
      | number  | caseNum    | tooltip1    | tooltip2 |
      | 500     | 816_500    | count : 220 | 0 - 500  |
      | 5000    | 816_5000   | count : 244 | 0 - 5000 |

  Scenario Outline: classifyfieldvalue(RZY-817)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "ClassifyFieldValue" button
    And I wait for "1000" millsecond
    And I choose the "apache.clientip" from the "FieldValue" in config
    And I choose the "<charttype>" from the "PresentType" in config
    And I choose the "<value1>" from the "TopElement" in config
    And I click the "Generate" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/817_字段值分类/<screenName>_<value1>"

    Examples:
      |  charttype   | value1 | screenName |
      |    饼图      |  5    | 817_饼图    |
      |    饼图      |  20   | 817_饼图    |
      |    条形图    |  10   | 817_条形图    |
      |    条形图    |  50   | 817_条形图    |


  Scenario Outline: fieldnumber1(RZY-2727)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "FieldNumber" button
    And I wait for "1000" millsecond
    And I choose the "apache.resp_len" from the "YAxis" in config
    And I choose the "apache.clientip" from the "GroupField" in config
    Then I choose the "<statType>" from the "StatisticType" in config
    And I choose the "<chart>" from the "PresentType" in config
    When I set the parameter "TimeSpan" with value "<timeSpan>"
    And I choose the "<time>" from the "Time" in config
    And I click the "Generate" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/2727_字段数值/2727_<statType>_<chart>_<timeSpan><time>"
    Then I compare source image "actual/普通统计视图/2727_字段数值/2727_<statType>_<chart>_<timeSpan><time>" with target image "expect/普通统计视图/2727_字段数值/2727_<statType>_<chart>_<timeSpan><time>"

    Examples:
      | statType  | chart   | timeSpan| time |
      |  总计     |  曲线图   |   1     | 小时  |
      |  平均值   |  面积图   |   60    |  分钟 |
      |  最大值   |  散点图   |   60    |  分钟 |
      |  最小值   |  柱状图   |  3600   |  秒   |


  Scenario Outline: fieldnumber2(RZY-2727)
    When I set the parameter "SearchInput" with value "tag:display_may"
    And I click the "DateEditor" button
    And I click the "CustomTimeTab" button
    And I set the parameter "StartDateField" with value "2020-05-01"
    And I set the parameter "StartTimeField" with value "08:00:00.000"
    And I set the parameter "EndDateField" with value "2020-05-31"
    And I set the parameter "EndTimeField" with value "08:00:00.000"
    And I click the "ApplyCustomTime" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "FieldNumber" button
    And I wait for "1000" millsecond
    And I choose the "apache.status" from the "YAxis" in config
    And I choose the "apache.clientip" from the "GroupField" in config
    Then I choose the "<statType>" from the "StatisticType" in config
    And I choose the "<chart>" from the "PresentType" in config
    When I set the parameter "TimeSpan" with value "<timeSpan>"
    And I choose the "<time>" from the "Time" in config
    And I click the "Generate" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/2727_字段数值/2727_<statType>_<chart>_<timeSpan><time>"
    Then I compare source image "actual/普通统计视图/2727_字段数值/2727_<statType>_<chart>_<timeSpan><time>" with target image "expect/普通统计视图/2727_字段数值/2727_<statType>_<chart>_<timeSpan><time>"

    Examples:
      | statType  | chart   | timeSpan| time |
      |  总计     |  曲线图   |   7     | 天   |
      |  平均值   |  面积图   |   1     |  周  |

  Scenario Outline: fieldnumber3
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "FieldNumber" button
    And I wait for "1000" millsecond
    And I choose the "apache.resp_len" from the "YAxis" in config
    And I choose the "apache.clientip" from the "GroupField" in config
    And I choose the "<chart>" from the "PresentType" in config
    When I set the parameter "TimeSpan" with value "<timeSpan>"
    And I click the "SelfRadio" button
    And I wait for "2000" millsecond
    And I choose the "36.46.208.22" from the "SelfRadioField" in config
    And I click the "HideElement" button
    And I click the "Generate" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/2727_字段数值/2727_<chart>_<timeSpan>_clientip"
    Then I compare source image "actual/普通统计视图/2727_字段数值/2727_<chart>_<timeSpan>_clientip" with target image "expect/普通统计视图/2727_字段数值/2727_<chart>_<timeSpan>_clientip"

    Examples:
      | chart     | timeSpan|
      |  柱状图   |   1     |

  Scenario Outline: totalpercent(RZY-819,2730)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "TotalPercent" button
    And I wait for "1000" millsecond
    And I choose the "apache.resp_len" from the "FieldValue" in config
    And I click the "HideElement" button
    And I click the "ClosePercent<percent2>" button
    And I click the "AddPercent" button
    And I set the parameter "PercentInput" with value "<percent1>"
    And I click the "Generate" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/<screenName>"
    Then I compare source image "actual/普通统计视图/<screenName>" with target image "expect/普通统计视图/<screenName>"

    Examples:
      |  percent1  |   percent2   |  screenName            |
      |    80      |      75      |  819_累计百分比_80_75   |
      |   30.30    |      25      |  2730_累计百分比_实数     |


  Scenario Outline: percentdegree(RZY-821, 3136)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "PercentDegree" button
    And I wait for "1000" millsecond
    And I choose the "apache.resp_len" from the "FieldValue" in config
    And I set the parameter "GoalValue" with value "<value1>"
    And I click the "Generate" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/<screenName>"
    Then I compare source image "actual/普通统计视图/<screenName>" with target image "expect/普通统计视图/<screenName>"

    Examples:
      |  value1     | screenName               |
      |     100     |  821_百分位等级_100        |
      |  1262.50    |  3136_百分位等级_1262-50   |


  Scenario: multilevelstats_step1(RZY-822)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "MultilevelStatistics" button
    And I wait for "1000" millsecond
    And I choose the "apache.status" from the "FieldValue" in config
    And I click the "Generate" button
    And I click the "StatisticsGram" button
    And I choose the "饼图" from the "PresentType" in config
    And I click the "Generate" button
    And I wait for "2000" millsecond
    And I wait for "MultiStatsChart" will be visible
    And I drag the scroll bar to the element "MultiStatsChart"
    And I wait for "2000" millsecond
    And take part of "MultiStatsChart" with name "actual/普通统计视图/822_多级统计/822_chart_step1"
    Then I compare source image "actual/普通统计视图/822_多级统计/822_chart_step1" with target image "expect/普通统计视图/822_多级统计/822_chart_step1"

  Scenario: multilevelstats_step2(RZY-822)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "MultilevelStatistics" button
    And I wait for "1000" millsecond
    And I choose the "apache.status" from the "FieldValue" in config
    And I click the "Generate" button

    # Click checkbox with 200
    When I click the "Field" button
    And I click the "NextStep" button
    And I choose the "apache.clientip" from the "FieldValue" in config
    And I choose the "计数" from the "StatisticType" in config
    And I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "StatisticsGram" button
    And I wait for "1000" millsecond
    And I choose the "饼图" from the "PresentType" in config
    And I click the "Generate" button
    And I wait for "2000" millsecond
    And I wait for "MultiStatsChart" will be visible
    And I drag the scroll bar to the element "MultiStatsChart"
    And I wait for "2000" millsecond
    And take part of "MultiStatsChart" with name "actual/普通统计视图/822_多级统计/822_chart_step2"
#    Then I compare source image "actual/普通统计视图/822_多级统计/822_chart_step2" with target image "expect/普通统计视图/822_多级统计/822_chart_step2"

  Scenario: multilevelstats_step3(RZY-822)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "MultilevelStatistics" button
    And I wait for "1000" millsecond
    And I choose the "apache.status" from the "FieldValue" in config
    And I click the "Generate" button

    # Click checkbox with 200
    When I click the "Field" button
    And I click the "NextStep" button
    And I choose the "apache.clientip" from the "FieldValue" in config
    And I click the "Generate" button
    And I wait for "1000" millsecond

    # Select the whole table
    When I click the "WholeField" button
    And I wait for "1000" millsecond
    And I click the "NextStep" button
    And I choose the "apache.resp_len" from the "FieldValue" in config
    And I choose the "计数" from the "StatisticType" in config
    And I click the "Generate" button
    And I wait for "2000" millsecond
    And I click the "StatisticsGram" button
    And I wait for "1000" millsecond
    And I choose the "饼图" from the "PresentType" in config
    And I click the "Generate" button
    And I wait for "2000" millsecond
    And I wait for "MultiStatsChart" will be visible
    And I drag the scroll bar to the element "MultiStatsChart"
    And I wait for "2000" millsecond
    And take part of "MultiStatsChart" with name "actual/普通统计视图/822_多级统计/822_chart_step3"
#    Then I compare source image "actual/普通统计视图/822_多级统计/822_chart_step3" with target image "expect/普通统计视图/822_多级统计/822_chart_step3"


  Scenario:geogrdistr(RZY-825)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "GeographicalDistribution" button
    And I wait for "1000" millsecond
    And I choose the "apache.geo.country" from the "FieldValue" in config
    And I click the "Generate" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/825_地理分布/825_world"
    Then I compare source image "actual/普通统计视图/825_地理分布/825_world" with target image "expect/普通统计视图/825_地理分布/825_world"

    When I click the Circle "CountryChina" button
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/825_地理分布/825_china"
    Then I compare source image "actual/普通统计视图/825_地理分布/825_china" with target image "expect/普通统计视图/825_地理分布/825_china"

    When I click the Circle "ProvinceSichuan" button
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/825_地理分布/825_sichuan"
    Then I compare source image "actual/普通统计视图/825_地理分布/825_sichuan" with target image "expect/普通统计视图/825_地理分布/825_sichuan"

  Scenario Outline: check_field
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "<stat>" button
    And I wait for "1000" millsecond
    And I click the "<button>" button
    And I wait for "Message" will be visible
    And I will see the message "<message>"
    
  Examples: 
    |     stat                |  button      | message                |
    |                         | AddButton    | 请选择统计字段         |
    | TimeSlice               | Generate     | 请选择统计字段         |
    | DataSlice               | Generate     | 请选择统计字段         |
    | TimeHistogram           | Generate     | 请填写合理的时间间隔！ |
    | DataHistogram           | Generate     | 请选择统计字段         |
    | ClassifyFieldValue      | Generate     | 请选择统计字段         |
    | FieldNumber             | Generate     | 请选择y轴字段！        |
    | TotalPercent            | Generate     | 请选择统计字段         |
    | PercentDegree           | Generate     | 请选择统计字段         |
    | MultilevelStatistics    | Generate     | 请选择统计字段         |
    | GeographicalDistribution| Generate     | 请选择统计字段         |

  Scenario Outline: check_field2
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "<stat>" button
    And I wait for "1000" millsecond
    Then I choose the "apache.resp_len" from the "<field>" in config
    And I click the "Generate" button
    And I wait for "Message" will be visible
    And I will see the message "<message>"

    Examples:
      |     stat                | message               |     field     |
      | TimeSlice               | 请正确填写时间分段!    | FieldValue    |
      | DataSlice               | 请填写合理的数值分段！ | FieldValue    |
      | DataHistogram           | 请填写合理的数值间隔！ | FieldValue    |
      | FieldNumber             | 请选择分组字段！       | YAxis         |
      | PercentDegree           | 请输入目标值。         | FieldValue    |

  Scenario Outline: check_field3
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "TimeHistogram" button
    And I wait for "1000" millsecond
    Then I set the parameter "TimeSpan" with value "<value>"
    And I click the "Generate" button
    And I wait for "Message" will be visible
    And I will see the message "请输入正整数"

    Examples:
      |     value     |
      | a             |
      | 0             |

  Scenario Outline: check_field4
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "<stat>" button
    And I wait for "1000" millsecond
    Then I choose the "apache.resp_len" from the "FieldValue" in config
    And I click the "<button>" button
    Then I set the parameter "<field>" with value "a"
    And I click the "Generate" button
    And I wait for "Message" will be visible
    And I will see the message "<message>"

    Examples:
      |     stat                | field          | message                       |  button       |
      | DataSlice               | StartDataValue | 请填写合理的数值分段！        |               |
      | DataHistogram           | DataSpan       | 请填写合理的数值间隔！        |               |
      | TotalPercent            | PercentInput   | 请输入正确的数值(0<数值<100)  |    AddPercent |
      | PercentDegree           | GoalValue      | 请填写合理的数值！            |               |

  Scenario Outline: check_field5
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "FieldNumber" button
    And I wait for "1000" millsecond
    And I choose the "apache.resp_len" from the "YAxis" in config
    And I choose the "apache.clientip" from the "GroupField" in config
    And I set the parameter "<field>" with value "<value>"
    And I click the "<button>" button
    When I click the "Generate" button
    And I wait for "Message" will be visible
    And I will see the message "<message>"

  Examples:
    | value      |  message              | field          |  button    |
    |            | 请输入时间桶!         | TimeSpan       |            |
    | a          | 请输入正整数          | TimeSpan       |            |
    |            | 请正确填写分组字段值! | GroupValue     |            |
    | a          | 请正确填写分组字段值! | GroupValue     |            |
    |            | 请正确填写分组字段值! |                | SelfRadio  |

  Scenario: check_field6
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "TotalPercent" button
    And I wait for "1000" millsecond
    Then I choose the "apache.resp_len" from the "FieldValue" in config
    And I click the "HideElement" button
    And I click the "ClosePercent25" button
    And I click the "ClosePercent50" button
    And I click the "ClosePercent75" button
    And I click the "ClosePercent95" button
    And I click the "ClosePercent99" button
    When I click the "Generate" button
    And I wait for "Message" will be visible
    And I will see the message "添加百分比"

  Scenario: check_field7
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "MultilevelStatistics" button
    And I wait for "1000" millsecond
    And I choose the "apache.status" from the "FieldValue" in config
    And I click the "Generate" button

    And I click the "NextStep" button
    And I click the "Generate" button
    And I wait for "Message" will be visible
    And I will see the message "请选择统计字段"
    And I click the "Ensure" button
    And I choose the "apache.clientip" from the "FieldValue" in config
    And I click the "Generate" button
    And I wait for "Message" will be visible
    And I will see the message "请选择step1的值!"
    And I click the "Ensure" button
    # Click checkbox with 200
    When I click the "Field" button
    And I click the "Generate" button
    And I wait for "2000" millsecond
    And I click the "StatisticsGram" button
    And I wait for "2000" millsecond
    And I choose the "散点图" from the "PresentType"
    And I click the "Generate" button
    And I wait for "Message" will be visible
    And I will see the message "请输入时间桶!"