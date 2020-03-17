@copyTrend
Feature: 趋势图复制(RZY-1889)

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"


  Scenario: create_trend
    Then I click the "NewTrendButton" button
    And I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.status,apache.geo.city"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "Copy_Test"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "TrendApp" from the "AppField"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

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
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I will see the input element "NameInput" value will be "Copy_Test(副本)"
    And I will see the input element "DescribeInput" value will be "AutoCreate"
    And I cancel selection "TrendApp" from the "AppField"
    And I cancel selection "AutoTest" from the "GroupField"
    And I click the "NextButton" button
    Then I wait for "SuccessUpdate" will be visible

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

