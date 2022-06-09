@dashboard2_2 @dashboardChart
Feature: 仪表盘_2_2_玫瑰图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘玫瑰图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘玫瑰图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 修改为玫瑰图 RZY-300
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Dimension" will be visible
    And I click the "Dimension" button
    And I click the "<targetName>" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    And I choose the "count()" from the "DataValue"
    And I click the "Divide" button
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name   | targetName |
      | 仪表盘玫瑰图 | Rose       |

  Scenario Outline: 不展示标签
    And I click the "ChartType" button
    Then I will see the "trend.CreatePageDash" page
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    And I click the "Exhibition" button
    And I choose the "不展示" from the "ShowLabel"
    And I wait for "500" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
#    And take part of "FullScreen" with name "dashboard/<name>不展示标签"
#    Then I compare source image "dashboard/<name>不展示标签" with target image "dashboard/<targetName>WithoutTag"

    Examples:
      | name   | targetName |
      | 仪表盘玫瑰图 | Rose       |

  
  Scenario Outline: 展示全部标签
    And I click the "ChartType" button
    Then I will see the "trend.CreatePageDash" page
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    And I click the "Exhibition" button
    And I choose the "全部展示" from the "ShowLabel"
    And I wait for "1000" millsecond
    And I choose the "3" from the "Precision"
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button

    Examples:
      | name   | targetName |
      | 仪表盘玫瑰图 | Rose       |