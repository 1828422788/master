@all @trend @createTrendConnection @createTrend
Feature: 趋势图新建_关系
# sample04061424_chart for Yesterday
# auto_sankey  Today

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario Outline: connection(RZY-2505,2507,2511)
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Connection" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/<chartType>_<caseNum>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
    And I compare source image "expect/<chartType>_<caseNum>" with target image "actual/<chartType>_<caseNum>"

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |    Chord      |    2505    |  starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path  |
      |    Sankey     |    2507    |  starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart  AND NOT apache.clientip:221.226.97.92 AND NOT apache.clientip:117.136.79.162 \| stats count() by apache.clientip,apache.resp_len,apache.method \| limit 4 |
      |    Force      |    2511    |  starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path \|limit 10      |

  Scenario Outline: connection_force_repulsion
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And take part of "Chart" with name "actual/<chartType>_repulsion"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_repulsion"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
#    And I compare source image "expect/<chartType>_repulsion" with target image "actual/<chartType>_repulsion"

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |    Force      |    2505    |  starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path  |

  Scenario Outline: connection_sankey_multistage
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
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
    And take part of "Chart" with name "actual/<chartType>_<button>"
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<button>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
    And I compare source image "expect/<chartType>_<button>" with target image "actual/<chartType>_<button>"

    Examples:
      |   chartType   |  button    |   spl   |
      |    Sankey     | Multistage |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:auto_sankey \| stats count() by json.fromstate,json.tostate \| limit 3      |

#  @compareTrend @compareTrendConnection
#  Scenario Outline: compare_view
#    Given open the "trend.ListPage" page for uri "/trend/"
#    When I set the parameter "SearchInput" with value "<name>"
#    And I wait for loading invisible
#    And the data name is "{'column':'0','name':'<name>'}" then i click the "展示趋势图" button
#    And switch to window "查看趋势图"
#    And I close all tabs except main tab
#    Then I will see the "trend.ViewPage" page
#    And I wait for "ChartName" will be visible
#    And I wait for "ChartView" will be visible
#    And I will see the "NoData" doesn't exist
#    And I drag the scroll bar to the element "ChartView"
#    And I wait for "3000" millsecond
#    And I will see the element "ChartName" contains "<name>"
#    And take part of "ChartView" with name "actual_view/<name>"
#    And I compare source image "expect_view/<name>" with target image "actual_view/<name>"
#
#    Examples:
#      | name                                     |
#      | Sankey_Multistage                        |
##      | Force_repulsion                          |
#      | Force_2511                               |
#      | Sankey_2507                              |
#      | Chord_2505                               |
