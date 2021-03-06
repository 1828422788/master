@all @logDisplay @logDisplayDimension
Feature: 日志展现_2维度

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side

  Scenario Outline: 维度（饼状图，玫瑰图，条形图，旭日图，火焰图）(RZY-833,2776,2778,2782)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I wait for "<element>" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度_<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/2维度_<caseNum>_<chartType>" with target image "expect/高级搜索视图/2维度_<caseNum>_<chartType>"

    @logDisplaySmoke
    Examples:
      |   chartType   | element     |   caseNum  |  spl   |
      |      Pie      | PieElement  |     833    | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count,apache.clientip \| limit 5 |
      |      Rose     | PieElement  |     2776   | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count,apache.clientip \| limit 5 |

    Examples:
      |   chartType   | element     |   caseNum  |  spl   |
      |      Bar      | BarElement  |     2778   | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count,apache.clientip \| limit 5 |
      |      Sun      | SunElement  |     2782   | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.province, apache.geo.city|
      |      Flame    | FlameElement|     4606   | tag:sample04061424_chart AND (apache.status:200) AND NOT (apache.geo.city:黔东南苗族侗族自治州) AND NOT (apache.geo.city:南京市)   \| stats count() as cnt by apache.method, apache.status, apache.geo.province, apache.geo.city \| sort by apache.method, apache.status, apache.geo.province, apache.geo.city|

  Scenario Outline: 旭日图(RZY-2781)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() by apache.status,apache.geo.province, apache.geo.city"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "Value" button
    And I click the "Divide" button
    And I click the "DeleteFirst" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color1>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度_<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/2维度_<caseNum>_<chartType>" with target image "expect/高级搜索视图/2维度_<caseNum>_<chartType>"

    Examples:
      |   chartType   | color1   |  caseNum  |
      |      Sun      | DarkBlue | 2781     |

  Scenario Outline: 标签(RZY-4205,4208,4211,4206,4209,4212,4207,4210)
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
    And I choose the "<option>" from the "ShowLabel"
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度_<chartType>_<option>_<descr>"
    Then I compare source image "actual/高级搜索视图/2维度_<chartType>_<option>_<descr>" with target image "expect/高级搜索视图/2维度_<chartType>_<option>_<descr>"

    Examples:
      |   chartType   |  option     | descr      |
      |      Pie      |  不展示     | nolabel    |
      |      Pie      |  全部展示   | full       |
      |      Pie      | 只展示名称  | name       |
      |      Pie      | 右侧展示    | right      |
      |      Rose     |  不展示     | nolabel    |
      |      Rose     |  全部展示   | full       |
      |      Rose     | 只展示名称  | name       |
      |      Rose     | 右侧展示    | right      |
      |      Bar      |  不展示     | nolabel    |
      |      Bar      |  全部展示   | full       |
      |      Bar      | 只展示名称  | name       |

  Scenario Outline: 条形图_标签(RZY-4213,4214,4215,4216,4217,4218,4219,4220,4221,4222)
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
    And I choose the "<typeInfo>" from the "ShowLabel"
    And I choose the "<option>" from the "LabelLocation"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度_<typeInfo>_<chartType>_<option>_<descr>"
    Then I compare source image "actual/高级搜索视图/2维度_<typeInfo>_<chartType>_<option>_<descr>" with target image "expect/高级搜索视图/2维度_<typeInfo>_<chartType>_<option>_<descr>"


    Examples:
      |   chartType   | color   |typeInfo  | option      |   descr  |
      |      Bar      | Red     |只展示名称| 柱状外左侧  | out_left |
      |      Bar      | Red     |只展示名称| 柱状外右侧 | out_right |
      |      Bar      | Red     |只展示名称| 柱状内中央 | middle    |
      |      Bar      | Red     |只展示名称|柱状内靠左侧 | in_left  |
      |      Bar      | Red     |只展示名称|柱状内靠右侧 | in_right |
      |      Bar      | Yellow  |全部展示  |柱状外两侧   | both     |
      |      Bar      | Yellow  |全部展示  |柱状外左侧   | out_left |
      |      Bar      | Yellow  |全部展示  |柱状外右侧   | out_right|
      |      Bar      | Yellow  |全部展示  |柱状内中央   | middle   |
      |      Bar      | Yellow  |全部展示  |柱状内靠左侧 | in_left   |
      |      Bar      | Yellow  |全部展示  |柱状内靠右侧 | in_right  |

  Scenario Outline: 维度_分面
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND NOT apache.geo.city:\"黔东南苗族侗族自治州\" \| stats count(apache.clientip) as ip_count by apache.geo.city, apache.method \| sort by apache.geo.city \| limit 8 "
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Facet" button
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
    And I wait for "Chart" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度_<chartType>_<typeInfo>_分面"
    Then I compare source image "actual/高级搜索视图/2维度_<chartType>_<typeInfo>_分面" with target image "expect/高级搜索视图/2维度_<chartType>_<typeInfo>_分面"

    Examples:
      |   chartType   |  color  |  typeInfo    |
      |      Pie      | Red     | 只展示名称   |
      |      Rose     | Green   | 只展示名称   |
      |      Bar      | Orange  | 全部展示     |

  Scenario Outline: 旭日图_分面
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
    And I choose the "apache.status" from the "FieldValue"
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度_<chartType>_分面"
#    Then I compare source image "actual/高级搜索视图/2维度_<chartType>_分面" with target image "expect/高级搜索视图/2维度_<chartType>_分面"

    Examples:
      |   chartType   |  color   |  spl   |
      |      Sun      | DarkBlue |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND NOT apache.geo.province:贵州 AND NOT apache.status:304 AND NOT apache.status:499 \| stats count() as cnt by apache.status,apache.geo.province, apache.geo.city \| sort by apache.status,apache.province, apache.geo.city, cnt|


  Scenario Outline: 火焰图
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND (apache.status:200) AND NOT (apache.geo.city:黔东南苗族侗族自治州) AND NOT (apache.geo.city:南京市)   | stats count() as cnt by apache.method, apache.status, apache.geo.province, apache.geo.city | sort by apache.method, apache.status, apache.geo.province, apache.geo.city"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Divide" button
    And I click the "DeleteFirst" button
    And I click the "DeleteFirst" button
    And I click the "Exhibition" button
    And I click the "<option>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I click the Circle "ShenZhen" button
    And I wait for "<element>" will be visible
    And I click the "HideElement" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度_<chartType>_<option>"
    Then I compare source image "actual/高级搜索视图/2维度_<chartType>_<option>" with target image "expect/高级搜索视图/2维度_<chartType>_<option>"

    Examples:
      |   chartType   |  option        | element      |
      |      Flame    | DrillIn        | BackToChart  |
      |      Flame    | DrillOut       | Chart        |

  Scenario Outline: 火焰图_分面
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND (apache.status:200) AND NOT (apache.geo.city:黔东南苗族侗族自治州) AND NOT (apache.geo.city:南京市)   | stats count() as cnt by apache.method, apache.status, apache.geo.province, apache.geo.city | sort by apache.method, apache.status, apache.geo.province, apache.geo.city"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Divide" button
    And I click the "DeleteFirst" button
    And I click the "DeleteFirst" button
    And I click the "Exhibition" button
    And I click the "<option>" button
    And I click the "Facet" button
    And I choose the "apache.method" from the "FieldValue"
    And I set the parameter "RowNum" with value "2"
    And I set the parameter "ColumnNum" with value "1"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I click the Circle "ShenZhen" button
    And I will see the "<element>" doesn't exist
    And I click the "HideElement" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度_<chartType>_<option>_分面"
    Then I compare source image "actual/高级搜索视图/2维度_<chartType>_<option>_分面" with target image "expect/高级搜索视图/2维度_<chartType>_<option>_分面"

    Examples:
      |   chartType   |  option        | element    |
      |      Flame    | DrillOut       | AreaChart  |
      |      Flame    | DrillIn        | BackToChart|

  Scenario Outline: 条形图_标签位置
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.clientip | limit 5 | eval cnt = cnt/7"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "Bar" button

    And I click the "Settings" button
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I choose the "<typeInfo>" from the "ShowLabel"
    And I choose the "柱状外两侧" from the "LabelLocation"
    And I choose the "纵向" from the "ChartOrientation"
    And I choose the "<label_orient>" from the "LabelOrientation"
    And I choose the "<value_orient>" from the "ValueLabelOrientation"
    And I choose the "<precision>" from the "Precision"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I move the mouse pointer to the "Type"
    And I will see the element "BottomAxisLabel" contains "221.226.97.92"
    And I will see the element "ValueLabel" contains "<value>"
    And I will see the element "BottomAxisLabel" transform contains "<transform_label>"
    And I will see the element "ValueLabel" transform contains "<transform_value>"


    Examples:
      |typeInfo  | label_orient | value_orient | precision | value        | transform_label | transform_value |
      |只展示名称| 纵向         | 纵向         |           | 221.226.97.92| rotate(-90)     | rotate(-90)     |
      |只展示名称| 纵向         | 横向         |           | 221.226.97.92| rotate(-90)     | rotate(0)       |
      |全部展示  | 纵向         | 横向         |           | 5.5714285    | rotate(-90)     | rotate(0)       |
      |全部展示  | 纵向         | 纵向         |  0        | 6            | rotate(-90)     | rotate(-90)     |
      |全部展示  | 纵向         | 横向         |  1        | 5.6          | rotate(-90)     | rotate(0)       |
      |全部展示  | 横向         | 纵向         |  2        | 5.57         | rotate(0)       | rotate(-90)     |
      |全部展示  | 横向         | 横向         |  3        | 5.571        | rotate(0)       | rotate(0)       |

  Scenario Outline: 饼状图_内环占外环比
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 5"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Type" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I set the parameter "SegmentsNumber" with value "<segments_num>"
    And I set the parameter "RatioInnerToOuter" with value "<ratio>"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I will see the text "其他" exist in page
    And I will see the text "<client_ip>" is not existed in page
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/高级搜索视图/2维度_<chartType>_<segments_num>_<ratio>"
    And I compare source image "actual/高级搜索视图/2维度_<chartType>_<segments_num>_<ratio>" with target image "expect/高级搜索视图/2维度_<chartType>_<segments_num>_<ratio>"

    Examples:
      |   chartType   | color  | segments_num | ratio | client_ip      |
      |      Pie      | Red    | 2            | 0.9   | 183.14.126.214 |
      |      Pie      | Green  | 3            | 0     | 1.207.60.51    |