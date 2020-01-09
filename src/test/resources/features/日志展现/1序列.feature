Feature: 高级搜索视图_序列
#8

  # tag:auto_sample_chart should be uploaded for Today
  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 序列（RZY-2770,2771,2769,2768)
    When I set the parameter "SearchInput" with value "tag:auto_sample_chart | stats count() by apache.clientip,apache.method"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/高级搜索视图/序列/<caseNum>_<chartType>"
    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/序列/<caseNum>_<chartType>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/序列/<caseNum>_<chartType>.png"

    Examples:
      |   chartType   |   caseNum  |
      |   LineChart   |     2770   |
      |   AreaChart   |     2771   |
      |  ScatterChart |     2766   |
      |  ColumnChart  |     2768   |

  Scenario Outline: 序列_曲线图（RZY-832)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Yaxis" button
    And I set the parameter "Unit" with value "<unitValue>"
    And I click the "<buttonChoice>" button
    And I click the "Generate" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/高级搜索视图/序列/<caseNum>_<chartType>/<caseNum>_<buttonChoice>"
    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/序列/<caseNum>_<chartType>/<caseNum>_<buttonChoice>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/序列/<caseNum>_<chartType>/<caseNum>_<buttonChoice>.png"

    Examples:
      |   chartType   | unitValue  | buttonChoice      |  caseNum  |   spl|
      |   LineChart   |   个       | Smooth            | 832    |  tag:auto_sample_chart \| stats count() by apache.clientip,apache.method  |
      |   LineChart   |   个       | ConnectEmptyData  | 832    |  tag:auto_sample_chart \| stats count() by apache.clientip,apache.method  |

  Scenario Outline: 序列_堆叠（RZY-2767,2773)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Group" button
    And I click the "<buttonChoice>" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I click the "Generate" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/高级搜索视图/序列/<caseNum>_<chartType>_Pile"
    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/序列/<caseNum>_<chartType>_Pile.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/序列/<caseNum>_<chartType>_Pile.png"

    Examples:
      |   chartType   | buttonChoice  | color  |  caseNum  |   spl|
      |   AreaChart   |    Pile       | Red    | 2767      |  tag:auto_sample_chart \| stats count() by apache.clientip,apache.method  |
      |  ColumnChart  |    Pile       | Yellow | 2773      |  tag:auto_sample_chart \| stats count() by apache.clientip,apache.method  |

  Scenario Outline: 序列_scatter_bubble
    When I set the parameter "SearchInput" with value "tag:auto_sample_chart | stats count() by apache.clientip,apache.method"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Bubble" button
    And I click the "AccordingField" button
    And I choose the "<bubbleSize>" from the "BubbleSize"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I click the "Generate" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/高级搜索视图/序列/<caseNum>_<chartType>"
    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/序列/<caseNum>_<chartType>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/序列/<caseNum>_<chartType>.png"

    Examples:
      |   chartType   |   bubbleSize |caseNum  |
      |  ScatterChart |    count()   | bubbles   |