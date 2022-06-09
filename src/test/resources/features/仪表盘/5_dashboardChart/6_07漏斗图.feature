@dashboard6_07 @dashboardChart
Feature: 仪表盘_6_07_漏斗图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘漏斗图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘漏斗图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 修改为漏斗图 RZY-3402
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "Funnel" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    And I choose the "count()" from the "DataValue"
    And I click the "Divide" button
    And I choose the "apache.clientip" from the "DataValue"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
#    Then I hide the element "SettingContent"
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button

    Examples:
      | name   |
      | 仪表盘漏斗图 |