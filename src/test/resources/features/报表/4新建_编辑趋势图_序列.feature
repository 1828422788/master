@reportCreateCharts
Feature: 报表新建_编辑_序列
#5

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to "admin"
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameter "Hour" with value "05"
    And I set the parameter "Minute" with value "10"
 #   And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"

  Scenario Outline: new_report_trend_Order_button
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "table_Order" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "table_Order"
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<label>_<order>_<unit>_<button>_<min>_<max>_<legendPosition>"
    And I click the "TrendChartType" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "apache.clientip"
    And I click the "<label>" button
    And I click the "<order>" button
    And I click the "Yaxis" button
    And I set the parameter "FieldValue" with value "count()"
    And I set the parameter "unit" with value "<unit>"
    And I click the "<button>" button
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"

    And I click the "Group" button
    And I click the "AddField" button
    And I set the parameter "FieldValue" with value "apache.method"

    And I click the "Example" button
    And I click the "<legendPosition>" button
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @all @report @reportChartsPDF
    Examples:
      |  reportType | typeChart | label        | order           |  unit  |  button        | min |   max  | legendPosition |  name    |
      |  PDF        | LineChart | FirstLabel   |                 |   个   |  Smooth        |  1  |   25   | FirstPosition  |LineChart |
      |  PDF        | AreaChart | SecondLabel  | AscendingOrder  |  pcs.  |ConnectEmptyData|     |   20   | SecondPosition |AreaChart |

    @reportChartsEXCEL
    Examples:
      |  reportType | typeChart | label        | order           |  unit  |  button        | min |   max  | legendPosition |  name    |
      |  EXCEL      | LineChart | FirstLabel   |                 |   个   |  Smooth        |  1  |   25   | FirstPosition  |LineChart |
      |  EXCEL      | AreaChart | SecondLabel  | AscendingOrder  |  pcs.  |ConnectEmptyData|     |   20   | SecondPosition |AreaChart |


# Save two times to save parameters
  Scenario Outline: new_report_trend_Order_Pile
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "table_Order" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "table_Order"
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<label>_<order>_<unit>_Pile_<min>_<max>_<legendPosition>"
    And I click the "TrendChartType" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "apache.clientip"
    And I click the "<label>" button
    And I click the "<order>" button
    And I click the "Yaxis" button
    And I set the parameter "FieldValue" with value "count()"
    And I set the parameter "unit" with value "<unit>"
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"

    And I click the "Group" button
    And I click the "AddField" button
    And I set the parameter "FieldValue" with value "apache.method"
    And I click the "Pile" button

    And I click the "Example" button
    And I click the "<legendPosition>" button
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button
    ###
    And I click the "EditButton" button
    And I click the "EnsureButton" button
    ###
    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @all @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart | label      | order           | unit | min | max | legendPosition |  name          |
      |  PDF        |   AreaChart | ThirdLabel | DescendingOrder | pcs. | 2   | 25  | ThirdPosition  |AreaChart_Pile  |
      |  PDF        | ColumnChart | ThirdLabel | DescendingOrder | 个   | 0   | 20  | ThirdPosition  |ColumnChart_Pile|

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart | label      | order          | unit | min | max | legendPosition |  name           |
      |  EXCEL      |   AreaChart | ThirdLabel | DescendingOrder| pcs. | 2   | 25  | ThirdPosition  |AreaChart_Pile   |
      |  EXCEL      | ColumnChart | ThirdLabel | DescendingOrder| 个   | 0   | 20  | ThirdPosition  |ColumnChart_Pile |

  Scenario Outline: new_report_trend_Order_bubbles
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "table_Order" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "table_Order"
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<label>_<unit>_Bubbles_<legendPosition>"
    And I click the "TrendChartType" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "apache.clientip"
    And I click the "<label>" button
    And I click the "Yaxis" button
    And I set the parameter "FieldValue" with value "count()"
    And I set the parameter "unit" with value "<unit>"

    And I click the "Group" button
    And I click the "AddField" button
    And I set the parameter "FieldValue" with value "apache.method"

    And I click the "Bubble" button
    And I click the "AccordingField" button
    And I set the parameter "BubbleSize" with value "count()"

    And I click the "Example" button
    And I click the "<legendPosition>" button
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @all @report @reportChartsPDF
    Examples:
      |  reportType | typeChart    | label       | unit | legendPosition |  name        |
      |  PDF        | ScatterChart | SecondLabel | 个   | FirstPosition  |ScatterChart  |

    @reportChartsEXCEL
    Examples:
      |  reportType | typeChart    | label       | unit | legendPosition |  name        |
      |  EXCEL      | ScatterChart | SecondLabel | 个   | FirstPosition  |ScatterChart  |

