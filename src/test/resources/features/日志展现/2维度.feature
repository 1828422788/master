Feature: 高级搜索视图_维度
#11 bug

  # tag:auto_sample_chart should be uploaded for Today
  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

#labels should be shouwn by default
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
    And take part of "Chart" with name "日志展现/高级搜索视图/2维度/<caseNum>_<chartType>"
    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/2维度/<caseNum>_<chartType>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/2维度/<caseNum>_<chartType>.png"

    Examples:
      |   chartType   |   caseNum  |  spl   |
      |      Pie      |     833    | tag:auto_sample_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Rose     |     2776   | tag:auto_sample_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Bar      |     2778   | tag:auto_sample_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Sun      |     2782   | tag:auto_sample_chart \| stats count() by apache.status,apache.geo.province, apache.geo.city|

  Scenario Outline: dimension_sun(RZY-2781)
    When I set the parameter "SearchInput" with value "tag:auto_sample_chart | stats count() by apache.status,apache.geo.province, apache.geo.city"
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
    And take part of "Chart" with name "日志展现/高级搜索视图/2维度/<caseNum>_<chartType>"
    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/2维度/<caseNum>_<chartType>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/2维度/<caseNum>_<chartType>.png"

    Examples:
      |   chartType   | color1  |  caseNum  |
      |      Sun      |  Yellow | 2781     |

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
    And take part of "Chart" with name "日志展现/高级搜索视图/2维度/<caseNum>_<chartType>"
    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/2维度/<caseNum>_<chartType>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/2维度/<caseNum>_<chartType>.png"

    Examples:
      |   chartType   |  value      |     divValue   | color1   |caseNum  | spl   |
      |      Pie      |  count      | apache.clientip| Red      |2774     |  tag:auto_sample_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |

#BUG Bar label always is shown
  Scenario Outline: label
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
    And I choose the "<option1>" from the "ShowLabel"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/高级搜索视图/2维度/label/<chartType>_<option1>_nolabel"
    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/2维度/label/<chartType>_<option1>_nolabel.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/2维度/label/<chartType>_<option1>_nolabel.png"

    When I click the "Settings" button
    And I click the "Exhibition" button
    And I choose the "<option2>" from the "ShowLabel"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/高级搜索视图/2维度/label/<chartType>_<option2>_full"
    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/2维度/label/<chartType>_<option2>_full.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/2维度/label/<chartType>_<option2>_full.png"

    When I click the "Settings" button
    And I click the "Exhibition" button
    And I choose the "<option3>" from the "ShowLabel"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/高级搜索视图/2维度/label/<chartType>_<option3>_name"
    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/2维度/label/<chartType>_<option3>_name.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/2维度/label/<chartType>_<option3>_name.png"

    Examples:
      |   chartType   |  option1   | option2   | option3    | spl   |
      |      Pie      |  不展示     | 展示全部   | 只展示名称  |tag:auto_sample_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Rose     |  不展示     | 展示全部   | 只展示名称  |tag:auto_sample_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Bar      |  不展示     | 展示全部   | 只展示名称  |tag:auto_sample_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |

  Scenario Outline: label_location
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
    And I choose the "<typeInfo>" from the "ShowLabel"
    And I choose the "<option1>" from the "LabelLocation"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option1>_out_left"
    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option1>_out_left.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option1>_out_left.png"

    When I click the "Settings" button
    And I click the "Exhibition" button
    And I choose the "<option2>" from the "LabelLocation"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option2>_out_right"
    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option2>_out_right.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option2>_out_right.png"

    When I click the "Settings" button
    And I click the "Exhibition" button
    And I choose the "<option3>" from the "LabelLocation"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option3>_middle"
    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option3>_middle.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option3>_middle.png"

    When I click the "Settings" button
    And I click the "Exhibition" button
    And I choose the "<option4>" from the "LabelLocation"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option4>_in_left"
    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option4>_in_left.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option4>_in_left.png"

    When I click the "Settings" button
    And I click the "Exhibition" button
    And I choose the "<option5>" from the "LabelLocation"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option5>_in_right"
    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option5>_in_right.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/2维度/label_location/<typeInfo>/<chartType>_<option5>_in_right.png"

    Examples:
      |   chartType   | color  |typeInfo | option1   | option2   | option3    | option4     | option5    | spl   |
      |      Bar      | Red    |只展示名称|柱状外左侧   | 柱状外右侧 | 柱状内中央  | 柱状内靠左侧  |柱状内靠右侧  |tag:auto_sample_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |      Bar      | Yellow |展示全部  |柱状外左侧   | 柱状外右侧 | 柱状内中央  | 柱状内靠左侧  |柱状内靠右侧  |tag:auto_sample_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
