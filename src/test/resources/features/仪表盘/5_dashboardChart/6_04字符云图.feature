@dashboard6_04 @dashboardChart
Feature: 仪表盘_6_04_字符云图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘字符云图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘字符云图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 修改为字符云图 RZY-3754,RZY-312
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "<image>" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "1000" millsecond
    And I choose the "count()" from the "DataValue"
    And I click the "Divide" button
    And I wait for "1000" millsecond
#    And I choose the "apache.clientip" from the "DataValue"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I click the "TrendTitle" button
    And take part of "FullScreen" with name "dashboard/<name>"
#    Then I compare source image "dashboard/<name>" with target image "dashboard/<image>"

    Examples:
      | name    | image     |
      | 仪表盘字符云图 | Wordcloud |


  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3754
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I will see the dashboard highEditor text will contain "<json>"

    Examples:
      | name    | json                                                                                                                                                                                                                                                                                                                                                                           |
      | 仪表盘字符云图 | "chart": {\n    "chartType": "wordcloud",\n    "field": "count()",\n    "byFields": [\n      "apache.clientip"\n    ]\n  } |


  Scenario: 修改field为空 RZY-1362
    When the chart title is "仪表盘字符云图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘字符云图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip, apache.resp_len | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "wordcloud","field": "","category": "apache.clientip"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "ErrorMessage" will be visible
    And I will see the element "ErrorMessage" contains "chart -> field 字段值不能为空"
#    Then I wait for element "ErrorMessage" change text to "chart -> field 字段值不能为空"


  Scenario: 修改field为不存在 RZY-3755
    When the chart title is "仪表盘字符云图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘字符云图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip, apache.resp_len | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "wordcloud","field": "qwertycount()","category": "apache.clientip"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "校验通过"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible


  Scenario: 修改field为'apache.clientip' RZY-3755
    When the chart title is "仪表盘字符云图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘字符云图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip, apache.resp_len | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "wordcloud","field": "apache.clientip","category": ""}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "校验通过"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible


  Scenario: 修改category为'apache.resp_len' RZY-3756
    Then I wait for "NoData" will be visible
    When the chart title is "仪表盘字符云图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘字符云图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip, apache.resp_len | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "wordcloud","field": "count()","category": "apache.resp_len"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "校验通过"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"
    And I wait for "2000" millsecond
    Then I will see the "NoData" doesn't exist
#    Then I wait for "NoData" will be visible


  Scenario: 修改category为'qwerty123' RZY-3756
    When the chart title is "仪表盘字符云图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘字符云图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip, apache.resp_len | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "wordcloud","field": "count()","category": "qwerty123"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "校验通过"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible