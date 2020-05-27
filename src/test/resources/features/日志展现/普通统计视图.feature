@all @logDisplay @logDisplayGeneral
Feature: 日志展现_普通统计视图
#34 (24)

  # tag:sample04061424_display should be uploaded for Yesterday
  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: count(RZY-807,808,809,810)
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_display"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I wait for "1000" millsecond
    And I will see the "splSearch.StatisticalPage" page
    And I choose the "<chart>" from the "PresentType" in config
    And I choose the "<value1>" from the "FieldValue" in config
    And I click the "AddButton" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/<caseNum>"
    Then I compare source image "expect/普通统计视图/<caseNum>" with target image "actual/普通统计视图/<caseNum>"

    Examples:
      | chart   | value1                | caseNum            |
      | 曲线图   | logtype               | 807_事件计数_曲线图 |
      | 面积图   | apache.geo.city       | 808_事件计数_面积图 |
      | 散点图   | apache.x_forward      | 810_事件计数_散点图 |
      | 柱状图   | apache.referer_domain | 809_事件计数_柱状图 |


  Scenario Outline: count_independent(RZY-2718)
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_display"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I wait for "1000" millsecond
    And I will see the "splSearch.StatisticalPage" page
    And I choose the "<chart>" from the "PresentType" in config
    And I choose the "<value1>" from the "FieldValue" in config
    And I click the "AddButton" button
    And I set the parameter "FieldValueInput" with value "<value2>"
    And I click the "IndependentStats" button
    And I click the "AddButton" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/<caseNum>"
    Then I compare source image "expect/普通统计视图/<caseNum>" with target image "actual/普通统计视图/<caseNum>"

    Examples:
      | chart   | value1                |     value2    |     caseNum              |
      | 曲线图   | apache.clientip      | appname       |2718_事件计数_独立数统计 |


  Scenario Outline: timeslice(RZY-812,813,2721,2722,2723,2724)
    #When I set the parameter "SearchInput" with value "tag:sample04061424_display"
    When I set the parameter "SearchInput" with value "starttime=\"now/M\" endtime=\"now\" tag:sample04061424_display"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    Given I click the "TimeSlice" button
    And I wait for "1000" millsecond
    Then I choose the "<fieldValue>" from the "FieldValue" in config
    Then I choose the "<statisticType>" from the "StatisticType" in config
    # Set Time Parameters
    And I click the "StartDate" button
    And I set the parameter "DateInput" with value "2020-05-02"
    And I click the "HideElement" button
    And I click the "StartTime" button
    And I set the parameter "TimeInput" with value "<startTime>"
    And I click the "HideElement" button
    And I click the "EndDate" button
    And I set the parameter "DateInput" with value "2020-05-02"
    And I click the "HideElement" button
    And I click the "EndTime" button
    And I set the parameter "TimeInput" with value "<endTime>"
    And I click the "HideElement" button
    And I click the "GenerateTime" button under some element
    And I wait for "6000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/<caseNum>"
    Then I compare source image "expect/普通统计视图/<caseNum>" with target image "actual/普通统计视图/<caseNum>"

    Examples:
      | fieldValue               | statisticType |    startTime  | endTime | caseNum            |
      | apache.resp_len          |计数           | 00:00:00      |23:59:59 | 812_时间分段_计数  |
      | apache.resp_len          |独立数         | 00:00:00      |23:59:59 | 813_时间分段_独立数 |
      | apache.resp_len          |总计           | 00:00:00      |23:59:59 | 2721_时间分段_总计  |
      | apache.resp_len          |平均值         | 00:00:00      |23:59:59 | 2722_时间分段_平均值 |
      | apache.resp_len          |最大值         | 00:00:00      |23:59:59 | 2723_时间分段_最大值 |
      | apache.resp_len          |最小值         | 00:00:00      |23:59:59 | 2724_时间分段_最小值 |


  Scenario Outline: dataslice(RZY-814,3137)
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_display"
    And I click the "SearchButton" button
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
    Then I compare source image "expect/普通统计视图/<caseNum>" with target image "actual/普通统计视图/<caseNum>"

    Examples:
      | fieldValue           | start1 | end1   | start2  |end2    | start3 | end3 | caseNum          |
      | apache.resp_len      |1       | 100    | 100     | 500    |500     | 10000| 814_数值分段_整数  |
      | apache.geo.latitude  |0       | 22.5   | 22.5    | 32.05  |32.05   | 39.90| 3137_数值分段_实数 |


  Scenario Outline: timehistogram(RZY-815,2725)
    When I set the parameter "SearchInput" with value "<period> tag:sample04061424_display"
    And I click the "SearchButton" button
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
    Then I compare source image "expect/普通统计视图/<caseNum>" with target image "actual/普通统计视图/<caseNum>"

    Examples:
      | period                                    | timeSpan | time   | caseNum              |
      | starttime=\"now/d-24h\" endtime=\"now/d\" | 1        |        | 815_时间直方图/815_1h     |
      | starttime=\"now/d-24h\" endtime=\"now/d\" | 3600     | 秒     | 815_时间直方图/815_3600s  |
      | starttime=\"now/d-24h\" endtime=\"now/d\" | 60       | 分钟   | 815_时间直方图/815_60m    |
      #lastMonth
      | starttime=\"-1M/M\" endtime=\"now/M\"     | 7        | 天     | 2725_时间直方图/2725_7d    |
      | starttime=\"-1M/M\" endtime=\"now/M\"     | 1        | 周     | 2725_时间直方图/2725_1w    |


  Scenario Outline: datehistogram(RZY-816)
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_display"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    Given I click the "DataHistogram" button
    And I wait for "1000" millsecond
    When I choose the "<fieldValue>" from the "FieldValue" in config
    And I set the parameter "DataSpan" with value "<number>"
    And I click the "Generate" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/816_数值直方图/<caseNum>"
    Then I compare source image "expect/普通统计视图/816_数值直方图/<caseNum>" with target image "actual/普通统计视图/816_数值直方图/<caseNum>"

    Examples:
      | fieldValue      | number  | caseNum |
      | apache.resp_len | 500     | 816_500    |
      | apache.resp_len | 1000    | 816_1000   |

# can not compare, because of same values
  Scenario Outline: classifyfieldvalue(RZY-817)
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_display"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "ClassifyFieldValue" button
    And I wait for "1000" millsecond
    And I choose the "<fieldValue>" from the "FieldValue" in config
    And I choose the "<charttype>" from the "PresentType" in config
    And I choose the "<value1>" from the "TopElement" in config
    And I click the "Generate" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/817_字段值分类/<screenName>_<value1>"

    Examples:
      | fieldValue       |  charttype   | value1 | screenName |
      | apache.clientip  |    饼图      |  5    | 817_饼图    |
      | apache.clientip  |    饼图      |  20   | 817_饼图    |
      | apache.clientip  |    条形图    |  10   | 817_条形图    |
      | apache.clientip  |    条形图    |  50   | 817_条形图    |


  Scenario Outline: fieldnumber(RZY-2727)
    When I set the parameter "SearchInput" with value "<period> tag:sample04061424_display"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "FieldNumber" button
    And I wait for "1000" millsecond
    And I choose the "<yFieldValue>" from the "YAxis" in config
    And I choose the "<groupBy>" from the "GroupField" in config
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
    Then I compare source image "expect/普通统计视图/2727_字段数值/2727_<statType>_<chart>_<timeSpan><time>" with target image "actual/普通统计视图/2727_字段数值/2727_<statType>_<chart>_<timeSpan><time>"

    Examples:
      |period                                     | yFieldValue       |  groupBy         | statType  | chart   | timeSpan| time |
      |starttime=\"now/d-24h\" endtime=\"now/d\"  |apache.resp_len    |  apache.clientip |  总计     |  曲线图   |   1     | 小时  |
      |starttime=\"now/d-24h\" endtime=\"now/d\"  |apache.resp_len    |  apache.clientip |  平均值   |  面积图   |   60    |  分钟 |
      |starttime=\"now/d-24h\" endtime=\"now/d\"  |apache.resp_len    |  apache.clientip |  最大值   |  散点图   |   60    |  分钟 |
      |starttime=\"now/d-24h\" endtime=\"now/d\"  |apache.resp_len    |  apache.clientip |  最小值   |  柱状图   |  3600   |  秒   |
      |starttime=\"-1M/M\" endtime=\"now/M\"      |apache.status      |  apache.clientip |  总计     |  曲线图   |   7     | 天   |
      |starttime=\"-1M/M\" endtime=\"now/M\"      |apache.status      |  apache.clientip |  平均值   |  面积图   |   1     |  周  |


  Scenario Outline: totalpercent(RZY-819,2730)
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_display"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "TotalPercent" button
    And I wait for "1000" millsecond
    And I choose the "<fieldValue>" from the "FieldValue" in config
    And I click the "ClosePercent<percent2>" button
    And I click the "AddPercent" button
    And I set the parameter "PercentInput" with value "<percent1>"
    And I click the "Generate" button
    And I wait for "4000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/<screenName>"
    Then I compare source image "expect/普通统计视图/<screenName>" with target image "actual/普通统计视图/<screenName>"

    Examples:
      |    fieldValue     |  percent1  |   percent2   |  screenName            |
      |   apache.resp_len |    80      |      75      |  819_累计百分比_80_75   |
      |   apache.resp_len |   30.30    |      25      |  2730_累计百分比_实数     |


  Scenario Outline: percentdegree(RZY-821, 3136)
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_display"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "PercentDegree" button
    And I wait for "1000" millsecond
    And I choose the "<fieldValue>" from the "FieldValue" in config
    And I set the parameter "GoalValue" with value "<value1>"
    And I click the "Generate" button
    And I wait for "4000" millsecond
    And I wait for "ChartPercent" will be visible
    And I drag the scroll bar to the element "ChartPercent"
    And I wait for "2000" millsecond
    And take part of "ChartPercent" with name "actual/普通统计视图/<screenName>"
    Then I compare source image "expect/普通统计视图/<screenName>" with target image "actual/普通统计视图/<screenName>"

    Examples:
      |    fieldValue     |  value1     | screenName               |
      |   apache.resp_len |     100     |  821_百分位等级_100        |
      |   apache.resp_len |  1262.50    |  3136_百分位等级_1262-50   |


  Scenario Outline: multilevelstats(RZY-822)
    # types of chart
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_display"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I click the "MultilevelStatistics" button
    And I wait for "1000" millsecond
    And I choose the "<fieldValue1>" from the "FieldValue" in config
    And I click the "Generate" button
    And I click the "StatisticsGram" button
    And I choose the "<chartType>" from the "PresentType" in config
    And I click the "Generate" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/<screenName>_多级统计/<screenName>_chart_step1"
    Then I compare source image "expect/普通统计视图/<screenName>_多级统计/<screenName>_chart_step1" with target image "actual/普通统计视图/<screenName>_多级统计/<screenName>_chart_step1"

    # Click checkbox with 200
    When I click the "Field" button
    And I click the "NextStep" button
    And I choose the "<fieldValue2>" from the "FieldValue" in config
    And I choose the "计数" from the "StatisticType" in config
    And I click the "Generate1" button
    And I click the "StatisticsGram" button
    And I click the "Generate" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/<screenName>_多级统计/<screenName>_chart_step2"
    Then I compare source image "expect/普通统计视图/<screenName>_多级统计/<screenName>_chart_step2" with target image "actual/普通统计视图/<screenName>_多级统计/<screenName>_chart_step2"

    # Select the whole table
    When I click the "WholeField" button
    And I click the "NextStep" button
    And I choose the "<fieldValue3>" from the "FieldValue" in config
    And I choose the "计数" from the "StatisticType" in config
    And I click the "Generate1" button
    And I click the "StatisticsGram" button
    And I click the "Generate" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/<screenName>_多级统计/<screenName>_chart_step3"
    Then I compare source image "expect/普通统计视图/<screenName>_多级统计/<screenName>_chart_step3" with target image "actual/普通统计视图/<screenName>_多级统计/<screenName>_chart_step3"

    Examples:
      |  fieldValue1   | chartType |  fieldValue2   | chartType2 |    fieldValue3   | chartType3 | screenName |
      | apache.status  |    饼图    |apache.clientip |    曲线图   |  apache.resp_len |    饼图    |  822       |


  Scenario:geogrdistr(RZY-825)
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_display"
    And I click the "SearchButton" button
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
    Then I compare source image "expect/普通统计视图/825_地理分布/825_world" with target image "actual/普通统计视图/825_地理分布/825_world"

    When I click the "CountryChina" button
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/825_地理分布/825_china"
    Then I compare source image "expect/普通统计视图/825_地理分布/825_china" with target image "actual/普通统计视图/825_地理分布/825_china"

    When I click the "ProvinceSichuan" button
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/普通统计视图/825_地理分布/825_sichuan"
    Then I compare source image "expect/普通统计视图/825_地理分布/825_sichuan" with target image "actual/普通统计视图/825_地理分布/825_sichuan"





