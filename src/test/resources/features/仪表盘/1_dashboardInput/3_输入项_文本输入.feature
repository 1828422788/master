@dashboardInput
Feature:仪表盘输入项_3文本输入

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  Scenario Outline: 添加输入项 RZY-1669
    And I set the parameter "TextFilter" with value "测试输入项_文本输入"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_文本输入"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加输入项" from the "AddItemMenu"
    And I set the parameter "FilterTitle" with value "<filter>"
    And I set the parameter "FilterToken" with value "<filter>"
    And I set the parameter "FilterDefaultValue" with value "<defaultValue>"
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加输入项成功"

    Examples:
      | filter | defaultValue |
      | filter | vendors      |

  Scenario: 验证 RZY-1669
    And I set the parameter "TextFilter" with value "测试输入项_文本输入"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_文本输入"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "(appname:${filter|d}) |bucket timestamp span=6h as ts |stats count('tag') as 'tag' by ts"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    Then I compare with list "TableList"

    #######################################################################################

  Scenario: 增加标识前后缀RZY-273，RZY-274
    And I set the parameter "TextFilter" with value "测试输入项_标识前后缀"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_标识前后缀"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加输入项" from the "AddItemMenu"
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I set the parameter "FilterDefaultValue" with value "apache.geo.city"
    And I set the parameter "Prefix" with value "by "
    And I set the parameter "Suffix" with value " |limit 5"
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加输入项成功"


  Scenario: 验证标识前后缀RZY-3798
    And I set the parameter "TextFilter" with value "测试输入项_标识前后缀"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_标识前后缀"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "tag: sample04061424_chart | stats count() by apache.geo.city |limit 5"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "tag: sample04061424_chart | stats count() ${filter}"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    Then I compare with list "TableList"


  Scenario: 修改标识值
    And I set the parameter "TextFilter" with value "测试输入项_标识前后缀"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_标识前后缀"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I switch the dashboard "FilterAutoRefresh" button to "disable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I set the parameter "FilterInput" with value "appname"
    And I click the "Update" button
    And I wait for loading invisible
    And I wait for "Table" will be visible
    And I will see the element "Table" contains "appname"


  Scenario: 修改为自动搜索(RZY-272)
    And I set the parameter "TextFilter" with value "测试输入项_标识前后缀"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_标识前后缀"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I move the mouse pointer to the text "filter"
    And I click the "FilterSetting" button
    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    Then I click the "Ensure" button
    And I set the parameter "FilterInput" with value "apache.method"
    And I let element "FilterInput" lose focus
    And I wait for loading invisible
    And I wait for "Table" will be visible
    And I will see the element "Table" contains "apache.method"