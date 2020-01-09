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

  Scenario Outline: RZY-1668、1669添加输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加输入项" from the "EventList"
    And I set the parameter "FilterTitle" with value "<filter>"
    And I set the parameter "FilterToken" with value "<filter>"
    And I set the parameter "FilterDefaultValue" with value "<defaultValue>"
    Then I click the "EnsureCreateInput" button

    Examples:
      | filter           | defaultValue |
      | input            | appname      |
      | double_quotation | aa           |

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
      | 仪表盘所用趋势图     | *\|stats count() by 'appname'                                                             |
      | 仪表盘1669所用趋势图 | (appname:\"aa\") \|bucket timestamp span=6h as ts \|stats count(\'tag\') as \'tag\' by ts |

  Scenario: 验证RZY-1668:单引号包裹
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试过滤项"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加图表" from the "EventList"
    And I check "仪表盘所用趋势图" from the "CheckBox"
    And I click the "EnsureAddTrend" button
    And I wait for "ChartSetting" will be visible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value "* | stats count() by ${input|s}"
    And I click the "SettingEnsure" button
    Then I compare with list "TableList"
    And I click the "DeleteChart" button
    And I click the "EnsureDeleteChart" button

  Scenario: 验证RZY-1669:双引号包裹
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试过滤项"
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
    And I set the parameter "Spl" with value "(appname:${double_quotation|d})  |bucket timestamp span=6h as ts |stats count('tag') as 'tag' by ts"
    And I click the "SettingEnsure" button
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