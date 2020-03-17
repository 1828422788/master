@trendConnectionCreate
Feature: 趋势图新建_关系
# 5
# sample04061424_chart for Today
# auto_sankey  Today
# uncomment comparison

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

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "trend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<caseNum>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "TrendApp" from the "AppField"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |    Chord      |    2505    |  tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path  |
      |    Sankey     |    2507    |  tag:sample04061424_chart  AND NOT apache.clientip:221.226.97.92 AND NOT apache.clientip:117.136.79.162 \| stats count() by apache.clientip,apache.resp_len,apache.method \| limit 4 |
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
    And I click the "AddColor" button
    And I click the "Red" button
    And I set the parameter "Repulsion" with value "20"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "trend/<chartType>_repulsion"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_repulsion.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_repulsion.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_repulsion"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "TrendApp" from the "AppField"
    And I click the "NextButton" button
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

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "trend/<chartType>_<button>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<button>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/trend/<chartType>_<button>.png"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<button>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "TrendApp" from the "AppField"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |  button    |   spl   |
      |    Sankey     | Multistage |  tag:auto_sankey \| stats count() by json.fromstate,json.tostate \| limit 3      |

