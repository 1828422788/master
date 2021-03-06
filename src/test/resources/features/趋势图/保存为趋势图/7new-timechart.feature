@saveAsTrend @saveAsTrendTimechart
Feature: 保存为趋势图_timechart

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side

  Scenario Outline: timechart1
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
#    And I wait for "2000" millsecond
#    And take part of "Chart" with name "actual/timechart_<caseNum>"
#    And I compare source image "actual/timechart_<caseNum>" with target image "expect/timechart_<caseNum>"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "timechart_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |  caseNum    |   spl|
      | 3092_line   |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| timechart cont=true span=30m rendertype=\"line\" count() min(apache.resp_len) by apache.status  |
      | 3247_line   |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=0 endindex=8 limit=5 rendertype=\"line\"  count() min(apache.resp_len) by apache.status |
      | 3248_area   |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"area\" count() min(apache.resp_len) by apache.status |
      | 3096_scatter|  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| timechart cont=true span=30m rendertype=\"scatter\" count() min(apache.resp_len) by apache.status   |
      | 3249_scatter|  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"scatter\"  count() min(apache.resp_len) by apache.status|
      | 3250_column |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"column\" count() min(apache.resp_len) by apache.status |

  Scenario Outline: timechart2
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I click the "Settings" button
    And I click the "Xaxis" button
    And I click the "ThirdLabel" button
    And I click the "AscendingOrder" button
    And I click the "Yaxis" button
    And I set the parameter "Unit" with value "个"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button
    And I set the parameter "Min" with value "<minVal>"
    And I set the parameter "Max" with value "<maxVal>"
    And I click the "Example" button
    And I click the "FirstPosition" button

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<colorChoice>" button

    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
#    And I wait for "2000" millsecond
#    And take part of "Chart" with name "actual/timechart_<caseNum>"
#    And I compare source image "actual/timechart_<caseNum>" with target image "expect/timechart_<caseNum>"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "timechart_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |  caseNum    | minVal | maxVal| colorChoice |  spl|
      | 3093_line   | 0      |200   | Yellow      | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=0 endindex=8 limit=5 rendertype=\"line\"  count() min(apache.resp_len) by apache.status |
      | 3095_area   | 1      |160   | Orange      | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"area\"  count() min(apache.resp_len) by apache.status |


  Scenario Outline: timechart3
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I click the "Settings" button
    And I click the "Xaxis" button
    And I click the "ThirdLabel" button
    And I click the "AscendingOrder" button
    And I click the "Yaxis" button
    And I set the parameter "Unit" with value "个"
    And I set the parameter "Min" with value "<minVal>"
    And I set the parameter "Max" with value "<maxVal>"
    And I click the "Example" button
    And I click the "FirstPosition" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<colorChoice>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
#    And I wait for "2000" millsecond
#    And take part of "Chart" with name "actual/timechart_<caseNum>"
#    And I compare source image "actual/timechart_<caseNum>" with target image "expect/timechart_<caseNum>"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "timechart_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |  caseNum    | minVal | maxVal| colorChoice|  spl|
      | 3097_scatter| 0      |200   | Green      | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"scatter\"  count() min(apache.resp_len) by apache.status |
      | 3099_column | 1      |160   | Red        | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"column\" count() min(apache.resp_len) by apache.status |

  Scenario Outline: timechart_pile
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I click the "Settings" button
    And I click the "Xaxis" button
    And I click the "ThirdLabel" button
    And I click the "AscendingOrder" button
    And I click the "Yaxis" button
    And I set the parameter "Unit" with value "个"
    And I click the "<button>" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I click the "Pile" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
#    And I wait for "2000" millsecond
#    And take part of "Chart" with name "actual/timechart_<caseNum>"
#    And I compare source image "actual/timechart_<caseNum>" with target image "expect/timechart_<caseNum>"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "timechart_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |  caseNum    | color    |button    |   spl|
      | area_pile   | Yellow   | Smooth   | tag:sample04061424_chart \| timechart cont=true span=30m rendertype=\"area\" count() min(apache.resp_len) by apache.status  |
      | column_pile | Red      |          | tag:sample04061424_chart \| timechart cont=true span=30m rendertype=\"column\" count() min(apache.resp_len) by apache.status  |

  Scenario Outline: sparkline
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I wait for "500" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I wait for "2000" millsecond
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
#    And I wait for "2000" millsecond
#    And take part of "StatisticalChart" with name "actual/<caseNum>"
#    And I compare source image "actual/<caseNum>" with target image "<caseNum>"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |  caseNum    |   spl|
      | sparkline   | tag:sample04061424_chart \| stats sparkline(sum(raw_message_length),30m), count(apache.clientip) as ip_count by apache.status \| sort by apache.status     |

