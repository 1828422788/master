Feature: 仪表盘输入项

  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建成功"

    Examples:
      | name  |
      | 测试输入项 |

  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "过滤项"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete

    Examples:
      | name  |
      | 测试输入项 |

  Scenario Outline: RZY-1668添加输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加输入项" from the "EventList"
    And I set the parameter "FilterTitle" with value "<filter>"
    And I set the parameter "FilterToken" with value "<filter>"
    And I set the parameter "FilterDefaultValue" with value "<defaultValue>"
    Then I click the "EnsureCreateInput" button
    Then I wait for "FilterName" will be visible

    Examples:
      | filter | defaultValue    |
      | filter | apache.geo.city |

  Scenario Outline: 创建仪表盘所用趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button
    And I wait for "SearchInput" will be visible
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "NextButton" button
    Then I will see the element "SuccessCreate" name is "新建成功！"

    Examples:
      | name         | spl                                                                                       |
      | 仪表盘所用趋势图     | *\|stats count() by 'apache.geo.city'                                                     |
      | 仪表盘1669所用趋势图 | (appname:\"aa\") \|bucket timestamp span=6h as ts \|stats count(\'tag\') as \'tag\' by ts |

  Scenario: 验证RZY-1668:单引号包裹
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加图表" from the "EventList"
    And I check "仪表盘所用趋势图" from the "CheckBox"
    And I click the "EnsureAddTrend" button
    And I wait for "ChartSetting" will be visible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value "* | stats count() by ${filter|s}"
    And I click the "SettingEnsure" button
    Then I compare with list "TableList"

  Scenario: 删除图表单引号包裹
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "DeleteChart" button
    And I click the "EnsureDeleteChart" button

  Scenario: 删除单引号输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterDelete" button
    And I click the "EnsureDeleteInput" button

  Scenario Outline: RZY-1669添加输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加输入项" from the "EventList"
    And I set the parameter "FilterTitle" with value "<filter>"
    And I set the parameter "FilterToken" with value "<filter>"
    And I set the parameter "FilterDefaultValue" with value "<defaultValue>"
    Then I click the "EnsureCreateInput" button
    Then I wait for "FilterName" will be visible

    Examples:
      | filter | defaultValue |
      | filter | aa           |

  Scenario: 验证RZY-1669:双引号包裹
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加图表" from the "EventList"
    And I set the parameter "TrendName" with value "仪表盘"
    And I click the "DashboardTrend1669" button
    And I click the "EnsureAddTrend" button
    And I wait for "ChartSetting" will be visible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "(appname:${filter|d})  |bucket timestamp span=6h as ts |stats count('tag') as 'tag' by ts"
    And I click the "SettingEnsure" button
    Then I compare with list "TableList"

  Scenario: 删除双引号输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterDelete" button
    And I click the "EnsureDeleteInput" button

  Scenario: 增加标识前后缀
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加输入项" from the "EventList"
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I set the parameter "FilterDefaultValue" with value "apache.geo.city"
    And I set the parameter "Prefix" with value "by "
    And I set the parameter "Suffix" with value " |limit 5"
    Then I click the "EnsureCreateInput" button
    Then I wait for "FilterName" will be visible

  Scenario: 验证标识前后缀
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "* | stats count() by apache.geo.city |limit 5"
    And I click the "SettingEnsure" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "* | stats count() ${filter}"
    And I click the "SettingEnsure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  Scenario: 修改标识值
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterInput" will be visible
    And I set the parameter "FilterInput" with value "appname"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    Then I wait for "Appname" will be visible

  Scenario: 修改为自动搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I "checked" the checkbox which name is "当输入项值改变时自动搜索"
    Then I click the "EnsureCreateInput" button
    Then I wait for "FilterInput" will be visible
    And I set the parameter "FilterInput" with value "appname"
    And I let element "FilterInput" lose focus
    And I wait for "Progress" will be invisible
    Then I wait for "Appname" will be visible

  Scenario: 删除文本输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterDelete" button
    And I click the "EnsureDeleteInput" button

  Scenario: 修改图表搜索语句
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "apache.geo.city:${filter} | stats count() by apache.geo.city"
    And I click the "SettingEnsure" button

  Scenario: 添加下拉菜单输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加输入项" from the "EventList"
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I choose the "下拉菜单" from the "InputType"
    And I click the "SingleChoice" button
    And I set the parameter "ChoiceValue" with value "北京市"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "南京市"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "济南市"
    And I click the "AddChoiceValueButton" button
    And I choose the "北京市" from the "DefaultDropdownList"
    Then I click the "EnsureCreateInput" button
    Then I wait for "FilterName" will be visible

  Scenario: 验证下拉菜单默认输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "apache.geo.city:北京市 | stats count() by apache.geo.city"
    And I click the "SettingEnsure" button
    Then I compare with list "TableList"

  Scenario: 验证下拉菜单搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "apache.geo.city:济南市 | stats count() by apache.geo.city"
    And I click the "SettingEnsure" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "apache.geo.city:${filter} | stats count() by apache.geo.city"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    And I choose the "济南市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  Scenario: 修改下拉菜单为自动搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I "checked" the checkbox which name is "当输入项值改变时自动搜索"
    Then I click the "EnsureCreateInput" button
    Then I wait for "FilterName" will be visible

  Scenario: 验证下拉菜单为自动搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "apache.geo.city:济南市 | stats count() by apache.geo.city"
    And I click the "SettingEnsure" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "apache.geo.city:${filter} | stats count() by apache.geo.city"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    And I choose the "济南市" from the "FilterDropdown"
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  Scenario: 修改为多选并填入分割符
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I click the "MultiSelect" button
    And I set the parameter "Separate" with value "OR apache.geo.city:"
    Then I click the "EnsureCreateInput" button
    Then I wait for "FilterName" will be visible

  Scenario: 验证多选生效
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I choose the "济南市,南京市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "apache.geo.city:北京市 OR apache.geo.city:济南市 OR apache.geo.city:南京市 | stats count() by apache.geo.city"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  Scenario: 增加前后缀值
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I set the parameter "Prefix" with value "appname:* AND "
    And I set the parameter "Suffix" with value " ,appname"
    Then I click the "EnsureCreateInput" button
    Then I wait for "FilterName" will be visible

  Scenario: 验证前后缀生效
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "appname:* AND apache.geo.city:北京市 OR apache.geo.city: 南京市 AND tag:* | stats count() by apache.geo.city"
    And I click the "SettingEnsure" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "${filter} | stats count() by apache.geo.city"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    And I choose the "南京市" from the "FilterDropdown"
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  Scenario: 修改通用配置搜索语句
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterDelete" button
    And I click the "EnsureDeleteInput" button
    And I wait for "EnsureDeleteInput" will be invisible
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "${filter} apache.geo.city:成都市 | stats count() by apache.geo.city"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible

  Scenario: 增加标识值前后缀
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加输入项" from the "EventList"
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I choose the "下拉菜单" from the "InputType"
    And I set the parameter "ChoiceValue" with value "北京市"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "南京市"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "济南市"
    And I click the "AddChoiceValueButton" button
    And I choose the "北京市" from the "DefaultDropdownList"
    And I set the parameter "PrefixValue" with value "apache.geo.city:"
    And I set the parameter "SuffixValue" with value " OR"
    And I set the parameter "Separate" with value ""
    And I let element "SuffixValue" lose focus
    Then I will see the element "Preview" name is "apache.geo.city:北京市 OR"
    Then I click the "EnsureCreateInput" button
    Then I wait for "FilterName" will be visible

  Scenario: 验证标识符前后缀
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I choose the "济南市,南京市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "apache.geo.city:北京市 OR apache.geo.city:济南市 OR apache.geo.city:南京市 OR apache.geo.city:成都市 | stats count() by apache.geo.city"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  Scenario: 删除下拉菜单输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterDelete" button
    And I click the "EnsureDeleteInput" button
    And I wait for "EnsureDeleteInput" will be invisible
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "apache.resp_len:>${filter}| table apache.resp_len"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible

  Scenario: 添加动态菜单输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加输入项" from the "EventList"
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I choose the "动态菜单" from the "InputType"
    And I click the "SingleChoice" button
    And I set the parameter "DynamicField" with value "avg_len"
    And I set the parameter "Spl" with value "* | stats avg(apache.resp_len) as avg_len by apache.clientip"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "Search" button under some element
    And I choose the "1441" from the "DefaultDropdownList"
    Then I click the "EnsureCreateInput" button
    Then I wait for "FilterName" will be visible

  Scenario: 验证动态菜单默认值结果
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "apache.resp_len:>1441| table apache.resp_len"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  Scenario: 切换动态菜单值并验证结果
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "apache.resp_len:>${filter}| table apache.resp_len"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    And I wait for "Progress" will be invisible
    And I choose the "3589.4" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "apache.resp_len:>3589.4| table apache.resp_len"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  Scenario: 增加动态菜单标识符前后缀
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I set the parameter "Prefix" with value "apache.resp_len:>"
    And I set the parameter "Suffix" with value "| "
    Then I click the "EnsureCreateInput" button
    Then I wait for "FilterName" will be visible
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "${filter}table apache.resp_len"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "apache.resp_len:>1441| table apache.resp_len"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  Scenario: 增加动态菜单多选及标识值前后缀
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterDelete" button
    And I click the "EnsureDeleteInput" button
    And I wait for "EnsureDeleteInput" will be invisible
    When I click the "AddEventButton" button
    And I choose the "添加输入项" from the "EventList"
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I choose the "动态菜单" from the "InputType"
    And I set the parameter "DynamicField" with value "apache.geo.city"
    And I set the parameter "Spl" with value "apache.geo.city:* | stats count() by apache.geo.city"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "Search" button under some element
    And I choose the "北京市" from the "DefaultDropdownList"
    And I set the parameter "PrefixValue" with value "apache.geo.city:"
    And I set the parameter "SuffixValue" with value " AND tag:sample*"
    And I set the parameter "Separate" with value "OR"
    Then I click the "EnsureCreateInput" button
    Then I wait for "FilterName" will be visible

  Scenario: 验证多选
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "${filter} | stats count() by apache.geo.city"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    And I wait for "Progress" will be invisible
    And I choose the "深圳市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "apache.geo.city:北京市 AND tag:sample* OR apache.geo.city:深圳市 AND tag:sample* | stats count() by apache.geo.city"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  Scenario: 验证修改值自动搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I "checked" the checkbox which name is "当输入项值改变时自动搜索"
    Then I click the "EnsureCreateInput" button
    Then I wait for "FilterName" will be visible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "${filter} | stats count() by apache.geo.city"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    And I wait for "Progress" will be invisible
    And I choose the "深圳市" from the "FilterDropdown"
    And I click the "FilterName" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name         |
      | 仪表盘1669所用趋势图 |
      | 仪表盘所用趋势图     |

  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name  |
      | 测试输入项 |