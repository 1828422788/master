Feature: 趋势图新建_序列

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: sequence(RZY-2477,2005,2491,2499)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
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
    |   chartType   |caseNum  |  spl  |
    |    LineChart  |  2477   | tag:sample04061424_chart  \| stats count() by apache.clientip,apache.method|
    |   AreaChart   |  2005   | tag:sample04061424_chart  \| bucket timestamp span = 30m as ts \| stats count()  as cnt by apache.status,ts \|sort by cnt \| limit 20 |
    |  ScatterChart |  2491   | tag:sample04061424_chart  \| stats count() by apache.clientip,apache.resp_len \| limit 10                    |
    |  ColumnChart  |  2499   | tag:sample04061424_chart  \| stats count() by apache.clientip,apache.method|

  Scenario Outline: sequence_pile
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

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
    And take part of "Chart" with name "日志展现/trend/<chartType>_<buttonChoice>"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<buttonChoice>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "无数集app之api全部测试用例" from the "AppField"
    And I click the "FinishButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   | buttonChoice  | color  |  caseNum  |   spl|
      |   AreaChart   |    Pile       | Red    | 2767      |  tag:sample04061424_chart \| stats count() by apache.clientip,apache.method  |
      |  ColumnChart  |    Pile       | Yellow | 2773      |  tag:sample04061424_chart \| stats count() by apache.clientip,apache.method  |

  Scenario Outline: sequence_bubble
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

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
    And take part of "Chart" with name "日志展现/trend/<chartType>_<caseNum>"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "无数集app之api全部测试用例" from the "AppField"
    And I click the "FinishButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |   bubbleSize |caseNum  |
      |  ScatterChart |    count()   | bubbles   |

