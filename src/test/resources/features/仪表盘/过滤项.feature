Feature: 仪表盘过滤项

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name  |
      | 测试过滤项 |

  @dashboard @dashboardSmoke
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "过滤项"
    And I click the "Ensure" button

    Examples:
      | name  |
      | 测试过滤项 |

  @dashboard @dashboardSmoke
  Scenario: 添加事件操作
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddEvent" button
    And I set the parameter "EventName" with value "测试过滤项"
    And I set the parameter "Spl" with value "*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario Outline: 添加下拉菜单类型的过滤项（RZY-1869）
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddFilter" button
    And I set the parameter "FilterTitle" with value "<title>"
    And I set the parameter "FilterToken" with value "<token>"
    And I set the parameter "FilterField" with value "<field>"
    And I choose the "<inputType>" from the "InputType"
    And I set the parameter "ChoiceValue" with value "苏州市"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "<choiceValue>"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "成都市"
    And I click the "AddChoiceValueButton" button
    And I choose the "<choiceValue>" from the "DefaultDropdownList"
    And I "checked" the checkbox which name is "测试过滤项"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

    Examples:
      | title  | token  | field           | inputType | choiceValue |
      | filter | filter | apache.geo.city | 下拉菜单      | 南京市         |

  @dashboard @dashboardSmoke
  Scenario Outline: 验证下拉过滤项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    And I choose the "<city>" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
    Then I will see the element "CityTd" name is "<city> "

    Examples:
      | city |
      | 苏州市  |
      | 成都市  |

  @dashboard @dashboardSmoke
  Scenario: 修改为过滤项发生变化自动搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for loading invisible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    Then I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario Outline: 验证过滤项发生变化自动搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    And I choose the "<city>" from the "FilterDropdown"
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
    Then I will see the element "CityTd" name is "<city> "

    Examples:
      | city |
      | 苏州市  |
      | 成都市  |

  @dashboard @dashboardSmoke
  Scenario: 删除下拉过滤项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "FilterName" button
    And I click the "DeleteTag" button

  @dashboard @dashboardSmoke
  Scenario: 添加动态菜单
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddFilter" button
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I set the parameter "FilterField" with value "apache.geo.city"
    And I choose the "动态菜单" from the "InputType"
    And I set the parameter "DynamicField" with value "apache.geo.city"
    And I set the parameter "Spl" with value "* | stats count() by apache.geo.city"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "Search" button under some element
    And I wait for loading invisible
    And I choose the "成都市" from the "DefaultDropdownList"
    And I "checked" the checkbox which name is "测试过滤项"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  @dashboard @dashboardSmoke
  Scenario: 验证动态菜单绑定图表生效
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
    Then I will see the element "CityTd" name is "成都市 "

  @dashboard @dashboardSmoke
  Scenario Outline: 切换动态值
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    And I choose the "<city>" from the "FilterDropdown"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
    Then I will see the element "CityTd" name is "<city> "

    Examples:
      | city |
      | 纽约   |

  @dashboard @dashboardSmoke
  Scenario: 设置动态菜单自动搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for loading invisible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    Then I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario Outline: 验证动态菜单自动搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    And I choose the "<city>" from the "FilterDropdown"
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
    Then I will see the element "CityTd" name is "<city> "

    Examples:
      | city |
      | 苏州市  |

  @dashboard @dashboardSmoke
  Scenario: 删除动态菜单过滤项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "FilterName" button
    And I click the "DeleteTag" button

  @dashboard @dashboardSmoke
  Scenario: 添加文本过滤项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddFilter" button
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I set the parameter "FilterField" with value "apache.geo.city"
    And I set the parameter "FilterDefaultValue" with value "成都市"
    Then I "checked" the checkbox which name is "测试过滤项"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  @dashboard @dashboardSmoke
  Scenario: 验证文本过滤绑定成功
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
    Then I will see the element "CityTd" name is "成都市 "

  @dashboard @dashboardSmoke
  Scenario Outline: 验证修改文本值搜索内容是否正确
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for loading invisible
    And I wait for "FilterInput" will be visible
    And I set the parameter "FilterInput" with value "<city>"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
    Then I will see the element "CityTd" name is "<city> "

    Examples:
      | city |
      | 苏州市  |

  @dashboard @dashboardSmoke
  Scenario: 修改文本过滤为自动搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    And I wait for loading invisible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    Then I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario Outline: 验证文本过滤自动搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    And I set the parameter "FilterInput" with value "<city>"
    And I let element "FilterInput" lose focus
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
    Then I will see the element "CityTd" name is "<city> "

    Examples:
      | city |
      | 苏州市  |

  @dashboard @dashboardSmoke
  Scenario: 添加eval过滤项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    And I click the "FilterName" button
    And I click the "DeleteTag" button
    When I click the "AddEventButton" button
    And I click the "AddFilter" button
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I set the parameter "FilterField" with value "apache.status"
    Then I "checked" the checkbox which name is "测试过滤项"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  @dashboard @dashboardSmoke
  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
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
      | name      | spl                                 |
      | 测试仪表盘eval | *\|stats count() by 'apache.status' |

  @dashboard @dashboardSmoke
  Scenario: 删除趋势图
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "测试过滤项" then I click the button which classname is "anticon css-ifnfqv" in dashboard
    And I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "测试仪表盘eval"
    And I wait for loading invisible
    And I click the "{'Checkbox':'测试仪表盘eval'}" button
    And I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario: 验证eval(undone)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "测试仪表盘eval" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "测试仪表盘eval","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "*|stats count() by 'apache.status'","startTime": "-1d/d","endTime": "now/d"},"chart": {"chartType": "table"},"drilldown": {"type": "local","targets": [{"action": "eval","name": "target2","value": "${click.value2}-9101"}]}}" to json editor
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name      |
      | 测试仪表盘eval |

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name  |
      | 测试过滤项 |