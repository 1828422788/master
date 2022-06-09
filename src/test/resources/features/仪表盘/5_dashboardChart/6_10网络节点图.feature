@dashboard6_10 @dashboardChart
Feature: 仪表盘_6_10_网络节点图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘网络节点图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘网络节点图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
  
  Scenario Outline: 修改为网络节点图
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "<targetName>" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I set the parameter "Repulsion" with value "30"
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "Generate" button
    And I wait for "3000" millsecond
    And I click the "Setting" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I move the mouse pointer to the "TrendTitle"
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name          | targetName  |
      | 仪表盘网络节点图 | NetworkNode |


  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-4836
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I will see the "TextLayer" result will contain "<json>"

    Examples:
      | name          | json                                                                                                                                                                                                                                                                                                                                                                           |
      | 仪表盘网络节点图 |  \n  "chart": {\n    "chartType": "networknode",\n    "fromField": "apache.method",\n    "toField": "apache.geo.province",\n    "portField": "apache.geo.city",\n    "repulsionField": 30,\n    "precision": "",\n    "expendLevel": 1,\n    "indicatorsField": []\n  } |