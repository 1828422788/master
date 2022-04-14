@trend @createTrendDimension @createTrend
Feature: 趋势图新建_维度

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @trendSmoke
  Scenario Outline: 维度（饼状图，玫瑰图，条形图，旭日图）(RZY-2503,2858,2676,2850)
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "2000" millsecond
    And I wait for "<element>" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<caseNum>"
    And I compare source image "actual/<chartType>_<caseNum>" with target image "expect/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'<chartType>_<caseNum>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<chartType>_<caseNum>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<element>" will be visible

    Examples:
      |   chartType   |   element        |  caseNum  |  spl  |
      |      Pie      |   PieElement     |   2503    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Rose     |   PieElement     |   2858    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Bar      |   BarElement     |   2676    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Sun      |   SunElement     |   2850    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() by apache.status,apache.geo.province, apache.geo.city|

  Scenario Outline: dimension_labels_bar
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 5"
    And I wait for "2000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Type" button
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
    And I wait for "BarElement" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<typeInfo>_<option>"
    And I compare source image "actual/<chartType>_<typeInfo>_<option>" with target image "expect/<chartType>_<typeInfo>_<option>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<typeInfo>_<option>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

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
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Type" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I choose the "<typeInfo>" from the "ShowLabel" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "<element>" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<typeInfo>"
    And I compare source image "actual/<chartType>_<typeInfo>" with target image "expect/<chartType>_<typeInfo>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<typeInfo>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   | color  |typeInfo    |  element            |
      |      Pie      | Orange |不展示      | PieNoLabelsElement  |
      |     Rose      | Orange |不展示      | PieNoLabelsElement  |
      |      Bar      | Orange |不展示      | BarElement          |
      |      Pie      | Orange |只展示名称   | PieElement           |
      |     Rose      | Orange |只展示名称   | PieElement           |
      |      Pie      | Orange |全部展示     | PieElement           |
      |     Rose      | Orange |全部展示     | PieElement           |


  Scenario Outline: dimension_facet
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "Facet" button
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
    And I wait for "<element>" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<typeInfo>_分面"
    And I compare source image "actual/<chartType>_<typeInfo>_分面" with target image "expect/<chartType>_<typeInfo>_分面"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<typeInfo>_分面"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |  color  |  element     |  typeInfo    |  spl   |
      |      Pie      | Red     | PieElement   | 全部展示     |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND NOT apache.geo.city:\"黔东南苗族侗族自治州\" \| stats count(apache.clientip) as ip_count by apache.geo.city, apache.method \| sort by apache.geo.city \| limit 8 |
      |      Rose     | Green   | PieElement   | 只展示名称   |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND NOT apache.geo.city:\"黔东南苗族侗族自治州\" \| stats count(apache.clientip) as ip_count by apache.geo.city, apache.method \| sort by apache.geo.city \| limit 8 |
      |      Bar      | Orange  | BarElement   | 全部展示     |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND NOT apache.geo.city:\"黔东南苗族侗族自治州\" \| stats count(apache.clientip) as ip_count by apache.geo.city, apache.method \| sort by apache.geo.city \| limit 8 |


  Scenario Outline: dimension_facet_sun
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Type" button

    And I click the "Settings" button
    And I click the "Divide" button
    And I click the "DeleteFirst" button
    And I click the "Facet" button
    And I choose the "apache.status" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "SunElement" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_分面"
#    And I compare source image "actual/<chartType>_分面" with target image "expect/<chartType>_分面"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_分面"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |  color   |  spl   |
      |      Sun      | DarkBlue |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND NOT apache.geo.province:贵州 AND NOT apache.status:304 AND NOT apache.status:499 \| stats count() by apache.status,apache.geo.province, apache.geo.city|

  @trendSmoke
  Scenario Outline: 火焰图
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND (apache.status:200) AND NOT (apache.geo.city:黔东南苗族侗族自治州) AND NOT (apache.geo.city:南京市)   | stats count() as cnt by apache.method, apache.status, apache.geo.province, apache.geo.city | sort by apache.method, apache.status, apache.geo.province, apache.geo.city"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Type" button
    And I click the "Settings" button
    And I click the "Divide" button
    And I click the "DeleteFirst" button
    And I click the "DeleteFirst" button
    And I click the "Exhibition" button
    And I click the "<option>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "FlameElement" will be visible
    And I click the Circle "ShenZhen" button
    And I wait for "BackToChart" will be visible
    And I click the "HideElement" button
    And I wait for "2000" millsecond
    And I wait for "FlameElement" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<option>"
    And I compare source image "actual/<chartType>_<option>" with target image "expect/<chartType>_<option>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<option>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible
    And I click the "ReturnButton" button

    When I will see the "trend.ListPage" page
    And I wait for "AppOfTheLastItem" will be visible
    And the data name is "{'column':'0','name':'<chartType>_<option>'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<chartType>_<option>"
    Then I will see the "trend.CreatePage" page
    And I wait for "FlameElement" will be visible
    And I click the Circle "ShenZhen" button
    And I wait for "BackToChart" will be visible

    Examples:
      |   chartType   |  option  |
      |      Flame    | DrillIn  |


  Scenario Outline: dimension_flame_facet
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND (apache.status:200) AND NOT (apache.geo.city:黔东南苗族侗族自治州) AND NOT (apache.geo.city:南京市)   | stats count() as cnt by apache.method, apache.status, apache.geo.province, apache.geo.city | sort by apache.method, apache.status, apache.geo.province, apache.geo.city"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Type" button
    And I click the "Settings" button
    And I click the "Divide" button
    And I wait for "1000" millsecond
    And I click the "DeleteFirst" button
    And I click the "DeleteFirst" button
    And I click the "Exhibition" button
    And I click the "<option>" button
    And I click the "Facet" button
    And I choose the "apache.method" from the "FieldValue" in config
    And I set the parameter "RowNum" with value "2"
    And I set the parameter "ColumnNum" with value "1"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "FlameElement" will be visible
    And I click the Circle "ShenZhen" button
    And I will see the "BackToChart" doesn't exist
    And I click the "HideElement" button
    And I wait for "2000" millsecond
    And I wait for "FlameElement" will be visible
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/<chartType>_<option>_分面"
    And I compare source image "actual/<chartType>_<option>_分面" with target image "expect/<chartType>_<option>_分面"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<option>_分面"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |  option    |
      |      Flame    | DrillOut   |

  Scenario Outline: dimension_pie_ratio
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 5"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And take part of "StatisticalChart" with name "actual/<chartType>_<segments_num>_<ratio>"
    And I compare source image "actual/<chartType>_<segments_num>_<ratio>" with target image "expect/<chartType>_<segments_num>_<ratio>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<segments_num>"
    And I set the parameter "DescribeInput" with value "AutoCreate_<ratio>"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   | color  | segments_num | ratio | client_ip      |
      |      Pie      | Red    | 2            | 0.9   | 183.14.126.214 |
      |      Pie      | Green  | 3            | 0     | 1.207.60.51    |