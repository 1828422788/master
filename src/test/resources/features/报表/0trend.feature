@report @setup1
Feature: 报表_趋势图

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page

  Scenario: table
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count()"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    When I set the parameter "NameInput" with value "报表测试"
    And I set the parameter "TagInput" with value "auto_package"
    And I set the parameter "DescribeInput" with value "AutoCreate"
#    And I choose the "auto_package" from the "GroupField"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible
