@all @logDisplay @logDisplayOrder
Feature: 日志展现_序列

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side

  Scenario: click_chart
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "LineChart" button
    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And I click the "ChartElement" button
    And I wait for "5000" millsecond
    And switch to another window
    And I close all tabs except main tab
    And I wait for "3000" millsecond
    And I will see the "splSearch.SearchPage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the input element "SearchInput" value will be "starttime="now/d" endtime="now/d+24h" (tag:sample04061424_chart AND 'apache.clientip':221.226.97.92) AND 'apache.method':GET"
    And I will see the element "EventNumber" contains "31"


  Scenario Outline: order(RZY-2770,2771,2769,2768)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/1序列/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/1序列/<caseNum>_<chartType>" with target image "expect/高级搜索视图/1序列/<caseNum>_<chartType>"

    Examples:
      |   chartType   |   caseNum  |
      |   LineChart   |     2770   |
      |   AreaChart   |     2771   |
      |  ScatterChart |     2766   |
      |  ColumnChart  |     2768   |

  Scenario Outline: line(RZY-832)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Yaxis" button
    And I set the parameter "Unit" with value "<unitValue>"
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "15"
    And I click the "<buttonChoice>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/1序列/<caseNum>_<chartType>_<buttonChoice>"
    Then I compare source image "actual/高级搜索视图/1序列/<caseNum>_<chartType>_<buttonChoice>" with target image "expect/高级搜索视图/1序列/<caseNum>_<chartType>_<buttonChoice>"

    Examples:
      |   chartType   | unitValue  | buttonChoice      |  caseNum  |
      |   LineChart   |   个       | Smooth            | 832       |
      |   LineChart   |   个       | ConnectEmptyData  | 832       |

  Scenario Outline: pile(RZY-2767,2773)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip "
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Settings" button
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
    And take part of "Chart" with name "actual/高级搜索视图/1序列/<caseNum>_<chartType>_Pile"
    Then I compare source image "actual/高级搜索视图/1序列/<caseNum>_<chartType>_Pile" with target image "expect/高级搜索视图/1序列/<caseNum>_<chartType>_Pile"

    Examples:
      |   chartType   | buttonChoice  | color  |  caseNum  |
      |   AreaChart   |    Pile       | Red    | 2767      |
      |  ColumnChart  |    Pile       | Yellow | 2773      |

  Scenario Outline: scatter_bubble (RZY-4204)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Bubble" button
    And I click the "AccordingField" button
    And I choose the "<bubbleSize>" from the "BubbleSize" in config
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/1序列/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/1序列/<caseNum>_<chartType>" with target image "expect/高级搜索视图/1序列/<caseNum>_<chartType>"

    Examples:
      |   chartType   |   bubbleSize |caseNum  |
      |  ScatterChart |    cnt       | bubbles   |


  Scenario Outline: order_facet
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method, apache.status  \| sort by cnt, apache.clientip"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Facet" button
    And I choose the "apache.method" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Group" button
    And I click the "DeleteLast" button
    And I choose the "apache.status" from the "FieldValue" in config
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/高级搜索视图/1序列/分面_<chartType>"
    Then I compare source image "actual/高级搜索视图/1序列/分面_<chartType>" with target image "expect/高级搜索视图/1序列/分面_<chartType>"

    Examples:
      |   chartType   |
      |   LineChart   |
      |   AreaChart   |
      |  ScatterChart |
      |  ColumnChart  |