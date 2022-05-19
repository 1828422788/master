@dashboardInput
Feature:仪表盘输入项_5动态菜单

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  Scenario: 验证下拉菜单默认输入项 RZY-280
    And I set the parameter "TextFilter" with value "测试输入项_动态菜单_单选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_动态菜单_单选"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.status | where apache.status > ${filter}"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible

  Scenario: 添加动态菜单输入项 RZY-281,RZY-283,RZY-286
    And I set the parameter "TextFilter" with value "测试输入项_动态菜单_单选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_动态菜单_单选"
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
    And I choose the "动态菜单" from the "InputType"
    And I click the "SingleChoice" button
    And I set the parameter "DynamicField" with value "apache.status"
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.status "
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchFilterButton" button
    And I wait for loading invisible
    And I choose the "404" from the "DefaultDropdownList"
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加输入项成功"

  Scenario: 验证动态菜单默认值结果 RZY-287
    And I set the parameter "TextFilter" with value "测试输入项_动态菜单_单选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_动态菜单_单选"
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
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.status | where apache.status > 404"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    Then I compare with list "TableList"

  Scenario: 切换动态菜单值并验证结果 RZY-284
    And I set the parameter "TextFilter" with value "测试输入项_动态菜单_单选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_动态菜单_单选"
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
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.status | where apache.status > ${filter}"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    And I choose the "405" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for loading invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.status | where apache.status > 405"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    Then I compare with list "TableList"

  Scenario: 验证动态字段、搜索内容 RZY-284,RZY-285
    And I set the parameter "TextFilter" with value "测试输入项_动态菜单_单选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_动态菜单_单选"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I move the mouse pointer to the text "filter"
    And I click the "FilterSetting" button
    And I set the parameter "DynamicField" with value ""
    And I click the "SearchFilterButton" button
    And I will see the text "该选项为必填项不能为空" exist in page
    And I click the "SearchFilterButton" button
    Then I will see the error message "缺少动态字段值"
    And I wait for "ErrorMessage" will be invisible
    And I set the parameter "DynamicField" with value "hhhhhhhhhhhhh"
    And I click the "SearchFilterButton" button
    And I wait for loading invisible
    Then I will see the error message "缺少选中的字段"
    And I wait for "ErrorMessage" will be invisible
    And I set the parameter "DynamicField" with value "avg_len"
    And I set the parameter "Spl" with value "hello goodbey"
    And I click the "SearchFilterButton" button
    Then I will see the error message "搜索语句须为stats类型"
    And I set the parameter "Spl" with value ""
    And I will see the text "该选项为必填项不能为空" exist in page

  Scenario: 增加动态菜单标识符前后缀 RZY-288
    And I set the parameter "TextFilter" with value "测试输入项_动态菜单_单选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_动态菜单_单选"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I move the mouse pointer to the text "filter"
    And I click the "FilterSetting" button
    And I set the parameter "Prefix" with value "> "
    And I set the parameter "Suffix" with value "| "
    Then I click the "Ensure" button
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.status | where apache.status ${filter}limit 3"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    And I choose the "404" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for loading invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.status | where apache.status > 404 | limit 3"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    Then I compare with list "TableList"

  Scenario: 增加动态菜单多选及标识值前后缀 RZY-288，RZY-3432
    And I set the parameter "TextFilter" with value "测试输入项_动态菜单_多选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_动态菜单_多选"
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
    And I choose the "动态菜单" from the "InputType"
    And I click the "MultiSelect" button
    And I set the parameter "DynamicField" with value "apache.geo.city"
    And I set the parameter "Spl" with value "apache.geo.city:* | stats count() by apache.geo.city"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchFilterButton" button
    And I wait for loading invisible
    And I choose the "北京市" from the "DefaultDropdownList"
    And I set the parameter "PrefixValue" with value "apache.geo.city:"
    And I set the parameter "SuffixValue" with value " AND tag:sample*"
    And I set the parameter "Separate" with value "OR"
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加输入项成功"

  Scenario: 验证多选 RZY-3432
    And I set the parameter "TextFilter" with value "测试输入项_动态菜单_多选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_动态菜单_多选"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I switch the dashboard "FilterAutoRefresh" button to "disable"
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    And I choose the "深圳市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for loading invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "apache.geo.city:北京市 AND tag:sample* OR apache.geo.city:深圳市 AND tag:sample* | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    Then I compare with list "TableList"

  Scenario: 验证修改值自动搜索 RZY-282
    And I set the parameter "TextFilter" with value "测试输入项_动态菜单_多选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_动态菜单_多选"
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
    And I wait for loading invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    And I choose the "深圳市" from the "FilterDropdown"
    And I wait for loading invisible
    Then I compare with list "TableList"

  Scenario: 输入值支持eval RZY-1834
    And I set the parameter "TextFilter" with value "测试输入项_动态菜单_多选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_动态菜单_多选"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘1669所用趋势图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "local","targets": [{"action": "eval","name": "filter","value": "${click.value2}+2000"}]}}" to json editor
    And I click the "Check" button
    And I wait for element "SuccessMessage" change text to "校验通过"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    And I move the mouse pointer to the text "filter"
    And I click the "FilterSetting" button
    And I choose the "文本输入" from the "InputType"
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I click the "NumberOf61" button
    Then I will see the element "FilterValue" value is "2061"

  Scenario: 开启钻取配置(RZY-4479)
    And I set the parameter "TextFilter" with value "测试输入项_动态菜单_多选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_动态菜单_多选"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenDrilldown" button to "enable"
    And I wait for element "SuccessMessage" change text to "钻取功能已启用"

  Scenario: 钻取配置中link类型为custom RZY-1836
    And I set the parameter "TextFilter" with value "测试输入项_动态菜单_多选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_动态菜单_多选"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{  "title": "仪表盘1669所用趋势图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "table"  },  "drilldown": {    "type": "custom",    "blank": true,    "link": "http://service.exmail.qq.com/cgi-bin/help?subtype=1&no=${test1}&id=${test2}",    "eval": [      {        "name": "test1",        "value": "${click.value2}+991916"      },      {        "name": "test2",        "value": "${click.value2}+10711"      }    ]  }}" to json editor
    And I click the "Check" button
    And I wait for element "SuccessMessage" change text to "校验通过"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    And I click the "NumberOf61" button
    And switch to another window
    And I close all tabs except main tab
    Then I will see the url contains "service.exmail.qq.com/cgi-bin/help?subtype=1&no=991977&id=10772"

  Scenario: 钻取配置中link类型为search RZY-1837
    And I set the parameter "TextFilter" with value "测试输入项_动态菜单_多选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_动态菜单_多选"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{  "title": "仪表盘1669所用趋势图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "table"  },  "drilldown": {    "type": "search",    "blank": true,    "mode": "custom",    "query": "*|stats count() by apache.status|top ${test} apache.status",    "timeRange": "-1w/w,now/w",    "eval": {      "name": "test",      "value": "${click.value2}-51"    }  }}" to json editor
    And I click the "Check" button
    And I wait for element "SuccessMessage" change text to "校验通过"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    And I click the "NumberOf61" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the "SearchInput" result will be "*|stats count() by apache.status|top 10 apache.status"
    Then I will see the "TimeRange" result will be "上周"

  Scenario: 钻取配置中link类型为dashboard RZY-1838
    And I set the parameter "TextFilter" with value "测试输入项_动态菜单_多选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_动态菜单_多选"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{  "title": "仪表盘1669所用趋势图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "table"  },  "drilldown": {    "type": "dashboard",    "blank": true,    "link": "/dashboard/7/6/?filter=${test}",    "eval": {      "name": "test",      "value": "${click.value2}-55"    }  }}" to json editor
    And I click the "Check" button
    And I wait for element "SuccessMessage" change text to "校验通过"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    And I click the "NumberOf61" button
    And switch to another window
    And I close all tabs except main tab
    Then I will see the url contains "/dashboard/7/6/?filter=6"
    Then I will see the element "FilterValue" value is "6"

  Scenario Outline: 标题、标识校验（RZY-270,RZY-271）
    And I set the parameter "TextFilter" with value "测试输入项_动态菜单_多选"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_动态菜单_多选"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加输入项" from the "AddItemMenu"
    And I set the parameter "FilterTitle" with value "<title>"
    And I set the parameter "FilterToken" with value "apache.status"
    And I will see the text "无效标识 包含（.）" exist in page
    And I set the parameter "FilterToken" with value "<token>"
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加输入项成功"

    Examples:
      | title                                   | token                                   |
      | @#¥%xiaoxiezimu汉字DAXIEZIMU（）*&……%¥¥%520 | @#¥%xiaoxiezimu汉字DAXIEZIMU（）*&……%¥¥%520 |