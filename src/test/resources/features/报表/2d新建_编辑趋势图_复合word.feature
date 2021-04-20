@reportCreateCharts @allReports @reportChartsWORD
Feature: 报表新建_编辑_复合word

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now

  Scenario Outline: new_report_trend_rangeline
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | bucket timestamp span=1h as ts | stats count() as cnt by ts | esma cnt timefield=ts" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Compound" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I click the "Xaxis" button
    And I set the parameter "FieldValue" with value "ts"
    And I click the "Yaxis" button
    And I set the parameter "Actual" with value "cnt"
    And I set the parameter "Predict" with value "_predict_cnt"
    And I set the parameter "TopLimit" with value "upper95"
    And I set the parameter "LowerLimit" with value "lower95"
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      |  reportType |   typeChart    |  name      |
      |  WORD       | Rangeline      | Rangeline  |


  Scenario Outline: new_report_trend_multiaxis_1
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Compound" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I click the "Xaxis" button
    And I set the parameter "FieldValue" with value "apache.resp_len"
    And I click the "FirstLabel" button
    And I click the "AscendingOrder" button
    And I click the "Yaxis" button
    And I click the "AddField" button
    And I click the "Yaxis1" button
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170000"
    And I set the parameter "Unit" with value "面"
    And I click the "AddConfigFields" button
    And I set the parameter "FieldValue" with value "max(apache.resp_len)"
    And I choose the "面积图" from the "TypeChartField"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button

    And I click the "AddField" button
    And I click the "Yaxis2" button
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
    And I set the parameter "Max" with value ""
    And I click the "AddConfigFields" button
    And I set the parameter "FieldValue" with value "min(apache.resp_len)"
    And I choose the "柱状图" from the "TypeChartField"

    And I click the "AddField" button
    And I click the "Yaxis3" button
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value "49000"
    And I click the "AddConfigFields" button
    And I set the parameter "FieldValue" with value "sum(apache.status)"
    And I choose the "散点图" from the "TypeChartField"

    And I click the "Group" button
    And I set the parameter "GroupField" with value "apache.status" and press enter
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I wait for "2000" millsecond
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      |  reportType |   typeChart    |  name      |
      |  WORD       | Multiaxis      | Multiaxis  |

  Scenario Outline: new_report_trend_multiaxis
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Compound" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I click the "Xaxis" button
    And I set the parameter "FieldValue" with value "apache.resp_len"
    And I click the "FirstLabel" button
    And I click the "AscendingOrder" button
    And I click the "Yaxis" button
    And I click the "AddField" button
    And I click the "Yaxis1" button
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170000"
    And I set the parameter "Unit" with value "面"
    And I click the "AddConfigFields" button
    And I set the parameter "FieldValue" with value "max(apache.resp_len)"
    And I choose the "面积图" from the "TypeChartField"
    And I drag the element "SliderHandle" by "-60" pixels
    And I click the "AddColor" button
    And I click the "Green" button
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button

    And I click the "AddField" button
    And I click the "Yaxis2" button
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
    And I set the parameter "Max" with value ""
    And I click the "AddConfigFields" button
    And I set the parameter "FieldValue" with value "min(apache.resp_len)"
    And I choose the "柱状图" from the "TypeChartField"
    And I click the "AddColor" button
    And I click the "Red" button

    And I click the "AddField" button
    And I click the "Yaxis3" button
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value "49000"
    And I click the "AddConfigFields" button
    And I set the parameter "FieldValue" with value "sum(apache.status)"
    And I choose the "散点图" from the "TypeChartField"
    And I click the "AddColor" button
    And I click the "Orange" button

    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      |  reportType |   typeChart    |  name        |
      |  WORD       | Multiaxis      | Multiaxis_2  |


