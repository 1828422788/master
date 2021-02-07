@reportCreateCharts @allReports
Feature: 报表新建_编辑_地图
#6

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now

  Scenario Outline: new_report_trend_heatmap
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
    And I set the parameter "TrendDescribeField" with value "<typeChart>"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | stats count() by apache.geo.city" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "Map" button
    And I click the "<typeChart>" button

    When I click the "ParameterSetting" button
    And I set the parameter "FieldValue" with value "count()"
    And I click the "Divide" button
    And I set the parameter "FieldValue" with value "apache.geo.city"
    And I click the "ParameterSetting" button
    Then I click the "EnsureButton" button

    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @report @reportChartsPDF
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
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试"
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the parameter "TrendDescribeField" with value "<region>"
    And I set the value "<SPL>" to the textarea "TrendSplField"
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

    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @report @reportChartsPDF
    Examples:
      |  reportType |   region         |  name               | SPL |
      |  PDF        |   World          | Attackmap_World     | starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart \| parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 \|eval clientlon= -0.127758 \| eval clientlat=51.507 |
      |  PDF        |   China          | Attackmap_China     | starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart \| parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 \|eval clientlon= 114.109467 \| eval clientlat=22.39642   |

    @reportChartsEXCEL
    Examples:
      |  reportType |   region         |  name               | SPL |
      |  EXCEL      |   World          | Attackmap_World     | starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart \| parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 \|eval clientlon= -0.127758 \| eval clientlat=51.507 |
      |  EXCEL      |   China          | Attackmap_China     | starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart \| parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 \|eval clientlon= 114.109467 \| eval clientlat=22.39642   |

  Scenario Outline: new_report_trend_regionmap
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
    And I set the parameter "TrendDescribeField" with value "<typeChart>"
    And I set the value "<SPL>" to the textarea "TrendSplField"
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

    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @report @reportChartsPDF
    Examples:
      |  reportType |   typeChart |  name             |   divideField       |   province          |   city          |  region | SPL |
      |  PDF        | Regionmap   | Regionmap_World   | apache.geo.country  |     无              |   无            |  World  | starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |
      |  PDF        | Regionmap   | Regionmap_China   | apache.geo.province | apache.geo.province | apache.geo.city |  China  | starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |
      |  PDF        | Regionmap   | Regionmap_Jiangsu | apache.geo.city     | apache.geo.city     | apache.geo.city |  Jiangsu| starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart \| stats count() by apache.geo.city |

    @reportChartsEXCEL
    Examples:
      |  reportType |   typeChart |  name             |   divideField       |   province          |   city          |  region | SPL |
      |  EXCEL      | Regionmap   | Regionmap_World   | apache.geo.country  |     无              |   无            |  World  | starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |
      |  EXCEL      | Regionmap   | Regionmap_China   | apache.geo.province | apache.geo.province | apache.geo.city |  China  | starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |
      |  EXCEL      | Regionmap   | Regionmap_Jiangsu | apache.geo.city     | apache.geo.city     | apache.geo.city |  Jiangsu| starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart \| stats count() by apache.geo.city |