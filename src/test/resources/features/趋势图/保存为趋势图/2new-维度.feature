@saveAsTrend @saveAsTrendDimension
Feature: 保存为趋势图_维度
# 21
# sample04061424_chart for Today
# uncomment comparison

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: dimension_default(RZY-2503,2858,2676,2850)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现_趋势图/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现_趋势图/<chartType>_<caseNum>.png"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTestTag" from the "GroupField"
    And I choose the "TrendApp" from the "AppField"
    And I click the "CreateEnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |   chartType   |   caseNum  |  spl  |
      |      Pie      |    2503    | tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Rose     |    2858    | tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Bar      |    2676    | tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Sun      |    2850    | tag:sample04061424_chart  \| stats count() by apache.status,apache.geo.province, apache.geo.city|

  Scenario Outline: dimension_labels_bar
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 5"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I choose the "<typeInfo>" from the "ShowLabel"
    And I choose the "<option>" from the "LabelLocation"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现_趋势图/<chartType>_<typeInfo>_<option>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<typeInfo>_<option>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现_趋势图/<chartType>_<typeInfo>_<option>.png"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<typeInfo>_<option>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTestTag" from the "GroupField"
    And I choose the "TrendApp" from the "AppField"
    And I click the "CreateEnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |   chartType   | color  |typeInfo | option       |
      |      Bar      | Red    |只展示名称| 柱状外左侧   |
      |      Bar      | Red    |只展示名称| 柱状外右侧   |
      |      Bar      | Red    |只展示名称| 柱状内中央   |
      |      Bar      | Red    |只展示名称| 柱状内靠左侧 |
      |      Bar      | Red    |只展示名称| 柱状内靠右侧 |
      |      Bar      | Green  |展示全部  | 柱状外左侧   |
      |      Bar      | Green  |展示全部  | 柱状外右侧   |
      |      Bar      | Green  |展示全部  | 柱状内中央   |
      |      Bar      | Green  |展示全部  | 柱状内靠左侧 |
      |      Bar      | Green  |展示全部  | 柱状内靠右侧 |

  Scenario Outline: dimension_labels_options
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 5"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I choose the "<typeInfo>" from the "ShowLabel"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现_趋势图/<chartType>_<typeInfo>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<typeInfo>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现_趋势图/<chartType>_<typeInfo>.png"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<typeInfo>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTestTag" from the "GroupField"
    And I choose the "TrendApp" from the "AppField"
    And I click the "CreateEnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |   chartType   | color  |typeInfo    |
      |      Pie      | Orange |不展示      |
      |     Rose      | Orange |不展示      |
      |      Bar      | Orange |不展示      |
      |      Pie      | Orange |只展示名称   |
      |     Rose      | Orange |只展示名称   |
      |      Pie      | Orange |展示全部     |
      |     Rose      | Orange |展示全部     |

