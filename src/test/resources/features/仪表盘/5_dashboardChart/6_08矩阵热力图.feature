@dashboard6_08 @dashboardChart
Feature: 仪表盘_6_08_矩阵热力图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘矩阵热力图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘矩阵热力图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario: 修改为矩阵热力图 RZY-3403
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "Matrixheatmap" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    And I choose the "apache.clientip" from the "DataValue"
    And I click the "Horizontal" button
    And I click the "Yaxis" button
    And I choose the "count()" from the "DataValue"
    And I set the parameter "Segments" with value "10"
    Then I click the "Generate" button
    And I wait for "3000" millsecond
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I move the mouse pointer to the "TrendTitle"
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond