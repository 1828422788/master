@dashboard1_2 @dashboardChart
Feature: 仪表盘_1_2_面积图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘面积图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘面积图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 修改为面积图 RZY-302
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Order" will be visible
    And I click the "Order" button
    And I click the "<targetName>" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    And I choose the "ts" from the "DataValue"
    And I wait for "1000" millsecond
    And I click the "DescendingOrder" button
    And I click the "ShowAllLabels" button
    And I click the "Yaxis" button
    And I choose the "cnt" from the "DataValue"
    And I wait for "1000" millsecond
    And I set the parameter "Unit" with value "个"
    And I wait for "1000" millsecond
    And I click the "Smooth" button
    And I wait for "1000" millsecond
    And I click the "ConnectEmptyData" button
    And I wait for "1000" millsecond
    And I set the parameter "Min" with value "10"
    And I set the parameter "Max" with value "220"
    And I wait for "1000" millsecond
    And I click the "Group" button
    And I click the "DataValue" button
    And I wait for "500" millsecond
    And I click the "DeleteFirst" button
    And I wait for "1000" millsecond
    And I click the "Yaxis" button
    And I wait for "1000" millsecond
    And I click the "Group" button
#    And I move the mouse pointer to the "DataValue"
    And I choose the "apache.status" from the "DataValue"
    And I wait for "1000" millsecond
    And I click the "Pile" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name   | targetName  |
      | 仪表盘面积图 | AreaChart |