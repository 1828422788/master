@all @trend @createTrendOrder @createTrend
Feature: 趋势图新建_序列
# sample04061424_chart for Today

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario Outline: order(RZY-2477,2005,2491,2499)
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
    And I compare source image "expect/<chartType>_<caseNum>" with target image "actual/<chartType>_<caseNum>"

    Examples:
    |   chartType   |caseNum  |  spl  |
    |    LineChart  |  2477   | tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip |
    |   AreaChart   |  2005   | tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip |
    |  ScatterChart |  2491   | tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip |
    |  ColumnChart  |  2499   | tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip |

  Scenario Outline: order
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "ShowAllLabels" button
    And I click the "Group" button
    And I click the "<buttonChoice>" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/<chartType>_<buttonChoice>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<buttonChoice>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
    And I compare source image "expect/<chartType>_<buttonChoice>" with target image "actual/<chartType>_<buttonChoice>"

    Examples:
      |   chartType   | buttonChoice  | color  |  caseNum  |   spl|
      |   AreaChart   |    Pile       | Red    | 2767      |  tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip  |
      |  ColumnChart  |    Pile       | Yellow | 2773      |  tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip  |

  Scenario Outline: order_bubble
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "ShowAllLabels" button
    And I click the "Bubble" button
    And I click the "AccordingField" button
    And I choose the "<bubbleSize>" from the "BubbleSize"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
    And I compare source image "expect/<chartType>_<caseNum>" with target image "actual/<chartType>_<caseNum>"

    Examples:
      |   chartType   |   bubbleSize |caseNum  |
      |  ScatterChart |    cnt       | bubbles   |

  Scenario Outline: order_switch
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "ShowAllLabels" button
    And I click the "Yaxis" button
    And I set the parameter "Unit" with value "<unitValue>"
    And I click the "<buttonChoice>" button
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value "10"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/<chartType>_<caseNum>_<buttonChoice>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>_<buttonChoice>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
    And I compare source image "expect/<chartType>_<caseNum>_<buttonChoice>" with target image "actual/<chartType>_<caseNum>_<buttonChoice>"

    Examples:
      |   chartType   | unitValue  | buttonChoice      |  caseNum  |
      |   LineChart   |   个       | Smooth            |  2479     |
      |   LineChart   |   pcs.     | ConnectEmptyData  |  2479     |
      |   AreaChart   |   个       | Smooth            |  2483     |
      |   AreaChart   |   pcs.     | ConnectEmptyData  |  2483     |


  Scenario Outline: order_limit
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "ShowAllLabels" button
    And I click the "Yaxis" button
    And I set the parameter "Unit" with value "<unitValue>"
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "10"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/<chartType>_<caseNum>_limit"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>_limit"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
    And I compare source image "expect/<chartType>_<caseNum>_limit" with target image "actual/<chartType>_<caseNum>_limit"

    Examples:
      |   chartType    | unitValue  |  caseNum  |
      |   ScatterChart |   个       |  2492     |
      |   ColumnChart  |   pcs.     |  2500     |

    @compareTrend @compareTrendOrder
  Scenario Outline: compare_view
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    And the data name is "{'column':'0','name':'<name>'}" then i click the "展示趋势图" button
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the "NoData" doesn't exist
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And I will see the element "ChartName" contains "<name>"
    And take part of "ChartView" with name "actual_view/<name>"
    And I compare source image "expect_view/<name>" with target image "actual_view/<name>"

    Examples:
      | name                                     |
      | ScatterChart_2492_limit                  |
      | ColumnChart_2500_limit                   |
      | AreaChart_2483_ConnectEmptyData          |
      | AreaChart_2483_Smooth                    |
      | LineChart_2479_ConnectEmptyData          |
      | LineChart_2479_Smooth                    |
      | ScatterChart_bubbles                     |
      | ColumnChart_Pile                         |
      | AreaChart_Pile                           |
      | ColumnChart_2499                         |
      | ScatterChart_2491                        |
      | AreaChart_2005                           |
      | LineChart_2477                           |