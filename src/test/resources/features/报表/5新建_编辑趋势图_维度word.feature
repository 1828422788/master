@reportCreateCharts @allReports @reportChartsWORD
Feature: 报表新建_编辑_维度word
#6

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "45"
#    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
#    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"

  Scenario Outline: new_report_trend_Dimension
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "table_Dimension"
    And I click the button with text "table_Dimension"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeInfo>_<color>"
    And I click the "TrendChartType" button
    And I click the "Dimension" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "ip_count"

    And I click the "Divide" button
    And I click the "AddField" button
    And I set the parameter "FieldValue" with value "apache.clientip"

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I choose the "<typeInfo>" from the "ShowLabel"
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType |   typeChart    |  name      |  typeInfo     |   color   |
      |  WORD       |  Pie           |  Pie       |  只展示名称    |   Red     |
      |  WORD       |  Rose          |  Rose      |  展示全部      |   Green   |
      |  WORD       |  Bar           |  Bar       |  不展示        |   Yellow  |



  Scenario Outline: new_report_trend_Dimension_Sun
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "table_Sun"
    And I click the button with text "table_Sun"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "status_province_<color>"
    And I click the "TrendChartType" button
    And I click the "Dimension" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "count()"

    And I click the "Divide" button
    And I click the "AddField" button
    And I set the parameter "FieldValue" with value "apache.status"
    And I click the "AddField" button
    And I set the parameter "FieldValue" with value "apache.geo.province"

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType |   typeChart    |  name      |   color     |
      |  WORD       |  Sun           |  Sun       |   DarkBlue  |


  Scenario Outline: new_report_trend_bar_label
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "table_Dimension"
    And I click the button with text "table_Dimension"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeInfo>_<option>_<color>"
    And I click the "TrendChartType" button
    And I click the "Dimension" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "ip_count"

    And I click the "Divide" button
    And I click the "AddField" button
    And I set the parameter "FieldValue" with value "apache.clientip"

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I choose the "<typeInfo>" from the "ShowLabel"
    And I choose the "<option>" from the "LabelLocation"
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType |   typeChart    |  name       |  typeInfo     | option         |  color   |
      |  WORD       |  Bar           |  Bar1       |  只展示名称    |  柱状外右侧    | Red      |
      |  WORD       |  Bar           |  Bar2       |  展示全部      |  柱状内靠左侧  | Green    |

