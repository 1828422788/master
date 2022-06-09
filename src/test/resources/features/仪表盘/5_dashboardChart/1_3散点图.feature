@dashboard1_3 @dashboardChart
Feature: 仪表盘_1_3_散点图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘散点图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘散点图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 修改为散点图 RZY-304
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Order" will be visible
    And I click the "Order" button
    And I click the "<targetName>" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    And I choose the "apache.clientip" from the "DataValue"
    And I wait for "1000" millsecond
    And I click the "Yaxis" button
    And I choose the "count()" from the "DataValue"
    And I wait for "1000" millsecond
    And I click the "Group" button
    And I choose the "apache.resp_len" from the "DataValue"
    And I wait for "1000" millsecond
    And I click the "Bubble" button
    And I click the "AccordingField" button
    And I choose the "count()" from the "BubbleSize"
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name   | targetName   |
      | 仪表盘散点图 | ScatterChart |