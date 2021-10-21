@reportPreviewAll
Feature: 报表_预览_all

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  @reportPreviewPDF
  Scenario Outline: preview_pdf
    When I set the parameter "SearchInput" with value "<name>_PDF"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'<name>_PDF'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I click the "NextButton" button under some element
    And I wait for "5000" millsecond
    Then I will see the element "LastTrendTitle" contains "<name>"
    And I choose the "下载到本地预览" from the "Preview"
    And I wait for "10000" millsecond
    And I wait for "SuccessMessage" will be invisible
#    And I wait for element "SuccessMessage" change text to "下载到本地预览成功，请查看并下载完报表历史也最新文件"
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"

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
      |   Single_range_backgr|
      |   Liquidfill         |
      |   Wordcloud          |
      |   Radar              |
      |   Funnel             |
      |   Matrixheatmap      |
      |   Table              |
      |   Single_font        |

  @reportPreviewWORD
  Scenario Outline: preview_word
    When I set the parameter "SearchInput" with value "<name>_WORD"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'<name>_WORD'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I click the "NextButton" button under some element
    And I wait for "5000" millsecond
    Then I will see the "report.CreatePageWORD" page
    And I choose the "下载到本地预览" from the "Preview"
    And I wait for "SuccessMessage" will be visible
    And I wait for "35000" millsecond
    And I wait for "SuccessMessage" will be invisible
#    And I wait for element "SuccessMessage" change text to "下载到本地预览成功，请查看并下载完报表历史也最新文件"
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"

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

  @reportPreviewEXCEL
  Scenario Outline: preview_pdf
    When I set the parameter "SearchInput" with value "<name>_EXCEL"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'<name>_EXCEL'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I click the "NextButton" button under some element
    And I wait for "5000" millsecond
    Then I will see the element "LastTrendTitle" contains "<name>"
    And I choose the "下载到本地预览" from the "Preview"
    And I wait for "10000" millsecond
    And I wait for "SuccessMessage" will be invisible
#    And I wait for element "SuccessMessage" change text to "下载到本地预览成功，请查看并下载完报表历史也最新文件"
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"

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