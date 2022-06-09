@dashboard5_3 @dashboardChart
Feature: 仪表盘_5_3_区划地图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘区划地图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘区划地图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 修改为区划地图
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Map" will be visible
    And I click the "Map" button
    And I click the "<targetName>" button
    And I wait for "3000" millsecond
    Then I will see the "dashboard.DetailPage" page
    And I click the "ChartType" button
    And I wait for "2000" millsecond
    And I move the mouse pointer to the "TrendTitle"
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name    | targetName |
      | 仪表盘区划地图 | Regionmap  |

  Scenario: 区划地图下钻配置 RZY-3399
    When the chart title is "仪表盘区划地图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I choose the "地图向下钻取" from the "DrillAction"
    And I wait for "1000" millsecond
    And I choose the "apache.geo.province" from the "ProvinceDrillAction"
    And I wait for "1000" millsecond
    And I choose the "apache.geo.city" from the "CityDrillAction"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be invisible
#    And I wait for "15000" millsecond
    And I wait for "ChinaPoint" will be visible
    And I click the Circle "ChinaPoint" button
    And I wait for "NeimengguText" will be visible
    And I click the Circle "Neimenggu" button
    And I wait for "TongliaoshiText" will be visible

  Scenario Outline: 地图下钻 RZY-3769
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I will see the "TextLayer" result will contain "<json>"

    Examples:
      | name        | json                                                                                                                                                                                                                                                                                                                                                                           |
      | 仪表盘区划地图 |  \n  "drilldown": {\n    "type": "map"\n  } |

