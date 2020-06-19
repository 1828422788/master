@all @logDisplay @logDisplayOther
Feature: 日志展现_其它_环形比例图

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline:  ringchart_onefield(RZY-4198,4199)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue" in config
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<chartType>/<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>/<caseNum>" with target image "expect/高级搜索视图/6其它/<chartType>/<caseNum>"

    Examples:
      |  chartType    |  caseNum  |   spl   |
      |   Ring        |  onefield |starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |

  Scenario Outline:  ringchart_twofields(RZY-4200)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue" in config
    And I click the "Compare" button
    And I click the "AddField" button
    And I choose the "count2_perc" from the "FieldValue" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<chartType>/<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>/<caseNum>" with target image "expect/高级搜索视图/6其它/<chartType>/<caseNum>"

    Examples:
      |  chartType    |  caseNum  |   spl   |
      |   Ring        |  twofields|starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |

  Scenario Outline:  ringchart_table(RZY-4201)
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" <spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue" in config
    And I click the "Compare" button
    And I click the "AddField" button
    And I choose the "count2_perc" from the "FieldValue" in config
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.clientip" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "<rows>"
    And I set the parameter "ColumnNum" with value "<columns>"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<chartType>/<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>/<caseNum>" with target image "expect/高级搜索视图/6其它/<chartType>/<caseNum>"

    Examples:
      |  chartType    |    caseNum   | rows    |  columns  |   spl   |
      |   Ring        | table_3r_2c  |  3      |   2       | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |
      |   Ring        | table_1r_4c  |  1      |   4       | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |


  Scenario Outline:  ringchart_colors(RZY-4202)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue" in config
    And I click the "Compare" button
    And I click the "AddField" button
    And I choose the "count2_perc" from the "FieldValue" in config
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.clientip" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "<rows>"
    And I set the parameter "ColumnNum" with value "<columns>"
    And I click the "Exhibition" button
    And I click the "AccordingArea" button

    And I set the parameter "MinRange" with value "0"
    And I set the parameter "MaxRange" with value "0.2"
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "AddRange" button

    And I set the parameter "MinRange" with value "0.2"
    And I set the parameter "MaxRange" with value "0.7"
    And I click the "AddColor" button
    And I click the "Yellow" button
    And I click the "AddRange" button

    And I set the parameter "MinRange" with value "0.7"
    And I set the parameter "MaxRange" with value "1"
    And I click the "AddColor" button
    And I click the "Green" button

    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<chartType>/<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>/<caseNum>" with target image "expect/高级搜索视图/6其它/<chartType>/<caseNum>"

    Examples:
      |  chartType    |    caseNum          | rows    |  columns  |   spl   |
      |   Ring        | table_1r_3c_colors  |  1      |   3       | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |

  Scenario Outline:  ringchart_precision(RZY-4203)
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/51 \| eval count2_perc=ip_count/204 \| limit 6 "
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue" in config
    And I click the "Compare" button
    And I click the "AddField" button
    And I choose the "count2_perc" from the "FieldValue" in config
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.clientip" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "2"
    And I set the parameter "ColumnNum" with value "3"
    And I click the "Exhibition" button
    And I choose the "<num>" from the "Precision"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<chartType>/<caseNum><num>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>/<caseNum><num>" with target image "expect/高级搜索视图/6其它/<chartType>/<caseNum><num>"

    Examples:
      |  chartType    |  num |   caseNum       |
      |   Ring        |  1   |    Precision    |
      |   Ring        |  2   |    Precision    |
      |   Ring        |  3   |    Precision    |