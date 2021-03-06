@dashboard6_05 @dashboardChart
Feature: 仪表盘_6_05_循序图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘循序图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘循序图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 修改为循序图 RZY-3757,RZY-315
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "2000" millsecond
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I wait for "<image>" will be visible
    And I click the "<image>" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    And I choose the "hostname" from the "DataValue"
    And I wait for "500" millsecond
    And I click the "Source" button
    And I choose the "apache.clientip" from the "DataValue"
    And I wait for "500" millsecond
    And I click the "Target" button
    And I choose the "hostname" from the "DataValue"
    And I wait for "500" millsecond
    And I click the "Divide" button
    And I choose the "apache.clientip" from the "DataValue"
    And I wait for "500" millsecond
    And I click the "Mark" button
    And I choose the "apache.clientip" from the "DataValue"
    And I wait for "500" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond
#    And take part of "FullScreen" with name "dashboard/<name>"
#    Then I compare source image "dashboard/<name>" with target image "dashboard/<image>"

    Examples:
      | name   | image    |
      | 仪表盘循序图 | Sequence |


  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3757 RZY-1366
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
#    Then I will see the "TextLayer" result will be "<json>"
    Then I will see the dashboard highEditor text will contain "<json>"

    Examples:
      | name   | json                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | 仪表盘循序图 | "chart": {\n    "chartType": "sequence",\n    "field": "hostname",\n    "fromField": "apache.clientip",\n    "toField": "hostname",\n    "labelField": "apache.clientip",\n    "byFields": [\n      "apache.clientip"\n    ]\n  } |


  Scenario Outline: 两个字段为同一个值 RZY-1365:
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "<json>" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "校验通过"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"
    And I wait for "2000" millsecond
    And take part of "FullScreen" with name "dashboard/<name>1365"
#    Then I compare source image "dashboard/<name>1365" with target image "dashboard/Sequence1365"

    Examples:
      | name   | json                                                                                                                                                                                                                                                                                                                                                                          |
      | 仪表盘循序图 | {"title": "仪表盘循序图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_chart \| stats count() by hostname,apache.clientip \|limit 5","startTime": "now/d","endTime": "now"},"chart": {"chartType": "sequence","field": "hostname","fromField": "hostname","toField": "hostname","labelField": "apache.clientip","category": "apache.clientip"}} |
