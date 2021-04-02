@saveAsTrend @saveAsTrendDimension
Feature: 保存为趋势图_维度

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side

  Scenario Outline: dimension_default(RZY-2503,2858,2676,2850)
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I click the "Type" button under some element
    And I click the "Dimension" button under some element
    And I click the "<chartType>" button under some element

    And I click the "Type" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
#    And I wait for "2000" millsecond
#    And take part of "Chart" with name "actual/保存为趋势图/<chartType>_<caseNum>"
#    And I compare source image "actual/保存为趋势图/<chartType>_<caseNum>" with target image "expect/保存为趋势图/<chartType>_<caseNum>"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"
    Examples:
      |   chartType   |   caseNum  |  spl  |
      |      Pie      |    2503    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Rose     |    2858    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Bar      |    2676    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Sun      |    2850    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() by apache.status,apache.geo.province, apache.geo.city|

  Scenario Outline: dimension_labels_bar
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 5"
    And I wait for "2000" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I click the "Type" button under some element
    And I click the "Dimension" button under some element
    And I click the "<chartType>" button under some element
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I choose the "<typeInfo>" from the "ShowLabel" in config
    And I choose the "<option>" from the "LabelLocation" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
#    And I wait for "2000" millsecond
#    And take part of "Chart" with name "actual/保存为趋势图/<chartType>_<typeInfo>_<option>"
#    And I compare source image "actual/保存为趋势图/<chartType>_<typeInfo>_<option>" with target image "expect/保存为趋势图/<chartType>_<typeInfo>_<option>"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<typeInfo>_<option>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |   chartType   | color  |typeInfo | option       |
      |      Bar      | Red    |只展示名称| 柱状外左侧   |
      |      Bar      | Red    |只展示名称| 柱状外右侧   |
      |      Bar      | Red    |只展示名称| 柱状内中央   |
      |      Bar      | Red    |只展示名称| 柱状内靠左侧 |
      |      Bar      | Red    |只展示名称| 柱状内靠右侧 |
      |      Bar      | Green  |全部展示  | 柱状外两侧   |
      |      Bar      | Green  |全部展示  | 柱状外左侧   |
      |      Bar      | Green  |全部展示  | 柱状外右侧   |
      |      Bar      | Green  |全部展示  | 柱状内中央   |
      |      Bar      | Green  |全部展示  | 柱状内靠左侧 |
      |      Bar      | Green  |全部展示  | 柱状内靠右侧 |

  Scenario Outline: dimension_labels_options
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 5"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I click the "Type" button under some element
    And I click the "Dimension" button under some element
    And I click the "<chartType>" button under some element
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I choose the "<typeInfo>" from the "ShowLabel" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
#    And I wait for "2000" millsecond
#    And take part of "Chart" with name "actual/保存为趋势图/<chartType>_<typeInfo>"
#    And I compare source image "actual/保存为趋势图/<chartType>_<typeInfo>" with target image "expect/保存为趋势图/<chartType>_<typeInfo>"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<typeInfo>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |   chartType   | color  |typeInfo    |
      |      Pie      | Orange |不展示      |
      |     Rose      | Orange |不展示      |
      |      Bar      | Orange |不展示      |
      |      Pie      | Orange |只展示名称   |
      |     Rose      | Orange |只展示名称   |
      |      Pie      | Orange |全部展示     |
      |     Rose      | Orange |全部展示     |


  Scenario Outline: dimension_facet
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I click the "Type" button under some element
    And I click the "Dimension" button under some element
    And I click the "<chartType>" button under some element

    And I click the "Settings" button
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.method" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I choose the "<typeInfo>" from the "ShowLabel" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
#    And I wait for "2000" millsecond
#    And take part of "StatisticalChart" with name "actual/保存为趋势图/<chartType>_<typeInfo>_分面"
#    And I compare source image "actual/保存为趋势图/<chartType>_<typeInfo>_分面" with target image "expect/保存为趋势图/<chartType>_<typeInfo>_分面"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<typeInfo>_分面"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |   chartType   |  color  |  typeInfo    |  spl   |
      |      Pie      | Red     | 全部展示     |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND NOT apache.geo.city:\"黔东南苗族侗族自治州\" \| stats count(apache.clientip) as ip_count by apache.geo.city, apache.method \| sort by apache.geo.city \| limit 8 |
      |      Rose     | Green   | 只展示名称   |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND NOT apache.geo.city:\"黔东南苗族侗族自治州\" \| stats count(apache.clientip) as ip_count by apache.geo.city, apache.method \| sort by apache.geo.city \| limit 8 |
      |      Bar      | Orange  | 全部展示     |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND NOT apache.geo.city:\"黔东南苗族侗族自治州\" \| stats count(apache.clientip) as ip_count by apache.geo.city, apache.method \| sort by apache.geo.city \| limit 8 |


  Scenario Outline: dimension_facet_sun
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I click the "Type" button under some element
    And I click the "Dimension" button under some element
    And I click the "<chartType>" button under some element

    And I click the "Settings" button
    And I click the "Divide" button
    And I click the "DeleteFirst" button
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.status" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
#    And I wait for "2000" millsecond
#    And take part of "StatisticalChart" with name "actual/保存为趋势图/<chartType>_分面"
#    And I compare source image "actual/保存为趋势图/<chartType>_分面" with target image "expect/保存为趋势图/<chartType>_分面"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_分面"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |   chartType   |  color   |  spl   |
      |      Sun      | DarkBlue |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND NOT apache.geo.province:贵州 AND NOT apache.status:304 AND NOT apache.status:499 \| stats count() by apache.status,apache.geo.province, apache.geo.city|


  Scenario Outline: dimension_flame
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND (apache.status:200) AND NOT (apache.geo.city:黔东南苗族侗族自治州) AND NOT (apache.geo.city:南京市)   | stats count() as cnt by apache.method, apache.status, apache.geo.province, apache.geo.city | sort by apache.method, apache.status, apache.geo.province, apache.geo.city"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I click the "Type" button under some element
    And I click the "Dimension" button under some element
    And I click the "<chartType>" button under some element
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I choose the "<option>" from the "DrillDownMode" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I click the "ShenZhen" button
    And I click the "HideElement" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
#    And I wait for "2000" millsecond
#    And take part of "Chart" with name "actual/保存为趋势图/<chartType>_<option>"
#    And I compare source image "actual/保存为趋势图/<chartType>_<option>" with target image "expect/保存为趋势图/<chartType>_<option>"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<option>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |   chartType   |  option  |
      |      Flame    | 图内钻取 |


  Scenario Outline: dimension_flame_facet
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND (apache.status:200) AND NOT (apache.geo.city:黔东南苗族侗族自治州) AND NOT (apache.geo.city:南京市)   | stats count() as cnt by apache.method, apache.status, apache.geo.province, apache.geo.city | sort by apache.method, apache.status, apache.geo.province, apache.geo.city"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I click the "Type" button under some element
    And I click the "Dimension" button under some element
    And I click the "<chartType>" button under some element
    And I click the "Settings" button
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.method" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "2"
    And I set the parameter "ColumnNum" with value "1"
    And I click the "Exhibition" button
    And I choose the "<option>" from the "DrillDownMode" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "StatisticalChart" will be visible
    And I click the "ShenZhen" button
    And I click the "HideElement" button
    And I wait for "2000" millsecond
    And I wait for "StatisticalChart" will be visible
#    And I wait for "2000" millsecond
#    And take part of "StatisticalChart" with name "actual/保存为趋势图/<chartType>_<option>_分面"
#    And I compare source image "actual/保存为趋势图/<chartType>_<option>_分面" with target image "expect/保存为趋势图/<chartType>_<option>_分面"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<option>_分面"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |   chartType   |  option    |
      |      Flame    | 图外钻取   |