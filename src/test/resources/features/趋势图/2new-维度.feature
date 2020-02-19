Feature: 趋势图新建_维度

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: dimension_default(RZY-2503,2858,2676,2850)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I click the "Generate" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/trend/<caseNum>_<chartType>"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "无数集app之api全部测试用例" from the "AppField"
    And I click the "FinishButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |   caseNum  |  spl  |
      |      Pie      |    2503    | tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 10 |
      |      Rose     |    2858    | tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 10 |
      |      Bar      |    2676    | tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 10 |
      |      Sun      |    2850    | tag:sample04061424_chart  \| stats count() by apache.status,apache.geo.province, apache.geo.city|

  Scenario Outline: dimension_labels_bar
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 10"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

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
    And take part of "Chart" with name "日志展现/trend/<chartType>_<typeInfo>_<option>"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<typeInfo>_<option>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "无数集app之api全部测试用例" from the "AppField"
    And I click the "FinishButton" button
    Then I wait for "SuccessCreate" will be visible

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
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 10"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

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
    And take part of "Chart" with name "日志展现/trend/<chartType>_<typeInfo>"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<typeInfo>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "无数集app之api全部测试用例" from the "AppField"
    And I click the "FinishButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   | color  |typeInfo    |
      |      Pie      | Orange |不展示      |
      |     Rose      | Orange |不展示      |
      |      Bar      | Orange |不展示      |
      |      Pie      | Orange |只展示名称   |
      |     Rose      | Orange |只展示名称   |
      |      Pie      | Orange |展示全部     |
      |     Rose      | Orange |展示全部     |

