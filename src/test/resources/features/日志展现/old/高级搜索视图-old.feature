@logDisplay
Feature: 日志展现高级搜索视图

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario: RZY-2794:地图-行政区划地图2_江苏省
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.geo.city"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Map" button
    And I click the "Regionmap" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Region" button
    And I click the "Jiangsu" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "event/2794"

  Scenario Outline: RZY-3247、3248、3249、3098
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the "trend.CreatePage" page
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "event/<num>"

    Examples:
      | spl                                                                                                                                                                                                                  | num  |
      | tag:\"sample04061424_display\"\| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=0 endindex=8 limit=5 rendertype=\"line\" count() min(apache.resp_len) by apache.status    | 3247 |
      | tag:\"sample04061424_display\"\| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=0 endindex=8 limit=5 rendertype=\"area\" count() min(apache.resp_len) by apache.status    | 3248 |
      | tag:\"sample04061424_display\"\| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=0 endindex=8 limit=5 rendertype=\"scatter\" count() min(apache.resp_len) by apache.status | 3249 |

  Scenario Outline: RZY-3092至3099
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the "trend.CreatePage" page
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "event/<num>"
    And I click the "Setting" button
    And I click the "<tag>" button
    And I click the "<order>" button
    And I click the "Yaxis" button
    And I set the parameter "Unit" with value "<unit>"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "Example" button
    And I click the "<position>" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "event/<num1>"

    Examples:
      | spl                                                                                                                                 | num  | tag   | order          | unit | min | max  | position      | colour | num1 |
      | tag:\"sample04061424_display\" \| timechart cont=true span=30m rendertype=\"line\" count() min(apache.resp_len) by apache.status    | 3092 | Right | AscendingOrder | 个    | 0   | 1000 | FirstPosition | Green  | 3093 |
      | tag:\"sample04061424_display\" \| timechart cont=true span=30m rendertype=\"area\" count() min(apache.resp_len) by apache.status    | 3094 | Right | AscendingOrder | 个    | 0   | 1000 | FirstPosition | Green  | 3095 |
      | tag:\"sample04061424_display\" \| timechart cont=true span=30m rendertype=\"scatter\" count() min(apache.resp_len) by apache.status | 3096 | Right | AscendingOrder | 个    | 0   | 1000 | FirstPosition | Green  | 3097 |
      | tag:\"sample04061424_display\" \| timechart cont=true span=30m rendertype=\"column\" count() min(apache.resp_len) by apache.status  | 3098 | Right | AscendingOrder | 个    | 0   | 1000 | FirstPosition | Green  | 3099 |
