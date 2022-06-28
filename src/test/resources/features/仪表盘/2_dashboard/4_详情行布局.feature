@dashboard @dashboardLayout
Feature: 仪表盘04详情行布局

  Scenario Outline: 新建趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePageDash" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I wait for "Today" will be visible
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for loading invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "Complete" button
    And I will see the element "ResultMessage" contains "新建成功"

    @dashboardSmoke
    Examples:
      | name    | spl                                                                                           |
      | 行布局趋势图1 | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len \| limit 10    |
      | 行布局趋势图2 | tag:sample04061424 \| stats count() by apache.geo.country,apache.geo.province,apache.geo.city |

    Examples:
      | name    | spl                                                                                           |
      | 行布局趋势图3 | tag:sample04061424_chart \|stats count() by 'apache.geo.city'                                 |

  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name     |
      | 仪表盘行布局1 |
      | 仪表盘行布局2 |
      | 仪表盘行布局3 |
      | 仪表盘行布局4 |
      | 仪表盘行布局5 |
      | 仪表盘行布局6 |
      | 仪表盘行布局7 |
      | 仪表盘行布局51 |
      | 仪表盘行布局52 |
      | 仪表盘行布局53 |

    @dashboardSmoke
    Examples:
      | name     |
      | 仪表盘行布局 |

  Scenario Outline: 新建一个行布局标签页(RZY-4628)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<dashboardName>"
    And I wait for loading invisible
    When I click the detail which name is "<dashboardName>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I set the parameter "TagName" with value "rowLayout"
    And I click the "RowLayout" button
    And I click the "Ensure" button
    Then I wait for "SettingIcon" will be visible

    @dashboardSmoke
    Examples:
      | dashboardName |
      | 仪表盘行布局 |

    Examples:
      | dashboardName |
      | 仪表盘行布局1 |
      | 仪表盘行布局2 |
      | 仪表盘行布局3 |
      | 仪表盘行布局4 |
      | 仪表盘行布局5 |
      | 仪表盘行布局6 |
      | 仪表盘行布局7 |
      | 仪表盘行布局51      |
      | 仪表盘行布局52      |
      | 仪表盘行布局53      |

  @dashboardSmoke
  Scenario: 添加行(RZY-4629，RZY-3607)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加行" from the "AddItemMenu"
    And I wait for loading invisible
    And I set the parameter "NewRowName" with value "第一行"
    And I click the "{'Checkbox':'行布局趋势图1'}" button
    And I click the "{'Checkbox':'行布局趋势图2'}" button
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "添加成功"
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加行" from the "AddItemMenu"
    And I wait for loading invisible
    And I click the "{'Checkbox':'行布局趋势图1'}" button
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "添加成功"

  @dashboardSmoke
  Scenario: 编辑行(RZY-4630)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I move the mouse pointer to the "EditRowIcon"
    And I click the "EditRowIcon" button
    And I set the parameter "EditRowName" with value "首行"
    And I click the "Ensure" button
    Then I wait for "FirstRow" will be visible

  @dashboardSmoke
  Scenario: 行布局添加图表(RZY-4631)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加图表" from the "AddItemMenu"
    And I choose the "L1: 首行,L2:" from the "RowMenu"
    And I click the "Ensure" button
    Then I will see the error message "请至少选择一个趋势图"
    And I set the parameter "SearchChartInput" with value "行布局"
    And I wait for loading invisible
    And I click the "{'Checkbox':'行布局趋势图2'}" button
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "添加成功"

  @dashboardSmoke
  Scenario: 行布局添加全局输入项(RZY-4632)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加输入项" from the "AddItemMenu"
    And I wait for loading invisible
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I set the parameter "FilterDefaultValue" with value "apache.geo.city"
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加输入项成功"

  @dashboardSmoke
  Scenario: 行布局添加行内输入项(RZY-4633)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加输入项" from the "AddItemMenu"
    And I wait for loading invisible
    And I set the parameter "FilterTitle" with value "innerFilter"
    And I set the parameter "FilterToken" with value "innerFilter"
    And I choose the "L1: 首行" from the "RowMenu"
    And I click the "Ensure" button
    Then I wait for "InnerInputFilter" will be visible

  @dashboardSmoke
  Scenario: 行布局添加事件列表(RZY-4634)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加事件列表" from the "AddItemMenu"
    And I set the parameter "EventName" with value "测试行事件"
    And I alter the input element "Spl" value to "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "Ensure" button
    Then I will see the error message "请选择要加入的行"
    And I choose the "L1: 首行" from the "RowMenu"
    And I click the "Ensure" button
    Then I wait for "RowEventName" will be visible

  @dashboardSmoke
  Scenario: 删除行(RZY-4635)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I move the mouse pointer to the "DeleteRowIcon"
    And I click the "DeleteRowIcon" button
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "删除行成功"

  @dashboardSmoke
  Scenario: 删除行内图表(RZY-4636)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I click the "DeleteTrend1" button
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "删除成功"
    Then I will see the "TrendOne" is not exist

  @dashboardSmoke
  Scenario: 展示条件-文本输入项预置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I move the mouse pointer to the "DeleteNoNameRowIcon"
    And I click the "DeleteNoNameRowIcon" button
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "删除行成功"

  Scenario Outline: 展示条件-文本输入项预置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<dashboardName>"
    And I wait for loading invisible
    When I click the detail which name is "<dashboardName>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加行" from the "AddItemMenu"
    And I set the parameter "NewRowName" with value "行布局"
    And I wait for loading invisible
    And I click the "{'Checkbox':'行布局趋势图2'}" button
    And I click the "{'Checkbox':'行布局趋势图3'}" button
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "添加行成功"

    Examples:
      | dashboardName |
      | 仪表盘行布局1 |
      | 仪表盘行布局2 |
      | 仪表盘行布局3 |
      | 仪表盘行布局4 |
      | 仪表盘行布局5 |
      | 仪表盘行布局6 |
      | 仪表盘行布局7 |
      | 仪表盘行布局51      |
      | 仪表盘行布局52      |
      | 仪表盘行布局53      |

  Scenario Outline: 行布局添加全局输入项(RZY-4632)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<dashboardName>"
    And I wait for loading invisible
    When I click the detail which name is "<dashboardName>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加输入项" from the "AddItemMenu"
    And I wait for loading invisible
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I set the parameter "FilterDefaultValue" with value "apache.geo.city"
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加输入项成功"

    Examples:
      | dashboardName |
      | 仪表盘行布局1       |
      | 仪表盘行布局2       |
      | 仪表盘行布局3       |
      | 仪表盘行布局4       |
      | 仪表盘行布局5       |
      | 仪表盘行布局6       |
      | 仪表盘行布局7       |
      | 仪表盘行布局51      |
      | 仪表盘行布局52      |
      | 仪表盘行布局53      |

  Scenario: 展示条件-文本输入输入项 RZY-4783,RZY-4784
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局1"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局1"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "行布局趋势图3" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "为空" from the "ShowCondition"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "MoreXuanTing2" button
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "不为空" from the "ShowCondition"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I click the "SettingIcon" button
    Then I will see the "trendThree" doesn't exist
    Then I wait for "trendTwo" will be visible
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenShowCondition" button to "disable"
    And I wait for element "SuccessMessage" change text to "展示条件已关闭"

  Scenario: 展示条件-文本输入输入项 RZY-4784,RZY-4793
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局2"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局2"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "行布局趋势图3" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "匹配正则" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "a1?b"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "MoreXuanTing2" button
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "包含" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "a"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I set the parameter "FilterValue" with value "a1111b"
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I click the "SettingIcon" button
    Then I will see the "trendThree" doesn't exist
    Then I wait for "trendTwo" will be visible

  Scenario: 展示条件-文本输入输入项 RZY-4784
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局3"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局3"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "行布局趋势图3" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "匹配正则" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "a1?b"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "MoreXuanTing2" button
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "包含" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "a"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I set the parameter "FilterValue" with value "a1111b"
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I click the "SettingIcon" button
    Then I will see the "trendThree" doesn't exist
    Then I wait for "trendTwo" will be visible

  Scenario: 展示条件-文本输入输入项 RZY-4784
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局4"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局4"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I set the parameter "FilterValue" with value "a1111b"
    When the chart title is "行布局趋势图3" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "等于" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "a1111b"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "MoreXuanTing2" button
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "不等于" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "a1111b"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I click the "SettingIcon" button
    Then I will see the "trendTwo" doesn't exist
    Then I wait for "trendThree" will be visible

  Scenario: 展示条件-文本输入输入项 RZY-4784
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局5"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局5"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "行布局趋势图3" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "大于" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "5"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "MoreXuanTing2" button
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "小于" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "9"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I set the parameter "FilterValue" with value "6"
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I click the "SettingIcon" button
    Then I wait for "trendTwo" will be visible
    Then I wait for "trendThree" will be visible
    And I click the "trendThree" button
    And I set the parameter "FilterValue" with value "0"
    Then I will see the "trendThree" doesn't exist
    Then I wait for "trendTwo" will be visible
    And I click the "trendTwo" button
    And I set the parameter "FilterValue" with value "100"
    Then I will see the "trendTwo" doesn't exist
    Then I wait for "trendThree" will be visible

  Scenario Outline: 展示条件-时间范围输入项预置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<dashboardName>"
    And I wait for loading invisible
    When I click the detail which name is "<dashboardName>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I choose the "时间范围" from the "FilterType"
    And I click the "DateEditor" button
    And I click the "Today" button
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

    Examples:
      | dashboardName |
      | 仪表盘行布局51      |
      | 仪表盘行布局52      |
      | 仪表盘行布局53      |

  Scenario: 展示条件-时间范围输入项 RZY-4790
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局51"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局51"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "行布局趋势图3" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "不为空" from the "ShowCondition"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "MoreXuanTing2" button
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "为空" from the "ShowCondition"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I click the "SettingIcon" button
    Then I will see the "trendTwo" doesn't exist
    Then I wait for "trendThree" will be visible
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenShowCondition" button to "disable"

  Scenario: 展示条件-时间范围输入项 RZY-4790
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局52"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局52"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "行布局趋势图3" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "包含" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "-1h"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "MoreXuanTing2" button
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "匹配正则" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "now/d,?now"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenShowCondition" button to "enable"
    Then I will see the "trendThree" doesn't exist
    Then I wait for "trendTwo" will be visible

  Scenario: 展示条件-时间范围输入项 RZY-4790
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局52"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局52"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I switch the dashboard "OpenShowCondition" button to "disable"
    And I click the "SettingIcon" button
    And I wait for "TrendThree" will be visible

  Scenario: 展示条件-时间范围输入项 RZY-4790
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局53"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局53"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "行布局趋势图3" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "等于" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "now/d,now"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "MoreXuanTing2" button
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "不等于" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "now/d,now"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenShowCondition" button to "enable"
    Then I wait for "trendThree" will be visible
    Then I will see the "trendTwo" doesn't exist

  Scenario: 展示条件缺失校验 RZY-4792
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局53"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局53"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    Then I wait for "FilterName" will be visible
    When the chart title is "行布局趋势图3" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I click the "ShowFilterConfig" button
    And I click the "CleanShowFilterConfig" button
    And I click the "Ensure" button
    Then I wait for "TipErrorShowCondition" will be visible
    And I click the "ShowCondition" button
    And I click the "CleanShowConditio" button
    And I set the parameter "ShowValue" with value ""
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"

  Scenario: 展示条件-下拉菜单输入项预置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局6"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局6"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I choose the "下拉菜单" from the "InputType"
    And I click the "SingleChoice" button
    And I set the parameter "ChoiceValue" with value "111"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "a1111b"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "6"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "0"
    And I click the "AddChoiceValueButton" button
    And I choose the "111" from the "DefaultDropdownList"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenShowCondition" button to "disable"

  Scenario: 展示条件-下拉菜单输入项 RZY-4785
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局7"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局7"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "行布局趋势图3" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "不为空" from the "ShowCondition"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "MoreXuanTing2" button
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "为空" from the "ShowCondition"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I click the "SettingIcon" button
    Then I will see the "trendTwo" doesn't exist
    Then I wait for "trendThree" will be visible

  Scenario: 展示条件-动态菜单输入项预置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局7"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局7"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I choose the "动态菜单" from the "InputType"
    And I click the "SingleChoice" button
    And I set the parameter "DynamicField" with value "apache.geo.city"
    And I set the parameter "Spl" with value "*|stats count() by 'apache.geo.city'"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchFilterButton" button
    And I wait for loading invisible
    And I choose the "成都市" from the "DefaultDropdownList"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenShowCondition" button to "disable"

  Scenario: 展示条件-动态菜单输入项 RZY-4786
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘行布局7"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘行布局7"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "行布局趋势图3" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "包含" from the "ShowCondition"
    And I wait for "ShowValue" will be visible
    And I set the parameter "ShowValue" with value "市"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I click the "MoreXuanTing2" button
    And I click the "Configs" button
    And I wait for loading invisible
    And I choose the "filter" from the "ShowFilterConfig"
    And I wait for "500" millsecond
    And I choose the "匹配正则" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "aab?市"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I choose the "成都市" from the "FilterDropdown"
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenShowCondition" button to "enable"
    Then I will see the "trendTwo" doesn't exist
    Then I wait for "trendThree" will be visible