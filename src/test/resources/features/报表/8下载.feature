@reportDownload
Feature: 报表_下载

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  @reportLayout @report
  Scenario Outline: download_layout
    When I set the parameter "SearchInput" with value "report_Layout_<layout>"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'report_Layout_<layout>'}" then i click the "report_Layout_<layout>" button
    And I wait for element "SelectedReport" change text to "report_Layout_<layout>"
    Then I will see the element "LastGeneratedReport" contains ".pdf"
    And I click the "Download" button
    And I wait for "4000" millsecond
    And I download the latest report to local
    And I wait for "4000" millsecond
    Then I compare source report file "expect/report_Layout_<layout>.pdf" with target report file "report_Layout_<layout>.pdf"

    Examples:
      | layout |
      | 1      |
      | 2      |
      | 3      |
      | 4      |
      | 5      |
      | 6      |
      | 7      |
      | 8      |

  @reportDownloadPDF @report
  Scenario Outline: download_pdf
    When I set the parameter "SearchInput" with value "<name>_PDF"
    And I wait for "2500" millsecond
    And the data name is "{'column':'1','name':'<name>_PDF'}" then i click the "<name>_PDF" button
    And I wait for element "SelectedReport" change text to "<name>_PDF"
    Then I will see the element "LastGeneratedReport" contains ".pdf"
    And I click the "Download" button
    And I wait for "4000" millsecond
    And I download the latest report to local
    And I wait for "2000" millsecond
    Then I compare source report file "expect/<name>_PDF.pdf" with target report file "<name>_PDF.pdf"

    Examples:
      |          name        |
      |   LineChart          |
      |   AreaChart          |
      |   AreaChart_Pile     |
      |   ColumnChart_Pile   |
      |   ScatterChart       |
      |   Timechart1         |
      |   Timechart2         |
      |   Pie                |
      |   Rose               |
      |   Bar                |
      |   Sun                |
      |   Bar1               |
      |   Bar2               |
      |   Sunburst           |
      |   Chord              |
      |   Sankey             |
      |   Force              |
      |   Sankey_Mult        |
      |   Rangeline          |
      |   Multiaxis          |
      |   Multiaxis_2        |
      |   Heatmap            |
      |   Attackmap_World    |
      |   Attackmap_China    |
      |   Regionmap_World    |
      |   Regionmap_China    |
      |   Regionmap_Jiangsu_1|
      |   Regionmap_Jiangsu_2|
      |   Single             |
      |   Single_icon        |
      |   Single_font        |
      |   Single_range_backgr|
      |   Liquidfill         |
      |   Wordcloud          |
      |   Radar              |
      |   Funnel             |
      |   Matrixheatmap      |
      |   Table              |

  @reportDownloadEXCEL
  Scenario Outline: download_excel
    When I set the parameter "SearchInput" with value "<name>_EXCEL"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'<name>_EXCEL'}" then i click the "<name>_EXCEL" button
    And I wait for element "SelectedReport" change text to "<name>_EXCEL"
    Then I will see the element "LastGeneratedReport" contains ".xlsx"
    And I click the "Download" button
    And I wait for "4000" millsecond
    And I download the latest report to local
#    And I wait for "2000" millsecond
#    Then I compare source report file "expect/<name>_EXCEL.xlsx" with target report file "<name>_EXCEL.xlsx"

    Examples:
      |          name        |
      |   LineChart          |
      |   AreaChart          |
      |   AreaChart_Pile     |
      |   ColumnChart_Pile   |
      |   ScatterChart       |
      |   Timechart1         |
      |   Timechart2         |
      |   Pie                |
      |   Rose               |
      |   Bar                |
      |   Sun                |
      |   Bar1               |
      |   Bar2               |
      |   Sunburst           |
      |   Chord              |
      |   Sankey             |
      |   Force              |
      |   Sankey_Mult        |
      |   Rangeline          |
      |   Multiaxis          |
      |   Multiaxis_2        |
      |   Heatmap            |
      |   Attackmap_World    |
      |   Attackmap_China    |
      |   Regionmap_World    |
      |   Regionmap_China    |
      |   Regionmap_Jiangsu_1|
      |   Regionmap_Jiangsu_2|
      |   Single             |
#      |   Single_icon        |
#      |   Single_font        |
      |   Single_range_backgr|
      |   Liquidfill         |
      |   Wordcloud          |
      |   Radar              |
      |   Funnel             |
      |   Matrixheatmap      |
      |   Table              |

  @reportDownloadWORD
  Scenario Outline: download_word
    When I set the parameter "SearchInput" with value "<name>_WORD"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'<name>_WORD'}" then i click the "<name>_WORD" button
    And I wait for element "SelectedReport" change text to "<name>_WORD"
    Then I will see the element "LastGeneratedReport" contains ".docx"
    And I click the "Download" button
    And I wait for "4000" millsecond
    And I download the latest report to local
#    And I wait for "2000" millsecond
#    Then I compare source report file "expect/<name>_WORD.docx" with target report file "<name>_WORD.docx"

    Examples:
      |          name        |
      |   LineChart          |
      |   AreaChart          |
      |   AreaChart_Pile     |
      |   ColumnChart_Pile   |
      |   ScatterChart       |
      |   Timechart1         |
      |   Timechart2         |
      |   Pie                |
      |   Rose               |
      |   Bar                |
      |   Sun                |
      |   Bar1               |
      |   Bar2               |
      |   Sunburst           |
      |   Chord              |
      |   Sankey             |
      |   Force              |
      |   Sankey_Mult        |
      |   Rangeline          |
      |   Multiaxis          |
      |   Multiaxis_2        |
      |   Heatmap            |
      |   Attackmap_World    |
      |   Attackmap_China    |
      |   Regionmap_World    |
      |   Regionmap_China    |
      |   Regionmap_Jiangsu_1|
      |   Regionmap_Jiangsu_2|
      |   Single             |
      |   Single_icon        |
      |   Single_font        |
      |   Single_range_backgr|
      |   Liquidfill         |
      |   Wordcloud          |
      |   Radar              |
      |   Funnel             |
      |   Matrixheatmap      |
      |   Table              |

  @reportDownloadPDF @reportDownloadEXCEL @reportDownloadWORD
  Scenario: report_list_button
    When I click the "ReportListButton" button
    Then I wait for "SelectedReport" will be visible
    And I wait for element "SelectedReport" change text to "全部报表文件"
    And I wait for "5000" millsecond
    And I wait for "LastGeneratedReport" will be visible