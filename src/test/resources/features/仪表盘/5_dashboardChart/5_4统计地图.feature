@dashboard5_4 @dashboardChart
Feature: 仪表盘_5_4_统计地图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘统计地图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘统计地图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
 
  Scenario Outline: 修改为统计地图 RZY-3400
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Map" will be visible
    And I click the "Map" button
    And I click the "Geostatsmap" button
    And I click the "SettingChart" button
    And I wait for "500" millsecond
    And I click the "Generate" button
    And I wait for "3000" millsecond
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I move the mouse pointer to the "TrendTitle"
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name    |
      | 仪表盘统计地图 |