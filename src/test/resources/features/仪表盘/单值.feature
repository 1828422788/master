Feature: 仪表盘单值

  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name  |
      | 仪表盘单值 |

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
      | spl                                                                                                | name  |
      | tag:*display \| stats avg(apache.status) as a_\|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\") | 仪表盘单值 |

  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<name>"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete

    Examples:
      | name |
      | 单值   |

  Scenario: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I choose the "添加图表" from the "EventList"
    And I "checked" the checkbox which name is "仪表盘单值"
    And I click the "Ensure" button

  Scenario: 修改为单值
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I click the "ChartType" button
    Then I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Single" button
    And I hide the element "Content"
    And I click the "Setting" button under some element
    And I choose the "a_" from the "DataField"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I click the "TrendTitle" button

  Scenario Outline: 验证单值图的fontSize
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘单值","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")","startTime": "now/d","endTime": "now"},"chart": {"chartType": "single","field": "a_","fontSize": "<fontSize>","singleChartIcon": "none","displayMode": "default","color": "#5C9DF5","colorFillingMode": "font","liveRefreshMode": false}}" to json editor
    And I click the "Check" button
    Then I wait for element "<status>" change text to "<message>"

    Examples:
      | fontSize | status         | message                                       |
      | 0        | ErrorMessage   | chart -> fontSize -> 展示字体值的有效范围为 14 ～ 1000 px |
      | 13       | ErrorMessage   | chart -> fontSize -> 展示字体值的有效范围为 14 ～ 1000 px |
      | 1001     | ErrorMessage   | chart -> fontSize -> 展示字体值的有效范围为 14 ～ 1000 px |
      | 1000     | SuccessMessage | 校验通过                                          |
      | 14       | SuccessMessage | 校验通过                                          |

  Scenario Outline: 验证单值图的color
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘单值","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")","startTime": "now/d","endTime": "now"},"chart": {"chartType": "single","field": "a_","fontSize": "100","singleChartIcon": "none","displayMode": "default","color": "<color>","colorFillingMode": "font","liveRefreshMode": false}}" to json editor
    And I click the "Check" button
    Then I wait for element "<status>" change text to "<message>"

    Examples:
      | color | status         | message               |
      |       | ErrorMessage   | chart -> color字段值不能为空 |
      | 1     | SuccessMessage | 校验通过                  |

  Scenario Outline: 验证单值图的展示字段
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘单值","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")","startTime": "now/d","endTime": "now"},"chart": {"chartType": "single","field": "a_","fontSize": "100","singleChartIcon": "none","displayMode": "trending","color": "#5C9DF5","colorFillingMode": "font","liveRefreshMode": false}}" to json editor
    And I click the "Check" button
    Then I wait for element "<status>" change text to "<message>"

    Examples:
      | status       | message                       |
      | ErrorMessage | chart -> comparsionTime字段为必填项 |

  Scenario Outline: 单值图按趋势展示
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘单值","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")","startTime": "now/d","endTime": "now"},"chart": {"chartType": "single","field": "a_","fontSize": "24","singleChartIcon": "none","displayMode": "default","comparsionTime": "-7d","comparsionMode": "percent","color": "#5C9DF5","colorFillingMode": "font","liveRefreshMode": false}}" to json editor
    And I click the "Check" button
    Then I will see the error message "<message>"

    Examples:
      | message                              |
      | chart -> useThousandSeparators字段为必填项 |

  Scenario Outline: 单值图按区间展示
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘单值","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")","startTime": "now/d","endTime": "now"},"chart": {"chartType": "single","field": "a_","fontSize": "24","precision": "1","useThousandSeparators": false,"unit": "ge","unitPosition": "after","displayField": "chart","singleChartIcon": "fixed","fixedSetting": "","displayMode": "<mode>","colorFillingMode": "font","colorRanges": [{"from":"100","to":"<to>","color":"#259B24"}]}}" to json editor
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "<message>"

    Examples:
      | mode    | to  | message                                  |
      | default | 300 | chart -> color字段为必填项                     |
      | ranging | 1   | chart -> colorRanges -> 颜色范围区间结束值需要大于开始值 |

    ###########
  Scenario: 添加图表并验证单值结果是否正确
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "SingleChartFieldA" will be visible
    And I set value with element "SingleChartFieldA"
    And I wait for "FadingLeave" will be invisible
    And I click the "Type" button
    And I click the "Single" button
    And I wait for "SingleChartStatic" will be visible
    And I hide the element "SelectionPopover"
    And I click the "Setting" button
    And I choose the "a_" from the "FieldValue"
    And I click the "Generate" button
    And I hide the element "Content"
    And I click the "MainTitle" button
    And I wait for "Progress" will be invisible
    Then I compare with list "SingleChartStatic"

  Scenario: 单值背景色
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Setting" will be visible
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "Range" button
    And I click the "AddColourRange" button
    And I set the parameter "StartColour" with value "10"
    And I set the parameter "EndColour" with value "300"
    And I click the "ColorTrigger" button
    And I click the "Green" button
    And I click the "Background" button
    And I click the "Generate" button
    And I click the "MainTitle" button
    Then I will see the element "BackgroundColour" style contains "rgb(37, 155, 36)"

  Scenario: 单值字体色
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "Setting" will be visible
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "Text" button
    And I click the "Generate" button
    And I click the "MainTitle" button
    Then I will see the element "ChartContainer" style contains "rgb(37, 155, 36)"

  Scenario: 恢复至初始
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartSetting" button
    And I click the "Recover" button
    And I click the "SettingEnsure" button
    And I wait for "Progress" will be invisible
    Then I wait for "Table" will be visible

  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name  |
      | 仪表盘单值 |

  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name  |
      | 仪表盘单值 |
