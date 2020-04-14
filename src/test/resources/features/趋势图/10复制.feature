@all @trend @copyTrend
Feature: 趋势图复制(RZY-1889)

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"


  Scenario: create_trend
    Then I click the "NewTrendButton" button
    And I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "ScatterChart" button
    And I click the "Settings" button
    And I click the "Bubble" button
    And I click the "AccordingField" button
    And I choose the "count()" from the "BubbleSize"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/test_original"
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "Copy_Test"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "TrendApp" from the "AppField"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
    And I compare source image "expect/ScatterChart_bubbles.png" with target image "actual/test_original.png"

  Scenario: copy_trend
    When the data name is "Copy_Test" then i click the "复制" button
    Then I will see the message "复制成功"
    When I click the "EnsureButton" button
    Then I will see the search result contains "{'column':'0','name':'Copy_Test(副本)'}"


  Scenario: verify_copy
    When the data name is "Copy_Test(副本)" then i click the "编辑" button
    And I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/test_copy"
    And I click the "NextButton" button
    And I will see the input element "NameInput" value will be "Copy_Test(副本)"
    And I will see the input element "DescribeInput" value will be "AutoCreate"
    And I cancel selection "TrendApp" from the "AppField"
    And I cancel selection "AutoTest" from the "GroupField"
    And I click the "NextButton" button
    Then I wait for "SuccessUpdate" will be visible
    And I compare source image "expect/ScatterChart_bubbles.png" with target image "actual/test_copy.png"

  Scenario Outline: delete_copy
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button
    Then I will see the message "确认删除 [<name>] ?"
    When I click the "EnsureButton" button
    Then I will see the success message "删除成功"

    Examples:
    | name             |
    | Copy_Test        |
    | Copy_Test(副本)  |

