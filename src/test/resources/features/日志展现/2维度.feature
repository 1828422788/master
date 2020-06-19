@all @logDisplay @logDisplayDimension
Feature: 日志展现_维度
#11


  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"


  Scenario Outline: dimension(RZY-833,2776,2778,2782)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/2维度/<caseNum>_<chartType>" with target image "expect/高级搜索视图/2维度/<caseNum>_<chartType>"

    Examples:
      |   chartType   |   caseNum  |  spl   |
      |      Pie      |     833    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Rose     |     2776   | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Bar      |     2778   | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Sun      |     2782   | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.status,apache.geo.province, apache.geo.city|

  Scenario Outline: dimension_sun(RZY-2781)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() by apache.status,apache.geo.province, apache.geo.city"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Value" button
    And I click the "Divide" button
    And I click the "DeleteLast" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color1>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/2维度/<caseNum>_<chartType>" with target image "expect/高级搜索视图/2维度/<caseNum>_<chartType>"

    Examples:
      |   chartType   | color1   |  caseNum  |
      |      Sun      | DarkBlue | 2781     |

  Scenario Outline: dimension_pie（RZY-2774)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Value" button
    And I choose the "<value>" from the "FieldValue" in config
    And I click the "Divide" button
    And I choose the "<divValue>" from the "FieldValue" in config
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color1>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/2维度/<caseNum>_<chartType>" with target image "expect/高级搜索视图/2维度/<caseNum>_<chartType>"

    Examples:
      |   chartType   |  value      |     divValue   | color1   |caseNum  | spl   |
      |      Pie      |  count      | apache.clientip| Red      |2774     | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |

  Scenario Outline: label(RZY-4205,4208,4211,4206,4209,4212,4207,4210)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I choose the "<option>" from the "ShowLabel" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度/label/<chartType>_<option>_<descr>"
    Then I compare source image "actual/高级搜索视图/2维度/label/<chartType>_<option>_<descr>" with target image "expect/高级搜索视图/2维度/label/<chartType>_<option>_<descr>"

    Examples:
      |   chartType   |  option     | descr      |
      |      Pie      |  不展示     | nolabel    |
      |      Pie      |  展示全部   | full       |
      |      Pie      | 只展示名称  | name       |
      |      Rose     |  不展示     | nolabel    |
      |      Rose     |  展示全部   | full       |
      |      Rose     | 只展示名称  | name       |
      |      Bar      |  不展示     | nolabel    |
      |      Bar      |  展示全部   | full       |
      |      Bar      | 只展示名称  | name       |


  Scenario Outline: label_location(RZY-4213,4214,4215,4216,4217,4218,4219,4220,4221,4222)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I choose the "<typeInfo>" from the "ShowLabel" in config
    And I choose the "<option>" from the "LabelLocation" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option>_<descr>"
    Then I compare source image "actual/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option>_<descr>" with target image "expect/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option>_<descr>"


    Examples:
      |   chartType   | color   |typeInfo  | option      |   descr  |
      |      Bar      | Red     |只展示名称| 柱状外左侧  | out_left |
      |      Bar      | Red     |只展示名称| 柱状外右侧 | out_right |
      |      Bar      | Red     |只展示名称| 柱状内中央 | middle    |
      |      Bar      | Red     |只展示名称|柱状内靠左侧 | in_left  |
      |      Bar      | Red     |只展示名称|柱状内靠右侧 | in_right |
      |      Bar      | Yellow  |展示全部  |柱状外左侧   | out_left |
      |      Bar      | Yellow  |展示全部  |柱状外右侧   | out_right|
      |      Bar      | Yellow  |展示全部  |柱状内中央   | middle   |
      |      Bar      | Yellow  |展示全部  |柱状内靠左侧 | in_left   |
      |      Bar      | Yellow  |展示全部  |柱状内靠右侧 | in_right  |

 @dimensionfacet
  Scenario Outline: dimension_facet
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND NOT apache.geo.city:\"黔东南苗族侗族自治州\" \| stats count(apache.clientip) as ip_count by apache.geo.city, apache.method \| sort by apache.geo.city \| limit 8 "
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.method" from the "FieldValue"
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I choose the "<typeInfo>" from the "ShowLabel"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/高级搜索视图/2维度/<chartType>_<typeInfo>_分面"
    Then I compare source image "actual/高级搜索视图/2维度/<chartType>_<typeInfo>_分面" with target image "expect/高级搜索视图/2维度/<chartType>_<typeInfo>_分面"

    Examples:
      |   chartType   |  color  |  typeInfo    |
      |      Pie      | Red     | 只展示名称   |
      |      Rose     | Green   | 只展示名称   |
      |      Bar      | Orange  | 展示全部     |

  Scenario Outline: dimension_facet_sun
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Divide" button
    And I click the "DeleteFirst" button
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.status" from the "FieldValue"
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/高级搜索视图/2维度/<chartType>_分面"
    Then I compare source image "actual/高级搜索视图/2维度/<chartType>_分面" with target image "expect/高级搜索视图/2维度/<chartType>_分面"

    Examples:
      |   chartType   |  color   |  spl   |
      |      Sun      | DarkBlue |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND NOT apache.geo.province:贵州 AND NOT apache.status:304 AND NOT apache.status:499 \| stats count() by apache.status,apache.geo.province, apache.geo.city|
