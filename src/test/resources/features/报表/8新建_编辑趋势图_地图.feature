@reportCreateCharts
Feature: 报表新建_编辑_地图
#6

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to "admin"
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameter "Hour" with value "05"
    And I set the parameter "Minute" with value "50"
#    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"


  Scenario Outline: new_report_trend_heatmap
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
    And I click the "Map" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "count()"
    And I click the "Divide" button
    And I set the parameter "FieldValue" with value "apache.geo.city"
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @all @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart    |  name      |
      |  PDF        | Heatmap        | Heatmap    |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart    |  name      |
      |  EXCEL      | Heatmap        | Heatmap    |

  Scenario Outline: new_report_trend_attackmap
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "table_<name>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "table_<name>"
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<region>"
    And I click the "TrendChartType" button
    And I click the "Map" button
    And I click the "Attackmap" button

    When I click the "ParameterSetting" button
    And I click the "Source" button
    And I set the parameter "FieldValue" with value "apache.clientip"
    And I set the parameter "FieldLongitude" with value "clientlon"
    And I set the parameter "FieldLatitude" with value "clientlat"
    And I click the "Target" button
    And I set the parameter "FieldValue" with value "gw_address"
    And I set the parameter "FieldLongitude" with value "gw_lon"
    And I set the parameter "FieldLatitude" with value "gw_lat"
    And I click the "Weight" button
    And I set the parameter "FieldValue" with value "cnt"
    And I click the "Region" button
    And I click the "Select<region>" button
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @all @report @reportChartsPDF
    Examples:
      |  reportType |   region         |  name               |
      |  PDF        |   World          | Attackmap_World     |
      |  PDF        |   China          | Attackmap_China     |

    @reportChartsEXCEL
    Examples:
      |  reportType |   region         |  name               |
      |  EXCEL      |   World          | Attackmap_World     |
      |  EXCEL      |   China          | Attackmap_China     |

  Scenario Outline: new_report_trend_regionmap
    When I set the parameter "Name" with value "<name>_<reportType>"
    And I choose the "<reportType>" from the "ReportType"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "<table>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<table>"
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<typeChart>"
    And I click the "TrendChartType" button
    And I click the "Map" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "count()"
    And I click the "Divide" button
    And I set the parameter "FieldValue" with value "<divideField>"
    And I click the "Region" button
    And I click the "Select<region>" button
    And I click the "GoingDown" button
    And I set the parameter "Province" with value "<province>"
    And I set the parameter "City" with value "<city>"


    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @all @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart |  name             |   divideField       |   province          |   city          |  region |  table                  |
      |  PDF        | Regionmap   | Regionmap_World   | apache.geo.country  |     无              |   无            |  World  | table_Regionmap         |
      |  PDF        | Regionmap   | Regionmap_China   | apache.geo.province | apache.geo.province | apache.geo.city |  China  | table_Regionmap         |
      |  PDF        | Regionmap   | Regionmap_Jiangsu | apache.geo.city     | apache.geo.city     | apache.geo.city |  Jiangsu| table_Regionmap_Jiangsu |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart |  name             |   divideField       |   province          |   city          |  region |  table                  |
      |  EXCEL      | Regionmap   | Regionmap_World   | apache.geo.country  |     无              |   无            |  World  | table_Regionmap         |
      |  EXCEL      | Regionmap   | Regionmap_China   | apache.geo.province | apache.geo.province | apache.geo.city |  China  | table_Regionmap         |
      |  EXCEL      | Regionmap   | Regionmap_Jiangsu | apache.geo.city     | apache.geo.city     | apache.geo.city |  Jiangsu| table_Regionmap_Jiangsu |