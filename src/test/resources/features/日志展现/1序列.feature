@all @logDisplay @logDisplayOrder
Feature: 日志展现_序列


  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: order(RZY-2770,2771,2769,2768)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button

    And I click the "Type" button
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
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
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
      |   chartType   | unitValue  | buttonChoice      |  caseNum  |   spl|
      |   LineChart   |   个       | Smooth            | 832       |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip  |
      |   LineChart   |   个       | ConnectEmptyData  | 832       |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip  |

  Scenario Outline: pile(RZY-2767,2773)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
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
      |   chartType   | buttonChoice  | color  |  caseNum  |   spl|
      |   AreaChart   |    Pile       | Red    | 2767      |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip  |
      |  ColumnChart  |    Pile       | Yellow | 2773      |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip  |

  Scenario Outline: scatter_bubble (RZY-4204)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Settings" button
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
    And take part of "Chart" with name "actual/高级搜索视图/1序列/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/1序列/<caseNum>_<chartType>" with target image "expect/高级搜索视图/1序列/<caseNum>_<chartType>"

    Examples:
      |   chartType   |   bubbleSize |caseNum  |
      |  ScatterChart |    cnt       | bubbles   |