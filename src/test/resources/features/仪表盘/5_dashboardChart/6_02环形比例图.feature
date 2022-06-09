@dashboard6_02 @dashboardChart
Feature: 仪表盘_6_02_环形比例图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘环形比例图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘环形比例图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario: 修改为环形比例图 RZY-4388
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "2000" millsecond
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "Ring" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    And I choose the "p" from the "DataValue"
    And I click the "Compare" button
#    And I click the "AddField" button
    And I choose the "p" from the "DataValue"
    And I click the "DivideSide" button
#    And I click the "AddField" button
    And I choose the "num" from the "DataValue"
    And I set the parameter "LayoutRow" with value "2"
    And I set the parameter "LayoutColumn" with value "2"
    And I click the "Exhibition" button
    And I choose the "2" from the "Precision"
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

  Scenario: 修改展示
    And I click the "ChartType" button
    Then I will see the "trend.CreatePageDash" page
    And I click the "Setting" button
    And I wait for "1000" millsecond
    And I click the "Exhibition" button
    And I click the "AccordingArea" button
    And I click the "AddRange" button
    And I wait for "MinRange" will be visible
    And I set the parameter "MinRange" with value "0.0002"
    And I wait for "MaxRange" will be visible
    And I set the parameter "MaxRange" with value "0.0004"
    And I click the "RangeColor" button
    And I wait for "Yellow" will be visible
    And I click the "Yellow" button
    And I wait for "2000" millsecond
    And I choose the "3" from the "Precision"
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond
