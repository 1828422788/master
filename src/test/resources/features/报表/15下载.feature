@reportDownload
Feature: 报表_下载

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  @reportDownloadPDF
  Scenario Outline: download_pdf
    When I set the parameter "SearchInput" with value "<name>_PDF"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'<name>_PDF'}" then i click the "<name>_PDF" button
    And I wait for element "SelectedReport" change text to "<name>_PDF"
    Then I will see the element "LastGeneratedReport" contains ".pdf"
    And I click the "Download" button

    Examples:
      |          name        |
      |   Table              |
      |   Matrixheatmap      |
      |   Funnel             |
      |   Radar              |
      |   Wordcloud          |
      |   Liquidfill         |
      |   Single_range_backgr|
      |   Single_font        |
      |   Single_icon        |
      |   Single             |
      |   Regionmap_Jiangsu  |
      |   Regionmap_China    |
      |   Regionmap_World    |
      |   Attackmap_China    |
      |   Attackmap_World    |
      |   Heatmap            |
      |   Multiaxis          |
      |   Rangeline          |
      |   Sankey_Mult        |
      |   Force              |
      |   Sankey             |
      |   Chord              |
      |   Bar2               |
      |   Bar1               |
      |   Sun                |
      |   Bar                |
      |   Rose               |
      |   Pie                |
      |   ScatterChart       |
      |   ColumnChart_Pile   |
      |   AreaChart_Pile     |
      |   AreaChart          |
      |   LineChart          |

  @reportDownloadEXCEL
  Scenario Outline: download_excel
    When I set the parameter "SearchInput" with value "<name>_EXCEL"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'<name>_EXCEL'}" then i click the "<name>_EXCEL" button
    And I wait for element "SelectedReport" change text to "<name>_EXCEL"
    Then I will see the element "LastGeneratedReport" contains ".xls"
    And I click the "Download" button

    Examples:
      |          name        |
      |   Table              |
      |   Matrixheatmap      |
      |   Funnel             |
      |   Radar              |
      |   Wordcloud          |
      |   Liquidfill         |
      |   Single_range_backgr|
#      |   Single_font        |
#      |   Single_icon        |
      |   Single             |
      |   Regionmap_Jiangsu  |
      |   Regionmap_China    |
      |   Regionmap_World    |
      |   Attackmap_China    |
      |   Attackmap_World    |
      |   Heatmap            |
      |   Multiaxis          |
      |   Rangeline          |
      |   Sankey_Mult        |
      |   Force              |
      |   Sankey             |
      |   Chord              |
      |   Bar2               |
      |   Bar1               |
      |   Sun                |
      |   Bar                |
      |   Rose               |
      |   Pie                |
      |   ScatterChart       |
      |   ColumnChart_Pile   |
      |   AreaChart_Pile     |
      |   AreaChart          |
      |   LineChart          |

  @reportDownloadPDF @reportDownloadEXCEL
  Scenario: report_list_button
    When I click the "ReportListButton" button
    Then I wait for "SelectedReport" will be visible
    And I wait for element "SelectedReport" change text to "全部报表文件"
    And I wait for "5000" millsecond
    And I wait for "LastGeneratedReport" will be visible