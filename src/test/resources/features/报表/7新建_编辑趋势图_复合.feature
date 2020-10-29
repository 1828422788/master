@reportCreateCharts @allReports
Feature: 报表新建_编辑_复合
#2

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameter "Hour" with value "12"
    And I set the parameter "Minute" with value "25"
#    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
#    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"

  Scenario Outline: new_report_trend_rangeline
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "table_<typeChart>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "table_<typeChart>"
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>"
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

    When I click the "FinishButton" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name      |
      |  PDF        | Rangeline      | Rangeline  |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name      |
      |  EXCEL      | Rangeline      | Rangeline  |

  Scenario Outline: new_report_trend_multiaxis
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "table_<typeChart>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "table_<typeChart>"
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>"
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
    And I set the parameter "FieldValue" with value "max(apache.resp_len)"
    And I choose the "面积图" from the "TypeChartField"
    And I set the parameter "Unit" with value "面"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170000"

    And I click the "AddField" button
    And I drag the scroll bar to the element "FieldValue"
    And I set the parameter "FieldValue" with value "min(apache.resp_len)"
    And I choose the "柱状图" from the "TypeChartField"
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
    And I set the parameter "Max" with value ""

    And I click the "AddField" button
    And I drag the scroll bar to the element "FieldValue"
    And I set the parameter "FieldValue" with value "sum(apache.status)"
    And I choose the "散点图" from the "TypeChartField"
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value "49000"
    
    And I click the "Group" button
    And I click the "AddField" button
    And I set the parameter "FieldValue" with value "apache.status"

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name      |
      |  PDF        | Multiaxis      | Multiaxis  |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name      |
      |  EXCEL      | Multiaxis      | Multiaxis  |