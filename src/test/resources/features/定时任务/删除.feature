Feature: 定时任务删除

  Scenario Outline: 删除定时任务
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

    @cleanTimedTask
    Examples:
    |    name            |
    |  sql_server_3358   |
    |  mysql_3357        |
    |  oracle_3301       |
    |  recent1d          |
    |  recent2d          |
    |  recent7d          |
    |  interval_date     |
    |  today             |
    |  yesterday         |
    |  thisWeek          |
    |  lastWeek          |
    |  thisMonth         |
    |  lastMonth         |
    |  crontab_every15th |
    |  crontab_9_930     |
    |  crontab_mon_fri   |
    |  crontab_5h        |
    |  crontab_57min     |
    |  crontab_3min      |
    |  Test_StartTomorrow|

    @cleanSaveAsTimedTask
    Examples:
      |    name             |
      |  3352_Chain         |
      |  3351_Matrixheatmap |
      |  3350_Funnel        |
      |  3349_Radar         |
      |  3348_Sequence      |
      |  3347_Wordcloud     |
      |  3346_Liquidfill    |
      |  4411_Ring          |
      |  3345_Single        |
      |  3344_Statisticalmap|
      |  3343_Regionmap     |
      |  3342_Attackmap     |
      |  3341_Heatmap       |
      |  3340_Multiaxis     |
      |  3339_Rangeline     |
      |  3338_Force         |
      |  3337_Sankey        |
      |  3336_Chord         |
      |  3335_Sun           |
      |  3334_Bar           |
      |  3333_Rose          |
      |  3332_Pie           |
      |  3331_ColumnChart   |
      |  3330_ScatterChart  |
      |  3329_AreaChart     |
      |  3328_LineChart     |

  @cleanTimedTask
  Scenario Outline: 删除补采任务
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
    And I click the "Complement" button
    When the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      |    name              |
      | Test_Complement      |
      | Test_Complement_2    |
