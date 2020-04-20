@all @logDisplay @logDisplayDimension
Feature: 日志展现_维度
#11

  # tag:sample04061424_chart should be uploaded for Today
  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"


  Scenario Outline: dimension(RZY-833,2776,2778,2782)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
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
    Then I compare source image "expect/高级搜索视图/2维度/<caseNum>_<chartType>" with target image "actual/高级搜索视图/2维度/<caseNum>_<chartType>"

    Examples:
      |   chartType   |   caseNum  |  spl   |
      |      Pie      |     833    | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Rose     |     2776   | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Bar      |     2778   | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Sun      |     2782   | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.province, apache.geo.city|

  Scenario Outline: dimension_sun(RZY-2781)
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.status,apache.geo.province, apache.geo.city"
    And I click the "DateEditor" button
    And I click the "Today" button
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
    Then I compare source image "expect/高级搜索视图/2维度/<caseNum>_<chartType>" with target image "actual/高级搜索视图/2维度/<caseNum>_<chartType>"

    Examples:
      |   chartType   | color1   |  caseNum  |
      |      Sun      | DarkBlue | 2781     |

  Scenario Outline: dimension_pie（RZY-2774)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Value" button
    And I choose the "<value>" from the "FieldValue"
    And I click the "Divide" button
    And I choose the "<divValue>" from the "FieldValue"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color1>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度/<caseNum>_<chartType>"
    Then I compare source image "expect/高级搜索视图/2维度/<caseNum>_<chartType>" with target image "actual/高级搜索视图/2维度/<caseNum>_<chartType>"

    Examples:
      |   chartType   |  value      |     divValue   | color1   |caseNum  | spl   |
      |      Pie      |  count      | apache.clientip| Red      |2774     |  tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |

  Scenario Outline: label(RZY-4205,4208,4211,4206,4209,4212,4207,4210)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Dimension" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I choose the "<option1>" from the "ShowLabel"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度/label/<chartType>_<option1>_nolabel"
    Then I compare source image "expect/高级搜索视图/2维度/label/<chartType>_<option1>_nolabel" with target image "actual/高级搜索视图/2维度/label/<chartType>_<option1>_nolabel"

    When I click the "Settings" button
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I choose the "<option2>" from the "ShowLabel"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度/label/<chartType>_<option2>_full"
    Then I compare source image "expect/高级搜索视图/2维度/label/<chartType>_<option2>_full" with target image "actual/高级搜索视图/2维度/label/<chartType>_<option2>_full"

    When I click the "Settings" button
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I choose the "<option3>" from the "ShowLabel"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度/label/<chartType>_<option3>_name"
    Then I compare source image "expect/高级搜索视图/2维度/label/<chartType>_<option3>_name" with target image "actual/高级搜索视图/2维度/label/<chartType>_<option3>_name"

    Examples:
      |   chartType   |  option1   | option2   | option3    | spl   |
      |      Pie      |  不展示     | 展示全部   | 只展示名称  |tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Rose     |  不展示     | 展示全部   | 只展示名称  |tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Bar      |  不展示     | 展示全部   | 只展示名称  |tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |

  Scenario Outline: label_location(RZY-4213,4214,4215,4216,4217,4218,4219,4220,4221,4222)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
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
    And I choose the "<option1>" from the "LabelLocation"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option1>_out_left"
    Then I compare source image "expect/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option1>_out_left" with target image "actual/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option1>_out_left"

    When I click the "Settings" button
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I choose the "<option2>" from the "LabelLocation"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option2>_out_right"
    Then I compare source image "expect/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option2>_out_right" with target image "actual/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option2>_out_right"

    When I click the "Settings" button
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I choose the "<option3>" from the "LabelLocation"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option3>_middle"
    Then I compare source image "expect/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option3>_middle" with target image "actual/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option3>_middle"

    When I click the "Settings" button
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I choose the "<option4>" from the "LabelLocation"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option4>_in_left"
    Then I compare source image "expect/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option4>_in_left" with target image "actual/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option4>_in_left"

    When I click the "Settings" button
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I choose the "<option5>" from the "LabelLocation"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option5>_in_right"
    Then I compare source image "expect/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option5>_in_right" with target image "actual/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option5>_in_right"

    Examples:
      |   chartType   | color  |typeInfo | option1   | option2   | option3    | option4     | option5    | spl   |
      |      Bar      | Red    |只展示名称|柱状外左侧   | 柱状外右侧 | 柱状内中央  | 柱状内靠左侧  |柱状内靠右侧  |tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Bar      | Yellow |展示全部  |柱状外左侧   | 柱状外右侧 | 柱状内中央  | 柱状内靠左侧  |柱状内靠右侧  |tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
