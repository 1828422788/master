@reportCreateCharts @reportChartsWORD
Feature: 报表新建_编辑_其他
#10

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameter "Hour" with value "12"
    And I set the parameter "Minute" with value "40"
#    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
#    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"

  Scenario Outline: new_report_trend_single
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "table_<typeChart>"
    And I click the button with text "table_<typeChart>"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<color>"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "NumericField" with value "cnt"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Green" button
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType |   typeChart    |  name      |  color  |
      |  WORD       | Single         | Single     |  Green  |


  Scenario Outline: new_report_trend_icon
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "table_<typeChart>"
    And I click the button with text "table_<typeChart>"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<color>_<iconValue>"
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
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType |   typeChart    |  name         |  color  |  iconValue |
      |  WORD       |    Single      | Single_icon   |  Red    | icon       |


  Scenario Outline: new_report_trend_font
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "table_<typeChart>"
    And I click the button with text "table_<typeChart>"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<color>_<fontValue>"
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
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType |   typeChart    |  name         |  color  |  fontValue        |
      |  WORD       |   Single       | Single_font   |  Orange | font-awesome-flag |


  Scenario Outline: new_report_trend_range_background
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "table_<typeChart>_Range"
    And I click the button with text "table_<typeChart>_Range"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<color1>_range"
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
    And I click the "Background" button
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType |   typeChart    |  name                 |  color1  |  color2 |
      |  WORD       |   Single       | Single_range_backgr   |  Yellow  | Orange  |


  Scenario Outline: new_report_trend_liquidfill
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "table_<typeChart>"
    And I click the button with text "table_<typeChart>"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<color>"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "cnt_perc"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType |   typeChart    |  name        |  color  |
      |  WORD       |   Liquidfill   | Liquidfill   |  Green  |


  Scenario Outline: new_report_trend_wordcloud
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "table_<typeChart>"
    And I click the button with text "table_<typeChart>"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<color>"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "count()"
    And I click the "Divide" button
    And I set the parameter "FieldValue" with value "apache.geo.city"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button
    When I click the "FinishButton" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType |   typeChart    |  name        |  color  |
      |  WORD       |   Wordcloud    | Wordcloud    |  Green  |

  Scenario Outline: new_report_trend_radar
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "table_Radar_Matr"
    And I click the button with text "table_Radar_Matr"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<color>"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "count()"
    And I click the "Indicator" button
    And I set the parameter "FieldValue" with value "apache.geo.city"
    And I click the "UnifyMetric" button
    And I click the "Divide" button
    And I click the "AddField" button

    And I set the parameter "FieldValue" with value "apache.geo.city"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType | typeChart   |  name     |   color  |
      |  WORD       | Radar       | Radar     | DarkBlue |


  Scenario Outline: new_report_trend_funnel
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "table_<typeChart>"
    And I click the button with text "table_<typeChart>"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>_<label>_<color>"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I click the "Value" button
    And I set the parameter "FieldValue" with value "count()"
    And I click the "Divide" button
    And I set the parameter "FieldValue" with value "apache.clientip"
    And I click the "Example" button
    And I click the "<label>" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType | typeChart   |  name     |   color    |   label          |
      |  WORD       | Funnel      | Funnel    | LightGreen | FirstPosition    |


  Scenario Outline: new_report_trend_matrixheatmap
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "table_Radar_Matr"
    And I click the button with text "table_Radar_Matr"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I click the "Xaxis" button
    And I set the parameter "FieldValue" with value "count()"
    And I click the "Yaxis" button
    And I set the parameter "FieldValue" with value "apache.status"
    And I set the parameter "Segments" with value "10"
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType | typeChart   |  name       |
      |  WORD       |Matrixheatmap|Matrixheatmap|


  Scenario Outline: new_report_trend_table
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "table_Funnel"
    And I click the button with text "table_Funnel"
    And I wait for "2000" millsecond
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>"
    And I click the "TrendChartType" button
    And I click the "Other" button
    And I click the "<typeChart>" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |  reportType | typeChart   |  name       |
      |  WORD       |  Table      |  Table      |
