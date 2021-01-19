@reportCreateCharts @allReports
Feature: 报表新建_编辑_关系
#4

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
#    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
#    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"

  Scenario Outline: new_report_trend_connection
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
    And I click the "Connection" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "<source>"

    And I click the "Target" button
    And I set the parameter "FieldValue" with value "<target>"
    
    And I click the "Weight" button
    And I set the parameter "FieldValue" with value "<weight>"

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name      |       source      |   target             |   weight     |  color   | SPL |
      |  PDF        |  Chord         |  Chord     | apache.status     | apache.method        |   cnt        |  Red     | starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart \| stats count() as cnt by apache.status,apache.method \| sort by cnt, apache.status|
      |  PDF        |  Sankey        |  Sankey    | apache.clientip   | apache.resp_len      |   count()    | Yellow   | starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart  AND NOT apache.clientip:221.226.97.92 AND NOT apache.clientip:117.136.79.162 \| stats count() by apache.clientip,apache.resp_len,apache.method \| limit 2 |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name      |       source      |   target             |   weight     |  color   | SPL |
      |  EXCEL      |  Chord         |  Chord     | apache.status     | apache.method        |   cnt        |  Red     | starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart \| stats count() as cnt by apache.status,apache.method \| sort by cnt, apache.status|
      |  EXCEL      |  Sankey        |  Sankey    | apache.clientip   | apache.resp_len      |   count()    | Yellow   | starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart  AND NOT apache.clientip:221.226.97.92 AND NOT apache.clientip:117.136.79.162 \| stats count() by apache.clientip,apache.resp_len,apache.method \| limit 2 |

  Scenario Outline: new_report_trend_Force
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
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<color>_repuls50"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart  | stats count() by apache.clientip,apache.request_path |limit 10" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Connection" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "<source>"

    And I click the "Target" button
    And I set the parameter "FieldValue" with value "<target>"

    And I click the "Weight" button
    And I set the parameter "FieldValue" with value "<weight>"

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I set the parameter "Repulsion" with value "50"
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name      |       source      |   target             |   weight     |  color   |
      |  PDF        |  Force         |  Force     | apache.clientip   | apache.request_path  |  count()     | Green    |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name      |       source      |   target             |   weight     |  color   |
      |  EXCEL      |  Force         |  Force     | apache.clientip   | apache.request_path  |  count()     | Green    |

  Scenario Outline: new_report_trend_Sankey_Mult
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
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<color>_Multistage"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:t_with |transaction json.sid keepevicted=true with states a,b,c in json.module results by flow | stats count() by fromstate,tostate | limit 3" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Connection" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "fromstate"

    And I click the "Target" button
    And I set the parameter "FieldValue" with value "tostate"

    And I click the "Weight" button
    And I set the parameter "FieldValue" with value "count()"

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I click the "Multistage" button
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name        |  color   |
      |  PDF        |  Sankey        |  Sankey_Mult | Red      |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name        |  color   |
      |  EXCEL      |  Sankey        |  Sankey_Mult | Red      |