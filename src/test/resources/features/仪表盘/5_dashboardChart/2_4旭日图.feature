@dashboard2_4 @dashboardChart
Feature: 仪表盘_2_4_旭日图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘旭日图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘旭日图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 修改为旭日图 RZY-3398
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Dimension" will be visible
    And I click the "Dimension" button
    And I click the "<targetName>" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    And I choose the "count()" from the "DataValue"
    And I wait for "1000" millsecond
    And I click the "Divide" button
#    And I choose the "apache.clientip" from the "DataValue"
#    And I wait for "1000" millsecond
#    And I choose the "apache.resp_len" from the "DataValue"
#    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name   | targetName |
      | 仪表盘旭日图 | Sunburst   |