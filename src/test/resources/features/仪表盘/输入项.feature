@yibiaopanshuruxiang
Feature: 仪表盘输入项

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name  |
      | 测试输入项 |

  @dashboard @dashboardSmoke
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "过滤项"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete

    Examples:
      | name  |
      | 测试输入项 |

  @dashboard @dashboardSmoke
  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I wait for "Today" will be visible
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | name         | spl                                                                                       |
      | 仪表盘所用趋势图     | *\|stats count() by 'apache.geo.city'                                                     |
      | 仪表盘1669所用趋势图 | (appname:\"aa\") \|bucket timestamp span=6h as ts \|stats count(\'tag\') as \'tag\' by ts |

  @dashboard @dashboardSmoke
  Scenario Outline: RZY-1668添加输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "<filter>"
    And I set the parameter "FilterToken" with value "<filter>"
    And I set the parameter "FilterDefaultValue" with value "<defaultValue>"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

    Examples:
      | filter | defaultValue    |
      | filter | apache.geo.city |

  @dashboard @dashboardSmoke
  Scenario: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "仪表盘所用趋势图"
    And I wait for loading invisible
    And I "checked" the checkbox which name is "仪表盘所用趋势图"
    And I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario: 验证输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I set value with element "TableList"
    When the chart title is "仪表盘所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "* | stats count() by ${filter|s}"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dashboard @dashboardSmoke
  Scenario: 删除图表单引号包裹
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "DeleteChart" button
    And I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario: 删除单引号输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "FilterName" button
    And I click the "DeleteTag" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button under some element
    Then I wait for "FilterName" will be invisible

  @dashboard @dashboardSmoke
  Scenario: 添加时间范围输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试输入项"
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

  @dashboard @dashboardSmoke
  Scenario: 验证默认值添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I will see the element "DateEditor" value is "今天"
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "仪表盘所用趋势图"
    And I wait for loading invisible
    And I click the "{'Checkbox':'仪表盘所用趋势图'}" button
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

  @dashboard @dashboardSmoke
  Scenario: 验证时间范围输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I set value with element "TableList"
    When the chart title is "仪表盘所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "starttime=${time.start} endtime=${time.end} * | stats count() by 'apache.geo.city' "
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dashboard @dashboardSmoke
  Scenario: 验证时间范围标识前后缀
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I set value with element "TableList"
    And I click the "FilterTime" button
    And I click the "EditTime" button
    And I wait for "Prefix" will be visible
    And I set the parameter "Prefix" with value "="
    And I wait for "1000" millsecond
    And I click the "Ensure" button
    Then I wait for "FilterTime" will be visible
#    And I click the "DeleteTime" button
    When the chart title is "仪表盘所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "starttime${time.start} endtime${time.end} * | stats count() by 'apache.geo.city' "
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dashboard @dashboardSmoke
  Scenario: 删除图表单和输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "DeleteChart" button
    And I click the "Ensure" button
    And I click the "FilterTime" button
    And I click the "DeleteTime" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button under some element
    Then I wait for "FilterTime" will be invisible

  @dashboard @dashboardSmoke
  Scenario Outline: RZY-1669添加输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
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

  @dashboard @dashboardSmoke
  Scenario: RZY-1669:添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "仪表盘1669所用趋势图"
    And I wait for loading invisible
    And I click the "{'Checkbox':'仪表盘1669所用趋势图'}" button
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

  @dashboard @dashboardSmoke
  Scenario: 验证RZY-1669
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "(appname:${filter|d}) |bucket timestamp span=6h as ts |stats count('tag') as 'tag' by ts"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dashboard @dashboardSmoke
  Scenario: 删除双引号输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "FilterName" button
    And I click the "DeleteTag" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button under some element
    Then I wait for "FilterName" will be invisible

  @dashboard @dashboardSmoke
  Scenario: 增加标识前后缀
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
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

  @dashboard @dashboardSmoke
  Scenario: 验证标识前后缀
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "* | stats count() by apache.geo.city |limit 5"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "* | stats count() ${filter}"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dashboard @dashboardSmoke
  Scenario: 修改标识值
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "FilterInput" will be visible
    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "FilterAutoRefresh" button to "disable"
    And I set the parameter "FilterInput" with value "appname"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    Then I wait for "Appname" will be visible

  @dashboard @dashboardSmoke
  Scenario: 修改为自动搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    Then I click the "Ensure" button
    Then I wait for "FilterInput" will be visible
    And I set the parameter "FilterInput" with value "appname"
    And I let element "FilterInput" lose focus
    And I wait for "Progress" will be invisible
    Then I wait for "Appname" will be visible

  @dashboard @dashboardSmoke
  Scenario: 删除文本输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "FilterName" button
    And I click the "DeleteTag" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button under some element
    Then I wait for "FilterName" will be invisible

  @dashboard @dashboardSmoke
  Scenario: 修改图表搜索语句
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.geo.city:${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "配置成功"

  @dashboard @dashboardSmoke
  Scenario: 添加下拉菜单输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
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

  @dashboard @dashboardSmoke
  Scenario: 验证下拉菜单默认输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.geo.city:北京市 | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dashboard @dashboardSmoke
  Scenario: 验证下拉菜单搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.geo.city:济南市 | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I refresh the website
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.geo.city:${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I choose the "济南市" from the "FilterDropdown"
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dashboard @dashboardSmoke
  Scenario: 修改下拉菜单为自动搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    Then I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario: 验证下拉菜单为自动搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.geo.city:济南市 | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I refresh the website
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.geo.city:${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I choose the "济南市" from the "FilterDropdown"
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dashboard @dashboardSmoke
  Scenario: 修改为多选并填入分割符
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I click the "MultiSelect" button
    And I set the parameter "Separate" with value "OR apache.geo.city:"
    And I wait for "Ensure" will be visible
    Then I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario: 验证多选生效
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I choose the "北京市,济南市,南京市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.geo.city:北京市 OR apache.geo.city:济南市 OR apache.geo.city:南京市 | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I refresh the website
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dashboard @dashboardSmoke
  Scenario: 增加前后缀值
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I set the parameter "Prefix" with value "appname:* AND apache.geo.city:"
    And I set the parameter "Suffix" with value " AND tag:* "
    Then I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario: 验证前后缀生效
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "appname:* AND apache.geo.city:北京市 OR apache.geo.city: 南京市 AND tag:* | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I choose the "北京市,南京市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dashboard @dashboardSmoke
  Scenario: 修改通用配置搜索语句
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "FilterName" button
    And I click the "DeleteTag" button
    And I click the "Ensure" button under some element
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "${filter} apache.geo.city:成都市 | stats count() by apache.geo.city"
    And I click the "Ensure" button under some element
    And I wait for "500" millsecond
    Then I will see the success message "配置成功"

  @dashboard @dashboardSmoke
  Scenario: 增加标识值前后缀
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
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
    And I set the parameter "PrefixValue" with value "apache.geo.city:"
    And I set the parameter "SuffixValue" with value " OR"
    And I set the parameter "Separate" with value ""
    And I let element "SuffixValue" lose focus
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  @dashboard @dashboardSmoke
  Scenario: 验证标识符前后缀
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I choose the "济南市,南京市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.geo.city:北京市 OR apache.geo.city:济南市 OR apache.geo.city:南京市 OR apache.geo.city:成都市 | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dashboard @dashboardSmoke
  Scenario: 删除下拉菜单输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "FilterName" button
    And I click the "DeleteTag" button
    And I click the "Ensure" button under some element
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.resp_len:>${filter}| table apache.resp_len"
    And I click the "Ensure" button under some element
    And I wait for "1000" millsecond
    Then I will see the success message "配置成功"

  @dashboard @dashboardSmoke
  Scenario: 添加动态菜单输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I wait for loading invisible
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I choose the "动态菜单" from the "InputType"
    And I click the "SingleChoice" button
    And I set the parameter "DynamicField" with value "avg_len"
    And I set the parameter "Spl" with value "* | stats avg(apache.resp_len) as avg_len by apache.clientip"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "Search" button under some element
    And I wait for loading invisible
    And I choose the "1441" from the "DefaultDropdownList"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  @dashboard @dashboardSmoke
  Scenario: 验证动态菜单默认值结果
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.resp_len:>1441| table apache.resp_len"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dashboard @dashboardSmoke
  Scenario: 切换动态菜单值并验证结果
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.resp_len:>${filter}| table apache.resp_len"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I choose the "5049" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.resp_len:>5049 | table apache.resp_len"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dashboard @dashboardSmoke
  Scenario: 增加动态菜单标识符前后缀
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I set the parameter "Prefix" with value "apache.resp_len:>"
    And I set the parameter "Suffix" with value "| "
    Then I click the "Ensure" button
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "${filter}table apache.resp_len"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.resp_len:>1441| table apache.resp_len"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dashboard @dashboardSmoke
  Scenario: 增加动态菜单多选及标识值前后缀
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "FilterName" button
    And I click the "DeleteTag" button
    And I click the "Ensure" button under some element
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
    And I click the "Search" button under some element
    And I wait for loading invisible
    And I choose the "北京市" from the "DefaultDropdownList"
    And I set the parameter "PrefixValue" with value "apache.geo.city:"
    And I set the parameter "SuffixValue" with value " AND tag:sample*"
    And I set the parameter "Separate" with value "OR"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  @dashboard @dashboardSmoke
  Scenario: 验证多选
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I choose the "深圳市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "apache.geo.city:北京市 AND tag:sample* OR apache.geo.city:深圳市 AND tag:sample* | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"

  @dashboard @dashboardSmoke
  Scenario: 验证修改值自动搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    Then I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘1669所用趋势图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "${filter} | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I choose the "深圳市" from the "FilterDropdown"
    And I click the "FilterName" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"


#
#  @dashboard @dashboardSmoke
#  Scenario: RZY-1834:输入值支持eval（未完成·）
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    And I click the detail which name is "测试输入项"
#    Then I will see the "dashboard.DetailPage" page
#    When the chart title is "仪表盘高级编辑" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
#    And I click the "Edit" button
#    And I set the parameter "{"title": "仪表盘1669所用趋势图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "*|stats count() by appname","startTime": "now/d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "local","targets": [{"action": "eval","name": "filter","value": "${click.value2}+2000"}]}}" to json editor
#    And I click the "Check" button
#    Then I will see the success message "校验通过"
#    And I click the "Ensure" button
#    And I wait for "Progress" will be invisible

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name         |
      | 仪表盘1669所用趋势图 |
      | 仪表盘所用趋势图     |

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name  |
      | 测试输入项 |