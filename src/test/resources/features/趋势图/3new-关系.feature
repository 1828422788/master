Feature: 趋势图新建_关系

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: connection(RZY-2505,2507,2511)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Green" button
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
      |   chartType   |   caseNum  |   spl   |
      |    Chord      |    2505    |  tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path  |
      |    Sankey     |    2507    |  tag:sample04061424_chart  AND NOT apache.clientip:221.226.97.92 \| stats count() by apache.clientip,apache.resp_len,apache.method \| limit 10 |
      |    Force      |    2511    |  tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path \|limit 10      |

  Scenario Outline: connection_force_repulsion
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I set the parameter "Repulsion" with value "20"
    And I click the "Generate" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/trend/repulsion_<chartType>"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_repulsion"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "无数集app之api全部测试用例" from the "AppField"
    And I click the "FinishButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |    Force      |    2505    |  tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path  |

  Scenario Outline: connection_sankey_multistage
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "<button>" button
    And I click the "Generate" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "日志展现/trend/<button>_<chartType>"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<button>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "无数集app之api全部测试用例" from the "AppField"
    And I click the "FinishButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |  button    |   spl   |
      |    Sankey     | Multistage |  tag:sample04061424_chart \| stats count() by json.fromstate,json.tostate \| limit 3      |

