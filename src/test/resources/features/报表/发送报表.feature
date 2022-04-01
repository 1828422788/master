@reportSend
Feature: 报表_发送

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible

  @reportSendPDF
  Scenario Outline: send_pdf
    When I set the parameter "SearchInput" with value "<name>_PDF"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>_PDF'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
    And I click the "NextButton" button under some element
    And I wait for "5000" millsecond
    Then I will see the element "LastTrendTitle" contains "<name>"
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
      |   Single_range_backgr|
      |   Ring_1             |
      |   Ring_2             |
      |   Liquidfill         |
      |   Wordcloud          |
      |   Radar              |
      |   Funnel             |
      |   Matrixheatmap      |
      |   Table              |
      |   Single_font        |

  @reportSendEXCEL
  Scenario Outline: send_excel
    When I set the parameter "SearchInput" with value "<name>_EXCEL"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>_EXCEL'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
    And I click the "NextButton" button under some element
    And I wait for "5000" millsecond
    Then I will see the element "LastTrendTitle" contains "<name>"
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

  @reportSendWORD
  Scenario Outline: send_word
    When I set the parameter "SearchInput" with value "<name>_WORD"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>_WORD'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
    And I click the "NextButton" button under some element
    And I wait for "5000" millsecond
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