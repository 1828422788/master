@trend @acceleration @accelerationTrend @trendSmoke @accelerationSmoke
Feature: 趋势图加速_5趋势图命中加速

  Scenario: 展示趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "趋势图加速_1天"
    And I wait for loading invisible
    And the data name is "{'column':'0','name':'趋势图加速_1天'}" then i click the "展示趋势图" button in more menu
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I will see the element "ChartName" contains "趋势图加速_1天"
    Then I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible