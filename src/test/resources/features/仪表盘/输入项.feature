@dashboard0429 @dbinput @dashboard33 @dashboard
Feature: 仪表盘输入项

  @dbinputpre0 @dbinputpre
  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
#    And I click the "Create" button
    Then I will see the "trend.CreatePageDash" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "DateEditor" button
    And I wait for "Today" will be visible
    And I click the "Today" button
#    And I click the "FenPianQuYang" button
#    And I alter the input element "FenPianQuYang" value to "0"
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for loading invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "Complete" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | name         | spl                                                                                       |
      | 仪表盘所用趋势图     | tag: sample04061424_chart \|stats count() by 'apache.geo.city'                            |
      | 仪表盘1669所用趋势图 | (appname:\"aa\") \|bucket timestamp span=6h as ts \|stats count(\'tag\') as \'tag\' by ts |

  @dbinputpre1 @dbinputpre
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 测试输入项  |
      | 测试输入项1 |
      | 测试输入项2 |
      | 测试输入项3 |
      | 测试输入项4 |
      | 测试输入项5 |
      | 测试输入项6 |
      | 测试输入项7 |

  @dbinputpre2 @dbinputpre
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "过滤项"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete
    And I back to before

    Examples:
      | name   |
      | 测试输入项  |
      | 测试输入项1 |
      | 测试输入项2 |
      | 测试输入项3 |
      | 测试输入项4 |
      | 测试输入项5 |
      | 测试输入项6 |
      | 测试输入项7 |

  @dbinputpre3 @dbinputpre
  Scenario Outline: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "仪表盘1669所用趋势图"
    And I wait for loading invisible
    And I click the "{'Checkbox':'仪表盘1669所用趋势图'}" button
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name |
      | 测试输入项2 |
      | 测试输入项3 |
      | 测试输入项4 |
      | 测试输入项5 |
      | 测试输入项6 |
      | 测试输入项7 |

  @dbinput0 @dbinput01
  Scenario Outline: RZY-1668添加单引号输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "<filtername>"
    And I set the parameter "FilterToken" with value "<filtername>"
    And I set the parameter "FilterDefaultValue" with value "<defaultValue>"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

    Examples:
      | filtername | defaultValue    |
      | filter     | apache.geo.city |

  @dbinput0 @dbinput02
  Scenario: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "仪表盘所用趋势图"
    And I wait for loading invisible
    And I "checked" the checkbox which name is "仪表盘所用趋势图"
    And I click the "Ensure" button

  @dbinput0 @dbinput03
  Scenario: 验证单引号输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I set value with element "TableList"
    When the chart title is "仪表盘所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag: sample04061424_chart | stats count() by ${filter|s}"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dbinput0 @dbinput04
  Scenario: 删除图表单引号包裹
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Delete" will be visible
    And I click the "Delete" button
    And I click the "Ensure" button
    And I wait for "3000" millsecond

  @dbinput0 @dbinput05
  Scenario: 删除单引号输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "FilterName" button
    And I click the "DeleteTag" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button under some element
    Then I wait for "FilterName" will be invisible

  @dbinput1 @dbinput11
  Scenario: 添加时间范围输入项(RZY-4573,RZY-227)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项1"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项1"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "time"
    And I set the parameter "FilterToken" with value "time"
    And I click the "inputSettingType" button
    And I click the "timeRangee" button
    And I wait for "DateEditor" will be visible
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    Then I click the "Ensure" button
    Then I wait for "FilterTime" will be visible

  @dbinput1 @dbinput12
  Scenario: 验证默认值添加图表 RZY-4617
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项1"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项1"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I will see the element "DateEditor" value is "今天"
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "仪表盘所用趋势图"
    And I wait for loading invisible
    And I click the "{'Checkbox':'仪表盘所用趋势图'}" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"

  @dbinput1 @dbinput13
  Scenario: 验证时间范围输入项 RZY-4573
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项1"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项1"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I set value with element "TableList"
    When the chart title is "仪表盘所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "starttime=${time.start} endtime=${time.end} tag: sample04061424_chart | stats count() by 'apache.geo.city' "
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dbinput1 @dbinput14
  Scenario: 验证时间范围标识前后缀 RZY-4641
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项1"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项1"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I set value with element "TableList"
    And I click the "FilterTime" button
    And I click the "EditTime" button
    And I wait for "Prefix" will be visible
    And I set the parameter "Prefix" with value "="
    And I wait for "500" millsecond
    And I click the "FilterDateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I click the "Ensure" button
#    Then I wait for "FilterTime" will be visible
    And I wait for "Progress" will be invisible
#    And I set value with element "TableList"
#    And I click the "DeleteTime" button
    When the chart title is "仪表盘所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "starttime${time.start} endtime${time.end} tag: sample04061424_chart | stats count() by 'apache.geo.city' "
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
#    And I wait for "3000" millsecond
    Then I compare with list "TableList"

#  @dbinput1 @dbinput15
#  Scenario: 删除图表单和输入项
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    And I wait for loading invisible
#    And I click the detail which name is "测试输入项1"
#    Then I will see the "dashboard.DetailPage" page
#    And I wait for "Delete" will be visible
#    And I click the "Delete" button
#    And I click the "Ensure" button
#    And I click the "FilterTime" button
#    And I click the "DeleteTime" button
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button under some element
#    Then I wait for "FilterTime" will be invisible

  @dbinput2 @dbinput21
  Scenario Outline: 添加输入项 RZY-1669
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项2"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项2"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "<filter>"
    And I set the parameter "FilterToken" with value "<filter>"
    And I set the parameter "FilterDefaultValue" with value "<defaultValue>"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

    Examples:
      | filter | defaultValue |
      | filter | aa           |

  @dbinput2 @dbinput22
  Scenario Outline: 验证 RZY-1669
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "(appname:${filter|d}) |bucket timestamp span=6h as ts |stats count('tag') as 'tag' by ts"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

    Examples:
      | name |
      | 测试输入项2 |

#  @dbinput2 @dbinput23
#  Scenario: 删除双引号输入项
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    And I wait for loading invisible
#    And I click the detail which name is "测试输入项2"
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "FilterName" button
#    And I click the "DeleteTag" button
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button under some element
#    Then I wait for "FilterName" will be invisible

  @dbinput3 @dbinput31
  Scenario: 增加标识前后缀RZY-273，RZY-274
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项3"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项3"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I set the parameter "FilterDefaultValue" with value "apache.geo.city"
    And I set the parameter "Prefix" with value "by "
    And I set the parameter "Suffix" with value " |limit 5"
    And I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  @dbinput3 @dbinput32
  Scenario: 验证标识前后缀RZY-3798
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项3"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项3"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag: sample04061424_chart | stats count() by apache.geo.city |limit 5"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag: sample04061424_chart | stats count() ${filter}"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dbinput3 @dbinput33
  Scenario: 修改标识值
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项3"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项3"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "FilterInput" will be visible
    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "FilterAutoRefresh" button to "disable"
    And I wait for "500" millsecond
    And I set the parameter "FilterInput" with value "appname"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    Then I wait for "TabelAppname" will be visible

  @dbinput3 @dbinput34
  Scenario: 修改为自动搜索(RZY-272)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项3"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项3"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    Then I click the "Ensure" button
    Then I wait for "FilterInput" will be visible
    And I set the parameter "FilterInput" with value "appname"
    And I let element "FilterInput" lose focus
    And I click the "TrendTitle" button
    And I wait for "Progress" will be invisible
    Then I wait for "TabelAppname" will be visible

#  @dbinput3 @dbinput35
#  Scenario: 删除文本输入项
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    And I wait for loading invisible
#    And I click the detail which name is "测试输入项3"
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "FilterName" button
#    And I click the "DeleteTag" button
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button under some element
#    Then I wait for "FilterName" will be invisible

  @dbinput4 @dbinput41
  Scenario: 修改图表搜索语句
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项4"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项4"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page

    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "FilterAutoRefresh" button to "disable"

    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.geo.city:${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "配置成功"

  @dbinput4 @dbinput42
  Scenario: 添加下拉菜单输入项 RZY-275，RZY-279
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项4"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项4"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
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
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  @dbinput4 @dbinput43
  Scenario: 验证下拉菜单默认输入项 RZY-280
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项4"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项4"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.geo.city:北京市 | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dbinput4 @dbinput44
  Scenario: 验证下拉菜单搜索 RZY-276
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项4"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项4"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag:sample04061424_chart AND apache.geo.city:济南市 | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I refresh the website
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag:sample04061424_chart AND apache.geo.city:${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I choose the "济南市" from the "FilterDropdown"
    And I wait for "1000" millsecond
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dbinput4 @dbinput45
  Scenario: 修改下拉菜单为自动搜索 RZY-278
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项4"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项4"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    Then I click the "Ensure" button

  @dbinput4 @dbinput46
  Scenario: 验证下拉菜单为自动搜索 RZY-278
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项4"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项4"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag:sample04061424_chart AND (apache.geo.city:济南市) | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I refresh the website
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag:sample04061424_chart AND (apache.geo.city:${filter}) | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I choose the "济南市" from the "FilterDropdown"
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dbinput4 @dbinput47
  Scenario: 修改为多选并填入分割符 RZY-3428,RZY-3431
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项4"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项4"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I click the "MultiSelect" button
    And I set the parameter "Separate" with value "OR apache.geo.city:"
    And I wait for "Ensure" will be visible
    Then I click the "Ensure" button

  @dbinput4 @dbinput48
  Scenario: 验证多选生效 RZY-3428,RZY-3431
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项4"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项4"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I choose the "北京市,济南市,南京市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag:sample04061424_chart AND (apache.geo.city:北京市 OR apache.geo.city:济南市 OR apache.geo.city:南京市) | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I refresh the website
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dbinput4 @dbinput49
  Scenario: 增加前后缀值 RZY-3429
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项4"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项4"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I set the parameter "Prefix" with value "(apache.geo.city:"
    And I set the parameter "Suffix" with value ") AND tag : sample04061424_chart "
    Then I click the "Ensure" button

  @dbinput4 @dbinput410
  Scenario: 验证前后缀生效 RZY-3429
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项4"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项4"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "(apache.geo.city:北京市 OR apache.geo.city: 南京市) AND tag : sample04061424_chart | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I choose the "北京市,南京市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

#  @dbinput4 @dbinput411
#  Scenario: 修改通用配置搜索语句
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    And I wait for loading invisible
#    And I click the detail which name is "测试输入项5"
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "FilterName" button
#    And I click the "DeleteTag" button
#    And I click the "Ensure" button under some element

  @dbinput5 @dbinput51
  Scenario: 修改通用配置搜索语句
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项5"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项5"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page

    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "FilterAutoRefresh" button to "disable"

    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "${filter} apache.geo.city:成都市) AND tag : sample04061424_chart | stats count() by apache.geo.city"
    And I click the "Ensure" button under some element
    And I wait for "500" millsecond
    Then I will see the success message "配置成功"

  @dbinput5 @dbinput52
  Scenario: 增加标识值前后缀 RZY-3430
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项5"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项5"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I choose the "下拉菜单" from the "InputType"
    And I click the "MultiSelect" button
    And I set the parameter "ChoiceValue" with value "北京市"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "南京市"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "济南市"
    And I click the "AddChoiceValueButton" button
    And I choose the "北京市" from the "DefaultDropdownList"
    And I set the parameter "Prefix" with value "("
    And I set the parameter "PrefixValue" with value "apache.geo.city:"
    And I set the parameter "SuffixValue" with value " OR"
    And I set the parameter "Separate" with value ""
    And I let element "SuffixValue" lose focus
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  @dbinput5 @dbinput53
  Scenario: 验证标识符前后缀 RZY-3430
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项5"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项5"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page

#    And I wait for "Progress" will be invisible
    And I choose the "济南市,南京市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "(apache.geo.city:北京市 OR  apache.geo.city:南京市 OR  apache.geo.city:济南市 OR apache.geo.city:成都市) AND tag : sample04061424_chart | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

#  @dbinput5 @dbinput54
#  Scenario: 删除下拉菜单输入项
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    And I wait for loading invisible
#    And I click the detail which name is "测试输入项5"
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "FilterName" button
#    And I click the "DeleteTag" button
#    And I click the "Ensure" button under some element

  @dbinput6 @dbinput61
  Scenario: 验证下拉菜单默认输入项 RZY-280
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项6"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项6"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.status | where apache.status > ${filter}"
    And I click the "Ensure" button under some element
    And I wait for "1000" millsecond
    Then I will see the success message "配置成功"

  @dbinput6 @dbinput62
  Scenario: 添加动态菜单输入项 RZY-281,RZY-283,RZY-286
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项6"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项6"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I wait for loading invisible
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I choose the "动态菜单" from the "InputType"
    And I click the "SingleChoice" button
    And I set the parameter "DynamicField" with value "apache.status"
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.status "
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchFilterButton" button under some element
    And I wait for loading invisible
    And I choose the "404" from the "DefaultDropdownList"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  @dbinput6 @dbinput63
  Scenario: 验证动态菜单默认值结果 RZY-287
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项6"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项6"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.status | where apache.status > 404"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dbinput6 @dbinput64
  Scenario: 切换动态菜单值并验证结果 RZY-284
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项6"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项6"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page

    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "FilterAutoRefresh" button to "disable"

    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.status | where apache.status > ${filter}"
    And I click the "Ensure" button
#    And I wait for "Progress" will be invisible
    And I choose the "405" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.status | where apache.status > 405"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dbinput6 @dbinput65
  Scenario: 验证动态字段、搜索内容 RZY-284,RZY-285
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项6"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项6"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I wait for loading invisible
    And I set the parameter "DynamicField" with value ""
    And I wait for "500" millsecond
    And I click the "SearchFilterButton" button under some element
    And I wait for "500" millsecond
    Then I wait for "EmptyNotice" will be visible
    And I set the parameter "DynamicField" with value "hhhhhhhhhhhhh"
    And I wait for "500" millsecond
    And I click the "SearchFilterButton" button under some element
    And I wait for loading invisible
    Then I will see the error message "缺少选中的字段"
#    Then I wait for "LackField" will be visible
#    Then I click the "EnsureErrorSplButton" button
    And I wait for "2500" millsecond
    And I set the parameter "DynamicField" with value "avg_len"
#    And I click the "EnsureErrorSplButton" button
    And I set the parameter "Spl" with value "hello goodbey"
    And I wait for "500" millsecond
    And I click the "SearchFilterButton" button under some element
    And I wait for loading invisible
    Then I will see the error message "搜索语句须为stats类型"
#    Then I wait for "ErrorSpl" will be visible
#    And I click the "EnsureErrorSplButton" button
    And I wait for "1500" millsecond
    And I set the parameter "Spl" with value ""
    And I wait for "1500" millsecond
    Then I wait for "EmptyNotice" will be visible

  @dbinput6 @dbinput66
  Scenario: 增加动态菜单标识符前后缀 RZY-288
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项6"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项6"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I set the parameter "Prefix" with value "> "
    And I set the parameter "Suffix" with value "| "
    Then I click the "Ensure" button
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.status | where apache.status ${filter}limit 3"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I choose the "404" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.status | where apache.status > 404 | limit 3"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

#  @dbinput6 @dbinput67
#  Scenario: 增加动态菜单多选及标识值前后缀 RZY-288，RZY-3432
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    And I wait for loading invisible
#    And I click the detail which name is "测试输入项6"
#    Then I will see the "dashboard.DetailPage" page
#    And I move the mouse pointer to the "FilterName"
#    And I click the "FilterName" button
#    And I click the "DeleteTag" button
#    And I click the "Ensure" button under some element

  @dbinput7 @dbinput71
  Scenario: 增加动态菜单多选及标识值前后缀 RZY-288，RZY-3432
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项7"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项7"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I wait for loading invisible
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I choose the "动态菜单" from the "InputType"
    And I click the "MultiSelect" button
    And I set the parameter "DynamicField" with value "apache.geo.city"
    And I set the parameter "Spl" with value "apache.geo.city:* | stats count() by apache.geo.city"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchFilterButton" button under some element
    And I wait for loading invisible
    And I choose the "北京市" from the "DefaultDropdownList"
    And I set the parameter "PrefixValue" with value "apache.geo.city:"
    And I set the parameter "SuffixValue" with value " AND tag:sample*"
    And I set the parameter "Separate" with value "OR"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  @dbinput7 @dbinput72
  Scenario: 验证多选 RZY-3432
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项7"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项7"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page

    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "FilterAutoRefresh" button to "disable"

    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "1000" millsecond
    And I choose the "深圳市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.geo.city:北京市 AND tag:sample* OR apache.geo.city:深圳市 AND tag:sample* | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dbinput7 @dbinput73
  Scenario: 验证修改值自动搜索 RZY-282
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项7"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项7"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    Then I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I choose the "深圳市" from the "FilterDropdown"
    And I click the "FilterName" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dbinput7 @dbinput74
  Scenario: 输入值支持eval RZY-1834
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项7"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项7"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Edit" button
    And I wait for "1000" millsecond
    And I set the parameter "{"title": "仪表盘1669所用趋势图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "local","targets": [{"action": "eval","name": "filter","value": "${click.value2}+2000"}]}}" to json editor
    And I wait for "1000" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I move the mouse pointer to the "FilterName"
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I wait for "500" millsecond
    And I choose the "文本输入" from the "InputType"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible
    And I click the "NumberOf61" button
    Then I will see the element "FilterValue" value is "2061"

  @dbinput7 @dbinput75
  Scenario: 开启钻取配置(RZY-4479)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项7"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项7"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenDrilldown" button to "enable"
#    And I click the "OpenDrilldown" button
    And I wait for "500" millsecond

  @dbinput7 @dbinput76
  Scenario: 钻取配置中link类型为custom RZY-1836
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项7"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项7"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Edit" button
    And I wait for "1000" millsecond
    And I set the parameter "{  "title": "仪表盘1669所用趋势图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "table"  },  "drilldown": {    "type": "custom",    "blank": true,    "link": "http://service.exmail.qq.com/cgi-bin/help?subtype=1&no=${test1}&id=${test2}",    "eval": [      {        "name": "test1",        "value": "${click.value2}+991916"      },      {        "name": "test2",        "value": "${click.value2}+10711"      }    ]  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I click the "NumberOf61" button
    And I wait for "1000" millsecond
    And switch to another window
    And I close all tabs except main tab
    Then I will see the url contains "service.exmail.qq.com/cgi-bin/help?subtype=1&no=991977&id=10772"

  @dbinput7 @dbinput77
  Scenario: 钻取配置中link类型为search RZY-1837
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项7"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项7"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Edit" button
    And I wait for "1000" millsecond
    And I set the parameter "{  "title": "仪表盘1669所用趋势图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "table"  },  "drilldown": {    "type": "search",    "blank": true,    "mode": "custom",    "query": "*|stats count() by apache.status|top ${test} apache.status",    "timeRange": "-1w/w,now/w",    "eval": {      "name": "test",      "value": "${click.value2}-51"    }  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I click the "NumberOf61" button
    And I wait for "1000" millsecond
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "*|stats count() by apache.status|top 10 apache.status"
    And I wait for "2000" millsecond
#    Then I will see the input element "TimeRange" value will contains "上周"
    Then I will see the "TimeRange" result will be "上周"

  @dbinput7 @dbinput78
  Scenario: 钻取配置中link类型为dashboard RZY-1838
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项7"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项7"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Edit" button
    And I wait for "1000" millsecond
    And I set the parameter "{  "title": "仪表盘1669所用趋势图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "table"  },  "drilldown": {    "type": "dashboard",    "blank": true,    "link": "/dashboard/7/6/?filter=${test}",    "eval": {      "name": "test",      "value": "${click.value2}-55"    }  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I click the "NumberOf61" button
    And I wait for "1000" millsecond
    And switch to another window
    And I close all tabs except main tab
    Then I will see the url contains "/dashboard/7/6/?filter=6"
    Then I will see the element "FilterValue" value is "6"

  @dbinput7 @dbinput79
  Scenario Outline: 标题、标识校验（RZY-270,RZY-271）
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "测试输入项7"
    And I wait for "2000" millsecond
    And I click the detail which name is "测试输入项7"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "<title>"
    And I set the parameter "FilterToken" with value "apache.status"
    Then I wait for "ErrorContainPoin" will be visible
    And I set the parameter "FilterToken" with value "<token>"
    Then I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "添加输入项成功"

    Examples:
      | title                                   | token                                   |
      | @#¥%xiaoxiezimu汉字DAXIEZIMU（）*&……%¥¥%520 | @#¥%xiaoxiezimu汉字DAXIEZIMU（）*&……%¥¥%520 |
