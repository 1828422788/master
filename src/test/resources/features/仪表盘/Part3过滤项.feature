@dashboard0330 @dashboard35 @dashboardpart3
Feature: 仪表盘过滤项

  @dashboardpart3Smoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name  |
      | 测试过滤项 |

  @dashboardpart3Smoke
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "过滤项"
    And I click the "Ensure" button
    And I wait for loading complete
    And I back to before

    Examples:
      | name  |
      | 测试过滤项 |

  @dashboardpart3Smoke
  Scenario: 添加事件操作
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddEvent" button
    And I set the parameter "EventName" with value "测试过滤项"
    And I set the parameter "Spl" with value "*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "Ensure" button

  @dashboardpart3Smoke
  Scenario Outline: 添加下拉菜单类型的过滤项（RZY-253,RZY-1869,RZY-266）
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddFilter" button
    And I set the parameter "FilterTitle" with value "<title>"
    And I set the parameter "FilterToken" with value "<token>"
    And I set the parameter "FilterField" with value "<field>"
    And I choose the "<inputType>" from the "InputType"
    And I wait for "1000" millsecond
    And I set the parameter "ChoiceValue" with value "苏州市"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "<choiceValue>"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "成都市"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "测试市"
    And I click the "AddChoiceValueButton" button
    And I choose the "<choiceValue>" from the "DefaultDropdownList"
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "测试过滤项"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

    Examples:
      | title  | token  | field           | inputType | choiceValue |
      | filter | filter | apache.geo.city | 下拉菜单      | 南京市         |

  @dashboardpart3Smoke
  Scenario Outline: 验证下拉过滤项(RZY-226，RZY-254)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "FilterAutoRefresh" button to "disable"
    And I choose the "<city>" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
#    Then I will see the element "CityTd" name is "<city> "
    Then I will see the "CityTd" result will be "<city>"

    Examples:
      | city |
      | 苏州市  |
      | 成都市  |

  @dashboardpart3Smoke
  Scenario Outline: 验证下拉过滤字段校验(RZY-254)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "FilterAutoRefresh" button to "disable"
    And I wait for "1000" millsecond
    And I click the "TrendTitle" button
    And I wait for "500" millsecond
    And I choose the "<cityNo>" from the "FilterDropdown"
#    And I click the "Nanjingshi" button
#    And I set the parameter "FilterDropDown1" with value "<cityNo>"
#    And I click the "Ceshishi" button
    And I wait for "2000" millsecond
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    Then I wait for "NoData" will be visible

    Examples:
      | cityNo |
      | 测试市  |

  @dashboardpart3Smoke
  Scenario: 修改为过滤项发生变化自动搜索(RZY-255,RZY-256,RZY-257)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for loading invisible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    Then I click the "Ensure" button

  Scenario Outline: 验证过滤项发生变化自动搜索(RZY-255,RZY-256,RZY-257)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "FilterDropdown" will be visible
    And I wait for "1000" millsecond
    And I choose the "<city>" from the "FilterDropdown"
    And I wait for "1000" millsecond
#    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
#    Then I will see the element "CityTd" name is "<city> "
    Then I will see the "CityTd" result will be "<city>"

    Examples:
      | city |
      | 苏州市  |
      | 成都市  |

  Scenario: 修改并验证下拉过滤项为多选 RZY-3415
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for loading invisible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I click the "MultiSelect" button
    Then I click the "Ensure" button
    And I choose the "苏州市,成都市" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    Then I will see the "NoData" doesn't exist

  Scenario: 删除下拉过滤项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "FilterName" button
    And I click the "DeleteTag" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button under some element

  Scenario: 添加动态菜单(RZY-258,RZY-263,RZY-264)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddFilter" button
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I set the parameter "FilterField" with value "apache.geo.city"
    And I choose the "动态菜单" from the "InputType"
    And I wait for "1000" millsecond
    And I set the parameter "DynamicField" with value "apache.geo.city"
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.geo.city"
    And I wait for "1000" millsecond
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchFilterButton" button under some element
    And I wait for loading invisible
    And I choose the "成都市" from the "DefaultDropdownList"
    And I wait for "1000" millsecond
    And I set the parameter "ChoiceValue" with value "测试市"
    And I click the "AddChoiceValueButton" button
    And I "checked" the checkbox which name is "测试过滤项"
#    And I wait for "500" millsecond
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  Scenario: 验证动态菜单绑定图表生效
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
#    Then I will see the element "CityTd" name is "成都市 "
    Then I will see the "CityTd" result will be "成都市"

  Scenario Outline: 验证动态过滤字段校验(RZY-259)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "FilterAutoRefresh" button to "disable"
    And I set the parameter "FilterDropdownInput" with value "<cityNo>"
    And I click the Element with text "<cityNo>"
    And I wait for "2000" millsecond
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    Then I wait for "NoData" will be visible

    Examples:
      | cityNo |
      | 测试市  |

  Scenario Outline: 切换动态值(RZY-259)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "FilterDropdown" will be visible
    And I choose the "<city>" from the "FilterDropdown"
    And I wait for "1000" millsecond
    And I click the "Update" button
#    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
#    Then I will see the element "CityTd" name is "<city> "
    Then I will see the "CityTd" result will be "<city>"


    Examples:
      | city |
      | 纽约   |

  Scenario: 验证动态字段、搜索内容 RZY-261,RZY-262
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for loading invisible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
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
    And I wait for "2500" millsecond
    And I set the parameter "DynamicField" with value "apache.geo.city"
    And I set the parameter "Spl" with value "hello goodbey"
    And I wait for "500" millsecond
    And I click the "SearchFilterButton" button under some element
    And I wait for loading invisible
    Then I will see the error message "搜索语句须为stats类型"

  Scenario: 设置动态菜单自动搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for loading invisible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    And I wait for "500" millsecond
    Then I click the "Ensure" button

  Scenario Outline: 验证动态菜单自动搜索(RZY-266)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    And I set the parameter "FilterDropdownInput" with value "<city>"
    And I click the Element with text "<city>"
    And I wait for "1000" millsecond
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
#    Then I will see the element "CityTd" name is "<city> "
    Then I will see the "CityTd" result will be "<city>"

    Examples:
      | city |
      | 苏州市  |

  Scenario: 修改并验证动态过滤项为多选 RZY-3416
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for loading invisible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I wait for "1000" millsecond
    And I click the "MultiSelect" button
    And I wait for "1000" millsecond
    And I choose the "南京市" from the "DefaultDropdownList"
    And I wait for "1000" millsecond
    Then I click the "Ensure" button
    And I wait for "1500" millsecond
    And I choose the "成都市" from the "FilterDropdown"
    And I wait for "1000" millsecond
#    And I click the "Update" button
    And I wait for "Progress" will be invisible
    Then I will see the "NoData" doesn't exist

  Scenario: 删除动态菜单过滤项(RZY-3419)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "FilterName" button
    And I click the "DeleteTag" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button under some element

  Scenario: 添加文本过滤项(RZY-248)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddFilter" button
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I set the parameter "FilterField" with value "apache.geo.city"
    And I wait for "1000" millsecond
    And I set the parameter "FilterDefaultValue" with value "成都市"
    And I wait for "1500" millsecond
    Then I "checked" the checkbox which name is "测试过滤项"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  Scenario: 验证文本过滤绑定成功(RZY-3611)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
#    Then I will see the element "CityTd" name is "成都市 "
    Then I will see the "CityTd" result will be "成都市"

  Scenario Outline: 验证修改文本值搜索内容是否正确(RZY-252)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for loading invisible
    And I wait for "FilterInput" will be visible
    And I set the parameter "FilterInput" with value "<city>"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
#    Then I will see the element "CityTd" name is "<city> "
    Then I will see the "CityTd" result will be "<city>"
    And I wait for "1000" millsecond
    And I set the parameter "FilterInput" with value "<cityNo>"
    And I click the "Update" button
    And I wait for "3000" millsecond
    Then I wait for "NoData" will be visible

    Examples:
      | city  | cityNo |
      | 苏州市 | 测试市  |


  Scenario: 修改文本过滤为自动搜索(RZY-251)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for loading invisible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    Then I click the "Ensure" button

  Scenario Outline: 验证文本过滤自动搜索(RZY-251)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I set the parameter "FilterInput" with value "<city>"
    And I let element "FilterInput" lose focus
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
#    Then I will see the element "CityTd" name is "<city> "
    Then I will see the "CityTd" result will be "<city>"

    Examples:
      | city |
      | 苏州市  |

  Scenario: 添加eval过滤项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "FilterName" button
    And I click the "DeleteTag" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button under some element
    When I click the "AddEventButton" button
    And I click the "AddFilter" button
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I set the parameter "FilterField" with value "apache.status"
    Then I "checked" the checkbox which name is "测试过滤项"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
#    And I click the "Create" button
    Then I will see the "trend.CreatePageDash" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
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
      | name      | spl                                 |
      | 测试仪表盘eval | appname:apache\|stats count() by 'apache.status' |
      | 仪表盘过滤项所用趋势图| tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 \| stats count() by apache.geo.city |


  Scenario: 删除趋势图
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "测试过滤项" then I click the button which classname is "yotta-icon yotta-icon-Delete" in dashboard
    And I click the "Ensure" button


  Scenario: 验证绑定图表默认 RZY-265
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for loading invisible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    Then I will see the "ListForBang" doesn't exist
#    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    Then I click the "Ensure" button


  Scenario: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "测试仪表盘eval"
    And I wait for loading invisible
    And I click the "{'Checkbox':'测试仪表盘eval'}" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"
    And I wait for loading invisible
    And I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "仪表盘过滤项所用趋势图"
    And I wait for loading invisible
    And I click the "{'Checkbox':'仪表盘过滤项所用趋势图'}" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"


  Scenario: 验证绑定图表默认 RZY-265,RZY-267
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for loading invisible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    Then I wait for "ListForBang" will be visible
    And I "checked" the checkbox which name is "测试仪表盘eval"
    And I "checked" the checkbox which name is "仪表盘过滤项所用趋势图"
    Then I click the "Ensure" button
    And I wait for loading invisible


  Scenario: 验证eval RZY-1835
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "测试仪表盘eval" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "测试仪表盘eval","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "appname:apache|stats count() by 'apache.status'","startTime": "now/d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "local","targets": [{"action": "eval","name": "filter","value": "${click.value2}-204"}]}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I wait for "FilterName" will be visible
    And I click the "NumberOf404" button
    Then I will see the element "FilterValue" value is "200"


  Scenario Outline: 标题、标识校验（RZY-249,RZY-250）
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddFilter" button
    And I set the parameter "FilterTitle" with value "<title>"
    And I set the parameter "FilterToken" with value "<token>"
    And I set the parameter "FilterField" with value "<field>"
    Then I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "添加过滤项成功"

    Examples:
      | title  | token  | field           |
      | @#¥%xiaoxiezimu汉字DAXIEZIMU（）*&……%¥¥%520 | @#¥%xiaoxiezimu汉字DAXIEZIMU（）*&……%¥¥%520 | apache.geo.city |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name      |
      | 测试仪表盘eval |

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name  |
      | 测试过滤项 |