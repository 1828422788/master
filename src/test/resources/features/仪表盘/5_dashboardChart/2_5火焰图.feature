@dashboard2_5 @dashboardChart
Feature: 仪表盘_2_5_火焰图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘火焰图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘火焰图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 修改为火焰图 RZY-4901
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Dimension" will be visible
    And I click the "Dimension" button
    And I click the "Flame" button
    And I click the "SettingChart" button
    And I click the "Divide" button
    And I wait for "500" millsecond
    And I click the "DeleteFirst" button
    And I wait for "500" millsecond
    And I click the "DeleteFirst" button
    And I wait for "500" millsecond
    And I click the "Facet" button
    And I wait for "500" millsecond
    And I choose the "apache.method" from the "DataValue"
    And I wait for "1500" millsecond
    And I set the parameter "ColumnNum" with value "2"
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
      | 仪表盘火焰图 |

  Scenario Outline: 火焰图操作 RZY-4902
    And I click the Circle "ShanDong" button
    And I wait for "1000" millsecond
    Then I will see the text "四川" is not existed in page
    Then I will see the text "北京市" is not existed in page
    Then I will see the text "深圳市" exist in page
    Then I will see the text "济南市" exist in page
    And I wait for "1000" millsecond
    And I click the Circle "BackIcon" button
    Then I will see the text "四川" exist in page
    Then I will see the text "北京市" exist in page
    Then I will see the text "济南市" is not existed in page
    And I wait for "1000" millsecond

    Examples:
      | name    |
      | 仪表盘火焰图 |