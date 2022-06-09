@dashboard3_2 @dashboardChart
Feature: 仪表盘_3_3_力图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘力图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘力图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 修改为力图 RZY-307
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Relation" will be visible
    And I click the "Relation" button
    And I click the "<targetName>" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I choose the "apache.x_forward" from the "DataValue"
    And I click the "Target" button
    And I choose the "apache.resp_len" from the "DataValue"
    And I click the "Weight" button
    And I choose the "count()" from the "DataValue"
    And I click the "Exhibition" button
    And I set the parameter "Repulsion" with value "12"
    Then I click the "Generate" button
    And I wait for "3000" millsecond
    And I click the "Setting" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I move the mouse pointer to the "TrendTitle"
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name  | targetName |
      | 仪表盘力图 | Force      |

