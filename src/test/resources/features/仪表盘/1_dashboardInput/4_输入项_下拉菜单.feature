@dashboardInput
Feature:仪表盘输入项_4下拉菜单

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  Scenario: 修改图表搜索语句
    And I set the parameter "TextFilter" with value "测试输入项_下拉菜单"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_下拉菜单"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I switch the dashboard "FilterAutoRefresh" button to "disable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "apache.geo.city:${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"

  Scenario: 添加下拉菜单输入项 RZY-275，RZY-279
    And I set the parameter "TextFilter" with value "测试输入项_下拉菜单"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_下拉菜单"
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
    And I choose the "下拉菜单" from the "InputType"
    And I click the "SingleChoice" button
    And I set the parameter "ChoiceValue" with value "北京市"
    And I click the Element with text "添加"
    And I set the parameter "ChoiceValue" with value "南京市"
    And I click the Element with text "添加"
    And I set the parameter "ChoiceValue" with value "济南市"
    And I click the Element with text "添加"
    And I choose the "北京市" from the "DefaultDropdownList"
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加输入项成功"

  Scenario: 验证下拉菜单默认输入项 RZY-280
    And I set the parameter "TextFilter" with value "测试输入项_下拉菜单"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_下拉菜单"
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
    And I set the parameter "Spl" with value "apache.geo.city:北京市 | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    Then I compare with list "TableList"

  Scenario: 验证下拉菜单搜索 RZY-276
    And I set the parameter "TextFilter" with value "测试输入项_下拉菜单"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_下拉菜单"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "tag:sample04061424_chart AND apache.geo.city:济南市 | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "tag:sample04061424_chart AND apache.geo.city:${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    And I choose the "济南市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for loading invisible
    Then I compare with list "TableList"

  Scenario: 修改下拉菜单为自动搜索 RZY-278
    And I set the parameter "TextFilter" with value "测试输入项_下拉菜单"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_下拉菜单"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I move the mouse pointer to the text "filter"
    And I click the "FilterSetting" button
    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    Then I click the "Ensure" button

  Scenario: 验证下拉菜单为自动搜索 RZY-278
    And I set the parameter "TextFilter" with value "测试输入项_下拉菜单"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_下拉菜单"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "tag:sample04061424_chart AND (apache.geo.city:济南市) | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "tag:sample04061424_chart AND (apache.geo.city:${filter}) | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    And I choose the "济南市" from the "FilterDropdown"
    And I wait for loading invisible
    Then I compare with list "TableList"

  Scenario: 修改为多选并填入分割符 RZY-3428,RZY-3431
    And I set the parameter "TextFilter" with value "测试输入项_下拉菜单"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_下拉菜单"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I move the mouse pointer to the text "filter"
    And I click the "FilterSetting" button
    And I click the "MultiSelect" button
    And I set the parameter "Separate" with value "OR apache.geo.city:"
    Then I click the "Ensure" button

  Scenario: 验证多选生效 RZY-3428,RZY-3431
    And I set the parameter "TextFilter" with value "测试输入项_下拉菜单"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_下拉菜单"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "北京市,济南市,南京市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for loading invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "tag:sample04061424_chart AND (apache.geo.city:北京市 OR apache.geo.city:济南市 OR apache.geo.city:南京市) | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    Then I compare with list "TableList"

  Scenario: 增加前后缀值 RZY-3429
    And I set the parameter "TextFilter" with value "测试输入项_下拉菜单"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_下拉菜单"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I move the mouse pointer to the text "filter"
    And I click the "FilterSetting" button
    And I set the parameter "Prefix" with value "(apache.geo.city:"
    And I set the parameter "Suffix" with value ") AND tag : sample04061424_chart "
    Then I click the "Ensure" button

  Scenario: 验证前后缀生效 RZY-3429
    And I set the parameter "TextFilter" with value "测试输入项_下拉菜单"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_下拉菜单"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "(apache.geo.city:北京市 OR apache.geo.city: 南京市) AND tag : sample04061424_chart | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    And I choose the "北京市,南京市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for loading invisible
    Then I compare with list "TableList"

  @dashboardInputSmoke
  Scenario: 修改通用配置搜索语句
    And I set the parameter "TextFilter" with value "测试输入项_下拉菜单_多选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_下拉菜单_多选"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I switch the dashboard "FilterAutoRefresh" button to "disable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "${filter} apache.geo.city:成都市) AND tag : sample04061424_chart | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"

  @dashboardInputSmoke
  Scenario: 增加标识值前后缀 RZY-3430
    And I set the parameter "TextFilter" with value "测试输入项_下拉菜单_多选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_下拉菜单_多选"
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
    And I choose the "下拉菜单" from the "InputType"
    And I click the "MultiSelect" button
    And I set the parameter "ChoiceValue" with value "北京市"
    And I click the Element with text "添加"
    And I set the parameter "ChoiceValue" with value "南京市"
    And I click the Element with text "添加"
    And I set the parameter "ChoiceValue" with value "济南市"
    And I click the Element with text "添加"
    And I choose the "北京市" from the "DefaultDropdownList"
    And I set the parameter "Prefix" with value "("
    And I set the parameter "PrefixValue" with value "apache.geo.city:"
    And I set the parameter "SuffixValue" with value " OR"
    And I set the parameter "Separate" with value ""
    And I let element "SuffixValue" lose focus
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加输入项成功"

  @dashboardInputSmoke
  Scenario: 验证标识符前后缀 RZY-3430
    And I set the parameter "TextFilter" with value "测试输入项_下拉菜单_多选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_下拉菜单_多选"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "济南市,南京市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for loading invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "(apache.geo.city:北京市 OR  apache.geo.city:南京市 OR  apache.geo.city:济南市 OR apache.geo.city:成都市) AND tag : sample04061424_chart | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    Then I compare with list "TableList"