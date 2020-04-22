@checkAllFiles
Feature: 报表_检查文件
# Verifying that files were generated

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  @checkFilesPDF @checkFiles
  Scenario Outline: check_type_pdf
    When I set the parameter "SearchInput" with value "<name>_PDF"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>_PDF'}" then i click the "<name>_PDF" button
    Then I will see the element "LastGeneratedReport" contains ".pdf"

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

  @checkFilesEXCEL
  Scenario Outline: check_type_excel
    When I set the parameter "SearchInput" with value "<name>_EXCEL"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>_EXCEL'}" then i click the "<name>_EXCEL" button
    Then I will see the element "LastGeneratedReport" contains ".xls"

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