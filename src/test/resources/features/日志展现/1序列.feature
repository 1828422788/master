@all @logDisplay @logDisplayOrder
Feature: 日志展现_1序列

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side

  @logDisplaySmoke
  Scenario Outline: 序列（曲线图，面积图，散点图，柱状图）(RZY-2770,2771,2769,2768)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.clientip,apache.method | sort by apache.clientip,cnt | limit 8"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/1序列_<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/1序列_<caseNum>_<chartType>" with target image "expect/高级搜索视图/1序列_<caseNum>_<chartType>"

    Examples:
      |   chartType   |   caseNum  |
      |   LineChart   |     2770   |
      |   AreaChart   |     2771   |
      |  ScatterChart |     2766   |
      |  ColumnChart  |     2768   |

  Scenario Outline: 曲线图(RZY-832)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.clientip,apache.method | sort by apache.clientip,cnt | limit 8"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "Yaxis" button
    And I wait for "1000" millsecond
    And I set the parameter "Unit" with value "<unitValue>"
    And I wait for "1000" millsecond
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "15"
    And I wait for "1000" millsecond
    And I click the "<buttonChoice>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/1序列_<caseNum>_<chartType>_<buttonChoice>"
    Then I compare source image "actual/高级搜索视图/1序列_<caseNum>_<chartType>_<buttonChoice>" with target image "expect/高级搜索视图/1序列_<caseNum>_<chartType>_<buttonChoice>"

    Examples:
      |   chartType   | unitValue  | buttonChoice      |  caseNum  |
      |   LineChart   |   个       | Smooth            | 832       |
      |   LineChart   |   个       | ConnectEmptyData  | 832       |

  Scenario Outline: 堆叠(RZY-2767,2773)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.clientip,apache.method | sort by apache.clientip,cnt | limit 8 "
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "Group" button
    And I click the "<buttonChoice>" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/1序列_<caseNum>_<chartType>_Pile"
    Then I compare source image "actual/高级搜索视图/1序列_<caseNum>_<chartType>_Pile" with target image "expect/高级搜索视图/1序列_<caseNum>_<chartType>_Pile"

    Examples:
      |   chartType   | buttonChoice  | color  |  caseNum  |
      |   AreaChart   |    Pile       | Red    | 2767      |
      |  ColumnChart  |    Pile       | Yellow | 2773      |

  Scenario Outline: 散点图 (RZY-4204)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.clientip,apache.method | sort by apache.clientip,cnt | limit 8"
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
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/1序列_<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/1序列_<caseNum>_<chartType>" with target image "expect/高级搜索视图/1序列_<caseNum>_<chartType>"

    Examples:
      |   chartType   |   bubbleSize |caseNum  |
      |  ScatterChart |    cnt       | bubbles   |


  Scenario Outline: 序列_分面
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.clientip,apache.method, apache.status | sort by cnt, apache.clientip"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Facet" button
    And I choose the "apache.method" from the "FieldValue"
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Group" button
    And I click the "DeleteLast" button
    And I choose the "apache.status" from the "FieldValue"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/1序列_分面_<chartType>"
    Then I compare source image "actual/高级搜索视图/1序列_分面_<chartType>" with target image "expect/高级搜索视图/1序列_分面_<chartType>"

    Examples:
      |   chartType   |
      |   LineChart   |
      |   AreaChart   |
      |  ScatterChart |
      |  ColumnChart  |

  Scenario Outline: 序列_标签
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.clientip | sort by cnt"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "<label>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button
    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I will see the element "BottomAxisLabel" contains "221.226.97.92"
    And I will see the element "BottomAxisLabel" transform contains "<angle>"

    Examples:
      |   chartType   | label      | angle      |
      |   LineChart   | FirstLabel | rotate(0)  |
      |   AreaChart   |            | rotate(-45)|
      |  ScatterChart | ThirdLabel | rotate(45) |
      |  ColumnChart  | ForthLabel | rotate(-90)|

  Scenario Outline: 序列_排序
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() by apache.geo.city | limit 5"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "<order>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button
    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I will see the element "BottomAxisLabel" contains "<value>"

    Examples:
      |   chartType   | order           | value     |
      |   AreaChart   |                 | 南京市    |
      |  ScatterChart | AscendingOrder  | 北京市    |
      |  ColumnChart  | DescendingOrder | 深圳市    |