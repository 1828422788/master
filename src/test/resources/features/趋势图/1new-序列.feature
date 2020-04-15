@all @trend @createTrendOrder @createTrend
Feature: 趋势图新建_序列
# 13
# sample04061424_chart for Today

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: order(RZY-2477,2005,2491,2499)
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
    And I compare source image "expect/<chartType>_<caseNum>.png" with target image "actual/<chartType>_<caseNum>.png"

    Examples:
    |   chartType   |caseNum  |  spl  |
    |    LineChart  |  2477   | tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip |
    |   AreaChart   |  2005   | tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip |
    |  ScatterChart |  2491   | tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip |
    |  ColumnChart  |  2499   | tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip |

  Scenario Outline: order
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
    And I compare source image "expect/<chartType>_<buttonChoice>.png" with target image "actual/<chartType>_<buttonChoice>.png"

    Examples:
      |   chartType   | buttonChoice  | color  |  caseNum  |   spl|
      |   AreaChart   |    Pile       | Red    | 2767      |  tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip  |
      |  ColumnChart  |    Pile       | Yellow | 2773      |  tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip  |

  Scenario Outline: order_bubble
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
    And I compare source image "expect/<chartType>_<caseNum>.png" with target image "actual/<chartType>_<caseNum>.png"

    Examples:
      |   chartType   |   bubbleSize |caseNum  |
      |  ScatterChart |    count()   | bubbles   |

  Scenario Outline: order_switch
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
    And I compare source image "expect/<chartType>_<caseNum>_<buttonChoice>.png" with target image "actual/<chartType>_<caseNum>_<buttonChoice>.png"

    Examples:
      |   chartType   | unitValue  | buttonChoice      |  caseNum  |
      |   LineChart   |   个       | Smooth            |  2479     |
      |   LineChart   |   pcs.     | ConnectEmptyData  |  2479     |
      |   AreaChart   |   个       | Smooth            |  2483     |
      |   AreaChart   |   pcs.     | ConnectEmptyData  |  2483     |


  Scenario Outline: order_limit
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
    And I compare source image "expect/<chartType>_<caseNum>_limit.png" with target image "actual/<chartType>_<caseNum>_limit.png"

    Examples:
      |   chartType    | unitValue  |  caseNum  |
      |   ScatterChart |   个       |  2492     |
      |   ColumnChart  |   pcs.     |  2500     |