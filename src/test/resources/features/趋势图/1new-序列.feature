@trend @createTrendOrder @createTrend
Feature: 趋势图新建_序列

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"


  Scenario Outline: 序列（曲线图，面积图，散点图，柱状图）(RZY-2477,2005,2491,2499)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.clientip,apache.method | sort by apache.clientip,cnt | limit 8 "
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'<chartType>_<caseNum>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<chartType>_<caseNum>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<chartType>Element" will be visible

    @trendSmoke
    Examples:
    |   chartType   |caseNum  |
    |    LineChart  |  2477   |
    |   AreaChart   |  2005   |

    Examples:
    |   chartType   |caseNum  |
    |  ScatterChart |  2491   |
    |  ColumnChart  |  2499   |

  Scenario Outline: order
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.clientip,apache.method | sort by apache.clientip,cnt | limit 8 "
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "ShowAllLabels" button
    And I click the "Group" button
    And I wait for "1000" millsecond
    And I click the "<buttonChoice>" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<buttonChoice>"
    And I compare source image "actual/<chartType>_<buttonChoice>" with target image "expect/<chartType>_<buttonChoice>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<buttonChoice>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   | buttonChoice  | color  |
      |   AreaChart   |    Pile       | Red    |
      |  ColumnChart  |    Pile       | Yellow |

  Scenario Outline: order_bubble
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.clientip,apache.method | sort by cnt, apache.clientip"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Type" button
    And I click the "Settings" button
    And I click the "ShowAllLabels" button
    And I click the "Bubble" button
    And I click the "AccordingField" button
    And I wait for "1000" millsecond
    And I choose the "<bubbleSize>" from the "BubbleSize"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |   bubbleSize |caseNum  |
      |  ScatterChart |    cnt       | bubbles   |

  Scenario Outline: order_switch
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.clientip,apache.method | sort by apache.clientip,cnt | limit 8"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "ShowAllLabels" button
    And I click the "Yaxis" button
    And I wait for "1000" millsecond
    And I set the parameter "Unit" with value "<unitValue>"
    And I wait for "1000" millsecond
    And I click the "<buttonChoice>" button
    And I wait for "1000" millsecond
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value "10"
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>_<buttonChoice>"
    And I compare source image "actual/<chartType>_<caseNum>_<buttonChoice>" with target image "expect/<chartType>_<caseNum>_<buttonChoice>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>_<buttonChoice>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   | unitValue  | buttonChoice      |  caseNum  |
      |   LineChart   |   个       | Smooth            |  2479     |
      |   LineChart   |   pcs.     | ConnectEmptyData  |  2479     |
      |   AreaChart   |   个       | Smooth            |  2483     |
      |   AreaChart   |   pcs.     | ConnectEmptyData  |  2483     |


  Scenario Outline: order_limit
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.clientip,apache.method | sort by apache.clientip,cnt | limit 8"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Type" button
    And I click the "Settings" button
    And I click the "ShowAllLabels" button
    And I click the "Yaxis" button
    And I wait for "1000" millsecond
    And I set the parameter "Unit" with value "<unitValue>"
    And I wait for "1000" millsecond
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "10"
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "StatisticalChart" will be visible
    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>_limit"
    And I compare source image "actual/<chartType>_<caseNum>_limit" with target image "expect/<chartType>_<caseNum>_limit"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>_limit"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType    | unitValue  |  caseNum  |
      |   ScatterChart |   个       |  2492     |
      |   ColumnChart  |   pcs.     |  2500     |


  Scenario Outline: order_facet
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method, apache.status  \| sort by cnt, apache.clientip "
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "Facet" button
    And I choose the "apache.method" from the "FieldValue"
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Group" button
    And I click the "DeleteLast" button
    And I choose the "apache.status" from the "FieldValue"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "<chartType>Element" will be visible
    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_分面"
    And I compare source image "actual/<chartType>_分面" with target image "expect/<chartType>_分面"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_分面"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |
      |    LineChart  |
      |   AreaChart   |
      |  ScatterChart |
      |  ColumnChart  |