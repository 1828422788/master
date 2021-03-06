@checkAllFiles
Feature: 报表_检查文件
# Verifying that files were generated

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible

  @checkFilesPDF @checkFiles
  Scenario Outline: check_type_pdf
    When I set the parameter "TextFilter" with value "<name>_PDF"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>_PDF'}" then i click the "<name>_PDF" button
    Then I will see the element "LastGeneratedReport" contains ".pdf"

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
      |   Bar3               |
      |   Bar4               |
      |   Sunburst           |
      |   Pie_1              |
      |   Pie_2              |
      |   Flame              |
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
      |   Ring_1             |
      |   Ring_2             |
      |   Liquidfill         |
      |   Wordcloud          |
      |   Radar              |
      |   Funnel             |
      |   Matrixheatmap      |
      |   Table              |

  @checkFilesEXCEL
  Scenario Outline: check_type_excel
    When I set the parameter "TextFilter" with value "<name>_EXCEL"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>_EXCEL'}" then i click the "<name>_EXCEL" button
    Then I will see the element "LastGeneratedReport" contains ".xlsx"

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
      |   Bar3               |
      |   Bar4               |
      |   Sunburst           |
      |   Pie_1              |
      |   Pie_2              |
      |   Flame              |
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
      |   Ring_1             |
      |   Ring_2             |
      |   Liquidfill         |
      |   Wordcloud          |
      |   Radar              |
      |   Funnel             |
      |   Matrixheatmap      |
      |   Table              |

  @checkFilesWORD
  Scenario Outline: check_type_word
    When I set the parameter "TextFilter" with value "<name>_WORD"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>_WORD'}" then i click the "<name>_WORD" button
    Then I will see the element "LastGeneratedReport" contains ".docx"

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
      |   Bar3               |
      |   Bar4               |
      |   Sunburst           |
      |   Pie_1              |
      |   Pie_2              |
      |   Flame              |
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
      |   Ring_1             |
      |   Ring_2             |
      |   Liquidfill         |
      |   Wordcloud          |
      |   Radar              |
      |   Funnel             |
      |   Matrixheatmap      |
      |   Table              |