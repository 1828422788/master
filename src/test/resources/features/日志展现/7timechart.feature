@all @logDisplay @logDisplayTimechart
Feature: 日志展现_7timechart

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side

  Scenario Outline: timechart（RZY-3092,3247,3094,3248,3096,3249,3098,3250)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/7timechart_<caseNum>"
    Then I compare source image "actual/高级搜索视图/7timechart_<caseNum>" with target image "expect/高级搜索视图/7timechart_<caseNum>"

    Examples:
      |  caseNum    |   spl|
      | 3092_line   |  tag:sample04061424_chart \| timechart cont=true span=30m rendertype=\"line\" count() min(apache.resp_len) by apache.status  |
      | 3247_line   |  tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=0 endindex=8 limit=5 rendertype=\"line\"  count() min(apache.resp_len) by apache.status |
      | 3248_area   |  tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"area\" count() min(apache.resp_len) by apache.status |
      | 3096_scatter|  tag:sample04061424_chart \| timechart cont=true span=30m rendertype=\"scatter\" count() min(apache.resp_len) by apache.status   |
      | 3249_scatter|  tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"scatter\"  count() min(apache.resp_len) by apache.status|
      | 3250_column |  tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"column\" count() min(apache.resp_len) by apache.status |

  @logDisplaySmoke
  Scenario Outline: timechart（RZY-3093,3095)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Settings" button
    And I wait for "1000" millsecond
    And I click the "Xaxis" button
    And I wait for "2000" millsecond
    And I click the "ThirdLabel" button
    And I wait for "1000" millsecond
    And I click the "AscendingOrder" button
    And I click the "Yaxis" button
    And I wait for "2000" millsecond
    And I set the parameter "Unit" with value "个"
    And I wait for "1000" millsecond
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button
    And I set the parameter "Min" with value "<minVal>"
    And I set the parameter "Max" with value "<maxVal>"
    And I wait for "1000" millsecond
    And I click the "Example" button
    And I click the "FirstPosition" button

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<colorChoice>" button
    And I wait for "1000" millsecond

    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/7timechart_<caseNum>"
    Then I compare source image "actual/高级搜索视图/7timechart_<caseNum>" with target image "expect/高级搜索视图/7timechart_<caseNum>"

    Examples:
      |  caseNum    | minVal | maxVal| colorChoice |  spl|
      | 3093_line   | 0      | 200   | Yellow      | tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=0 endindex=8 limit=5 rendertype=\"line\"  count() min(apache.resp_len) by apache.status |
      | 3095_area   | 1      | 160   | Orange      | tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"area\"  count() min(apache.resp_len) by apache.status |

  Scenario Outline: timechart(RZY-3097,3099)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Settings" button
    And I click the "Xaxis" button
    And I wait for "1000" millsecond
    And I click the "ThirdLabel" button
    And I wait for "1000" millsecond
    And I click the "AscendingOrder" button
    And I click the "Yaxis" button
    And I wait for "2000" millsecond
    And I set the parameter "Unit" with value "个"
    And I wait for "1000" millsecond
    And I set the parameter "Min" with value "<minVal>"
    And I set the parameter "Max" with value "<maxVal>"
    And I click the "Example" button
    And I wait for "1000" millsecond
    And I click the "FirstPosition" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<colorChoice>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/7timechart_<caseNum>"
    Then I compare source image "actual/高级搜索视图/7timechart_<caseNum>" with target image "expect/高级搜索视图/7timechart_<caseNum>"

    Examples:
      |  caseNum    | minVal | maxVal| colorChoice|  spl|
      | 3097_scatter| 0      | 200   | Green      | tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"scatter\"  count() min(apache.resp_len) by apache.status |
      | 3099_column | 0      | 160   | Red        | tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"column\" count() min(apache.resp_len) by apache.status |

  Scenario Outline: timechart_pile
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Settings" button
    And I click the "Xaxis" button
    And I wait for "2000" millsecond
    And I click the "ThirdLabel" button
    And I click the "AscendingOrder" button
    And I click the "Yaxis" button
    And I wait for "2000" millsecond
    And I set the parameter "Unit" with value "个"
    And I wait for "1000" millsecond
    And I click the "<button>" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "Pile" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Chart" will be visible
    And I wait for "<element>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/7timechart_<caseNum>"
    Then I compare source image "actual/高级搜索视图/7timechart_<caseNum>" with target image "expect/高级搜索视图/7timechart_<caseNum>"

    Examples:
      |  caseNum    | element      | color    |button    |   spl|
      | area_pile   | AreaChart    | Yellow   | Smooth   | tag:sample04061424_chart \| timechart cont=true span=30m rendertype=\"area\" count() min(apache.resp_len) by apache.status  |
      | column_pile | ColumnChart  | Red      |          | tag:sample04061424_chart \| timechart cont=true span=30m rendertype=\"column\" count() min(apache.resp_len) by apache.status  |

