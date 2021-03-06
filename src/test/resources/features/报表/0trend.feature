@report @reportSmoke
Feature: 报表_0_趋势图

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario: 创建趋势图
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count()"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible 
    And I click the "NextButton" button
    And I wait for "3000" millsecond
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "报表测试"
    And I set the parameter "TagInput" with value "auto_package"
    And I click the "SelectAddedTag" button
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible
