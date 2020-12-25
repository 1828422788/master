Feature: 仪表盘详情行布局

  @dashboard11 @dashboardSmoke
  Scenario: 新建一个行布局tag(RZY-4628)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "rowLayout"
    And I click the "RowLayout" button
    And I click the "EnsureCreateTagButton" button
    And I wait for "5000" millsecond
#    And I back to before

  @dashboard11 @dashboardSmoke
  Scenario Outline: 新建行布局趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "DateEditor" button under some element
    And I wait for "1000" millsecond
    And I click the "Today" button
#    And I click the "FenPianQuYang" button
#    And I alter the input element "FenPianQuYang" value to "0"
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | name        | spl                                                           |
      | 行布局趋势图1 | tag:sample04061424_chart \|stats count() by 'apache.geo.city' |
      | 行布局趋势图2 | tag:sample04061424_chart \|stats count() by 'apache.geo.city' |
      | 行布局趋势图2 | tag:sample04061424_chart \|stats count() by 'apache.geo.city' |
      | 行布局趋势图3 | tag:sample04061424_chart \|stats count() by 'apache.geo.city' |

  @dashboard @dashboardSmoke
  Scenario: 添加行(RZY-4629，RZY-3607)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
#    Then I will see the "AddChart,AddEvent,AddInput" is "disabled"
    And I wait for "AddChart" will be visible
    And I will see the element "AddChartItem" attribute "aria-disabled" is "true"
    And I click the "AddRow" button
    And I wait for loading invisible
    And I set the parameter "TagName" with value "第一行"
    And I click the "{'Checkbox':'行布局趋势图1'}" button
    And I click the "{'Checkbox':'行布局趋势图2'}" button
    And I click the "Ensure" button
    And I wait for "2000" millsecond
    And I click the "AddEventButton" button
#    And I will see the element "AddChart" attribute "aria-disabled" is "false"
    And I click the "AddRow" button
    And I wait for loading invisible
    And I click the "{'Checkbox':'行布局趋势图1'}" button
    And I wait for "500" millsecond
    And I click the "Ensure" button
    And I wait for "2000" millsecond

  @dashboard @dashboardSmoke
  Scenario: 编辑行(RZY-4630)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    And I move the mouse pointer to the "EditRowIcon"
    And I click the "EditRowIcon" button
    And I set the parameter "TagName" with value "首行"
    And I click the "Ensure" button
    And I wait for "1000" millsecond
    Then I wait for "FirstRow" will be visible

  @dashboard @dashboardSmoke
  Scenario: 行布局添加图表(RZY-4631)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "1000" millsecond
    And I click the "JoinRow" button
    And I wait for "500" millsecond
#    And I set the parameter "JoinRow" with value "L2: "
    And I click the "Line1" button
    And I click the "Line2" button
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the error message "请至少选择一个趋势图"
    And I wait for "3000" millsecond
    And I set the parameter "SearchTagInput" with value "行布局"
    And I wait for "1000" millsecond
    And I click the "{'Checkbox':'行布局趋势图2'}" button
    And I wait for "1000" millsecond
    And I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario: 行布局添加全局输入项(RZY-4632)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I set the parameter "FilterDefaultValue" with value "apache.geo.city"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  @dashboard @dashboardSmoke
  Scenario: 行布局添加行内输入项(RZY-4633)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "innerFilter"
    And I set the parameter "FilterToken" with value "innerFilter"
    And I click the "FilterJoinRow" button
    And I wait for "500" millsecond
    And I click the "Line1" button
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I wait for "InnerInputFilter" will be visible

  @dashboard @dashboardSmoke
  Scenario: 行布局添加事件列表(RZY-4634)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddEvent" button
    And I set the parameter "EventName" with value "测试行事件"
    And I set the parameter "Spl" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the error message "请选择要加入的行"
    And I click the "JoinRow" button
    And I click the "Line1" button
    And I wait for "500" millsecond
    And I click the "Ensure" button under some element
    Then I wait for "RowEventName" will be visible

  @dashboard @dashboardSmoke
  Scenario: 删除行(RZY-4635)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    And I move the mouse pointer to the "DeleteRowIcon"
    And I click the "DeleteRowIcon" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除行成功"

  @dashboard @dashboardSmoke
  Scenario: 删除行内图表(RZY-4636)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
#    And I click the "MoreXuanTing" button
#    And I click the "ChartDelete" button
    And I click the "DeleteTrend1" button
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除成功"
    Then I will see the "TrendOne" is not exist

  @dashboard @dashboardSmoke
  Scenario: 展示条件-文本输入项预置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    And I move the mouse pointer to the "DeleteNoNameRowIcon"
    And I click the "DeleteNoNameRowIcon" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除行成功"
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
#    Then I will see the "AddChart,AddEvent,AddInput" is "disabled"
    And I wait for "AddChart" will be visible
    And I will see the element "AddChartItem" attribute "aria-disabled" is "true"
    And I click the "AddRow" button
    And I wait for "1500" millsecond
#    And I set the parameter "TagName" with value "第一行"
    And I set the parameter "ChartForAdd" with value "行布局"
    And I wait for loading invisible
    And I click the "{'Checkbox':'行布局趋势图2'}" button
    And I click the "{'Checkbox':'行布局趋势图3'}" button
    And I click the "Ensure" button
    And I wait for "1000" millsecond

  @dashboard @dashboardSmoke
  Scenario: 展示条件-文本输入输入项 RZY-4783,RZY-4784
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "行布局趋势图3" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "为空" from the "ShowCondition"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "配置成功"
    And I click the "MoreXuanTing2" button
#    And I click the "MoreConfig" button
    And I click the "MoreConfigs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "不为空" from the "ShowCondition"
    And I click the "Ensure" button
    And I wait for "1500" millsecond
    And I click the "SettingIcon" button
    And I wait for "500" millsecond
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I wait for "3000" millsecond
#    And I will see the success message "展示条件已启用"
    Then I will see the "trendThree" doesn't exist
    Then I wait for "trendTwo" will be visible

  @dashboard @dashboardSmoke
  Scenario: 展示条件-文本输入输入项 RZY-4784,RZY-4793
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I wait for "500" millsecond
    And I switch the dashboard "OpenShowCondition" button to "disable"
    And I wait for "1500" millsecond
#    And I will see the success message "展示条件已关闭"
    When the chart title is "行布局趋势图3" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "匹配正则" from the "ShowCondition"
    And I wait for "ShowValue" will be visible
    And I set the parameter "ShowValue" with value "a1?b"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "配置成功"
    And I wait for "MoreXuanTing2" will be visible
    And I click the "MoreXuanTing2" button
#    And I click the "MoreConfig" button
    And I click the "MoreConfigs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "包含" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "a"
    And I click the "Ensure" button
    And I wait for "1000" millsecond
    And I set the parameter "FilterValue" with value "a1111b"
    And I click the "SettingIcon" button
    And I wait for "1000" millsecond
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I wait for "3000" millsecond
#    And I will see the success message "展示条件已启用"
    Then I will see the "trendThree" doesn't exist
    Then I wait for "trendTwo" will be visible

  @dashboard @dashboardSmoke
  Scenario: 展示条件-文本输入输入项 RZY-4784
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I wait for "500" millsecond
    And I switch the dashboard "OpenShowCondition" button to "disable"
    And I wait for "1500" millsecond
#    And I will see the success message "展示条件已关闭"
    When the chart title is "行布局趋势图3" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "匹配正则" from the "ShowCondition"
    And I wait for "ShowValue" will be visible
    And I set the parameter "ShowValue" with value "a1?b"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "配置成功"
    And I click the "MoreXuanTing2" button
#    And I click the "MoreConfig" button
    And I click the "MoreConfigs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "包含" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "a"
    And I click the "Ensure" button
    And I wait for "1000" millsecond
    And I set the parameter "FilterValue" with value "a1111b"
    And I click the "SettingIcon" button
    And I wait for "3000" millsecond
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I wait for "500" millsecond
#    And I will see the success message "展示条件已启用"
    Then I will see the "trendThree" doesn't exist
    Then I wait for "trendTwo" will be visible
    And I click the "trendTwo" button
    And I wait for "1500" millsecond
    And I click the "SettingIcon" button
    And I wait for "500" millsecond
    And I switch the dashboard "OpenShowCondition" button to "disable"
    And I wait for "500" millsecond
#    And I will see the success message "展示条件已关闭"
    When the chart title is "行布局趋势图3" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "MoreConfigs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "等于" from the "ShowCondition"
    And I wait for "ShowValue" will be visible
    And I set the parameter "ShowValue" with value "a1111b"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "配置成功"
    And I click the "MoreXuanTing2" button
#    And I click the "MoreConfig" button
    And I click the "Configs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "不等于" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "a1111b"
    And I click the "Ensure" button
    And I wait for "1000" millsecond
    And I click the "SettingIcon" button
    And I wait for "3000" millsecond
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I wait for "500" millsecond
#    And I will see the success message "展示条件已启用"
    Then I will see the "trendTwo" doesn't exist
    Then I wait for "trendThree" will be visible
    And I click the "trendThree" button
    And I wait for "1500" millsecond
    And I click the "SettingIcon" button
    And I wait for "500" millsecond
    And I switch the dashboard "OpenShowCondition" button to "disable"
    And I wait for "1500" millsecond
#    And I will see the success message "展示条件已关闭"
    When the chart title is "行布局趋势图3" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button under some element
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "大于" from the "ShowCondition"
    And I wait for "ShowValue" will be visible
    And I set the parameter "ShowValue" with value "5"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "配置成功"
    And I click the "MoreXuanTing2" button
#    And I click the "MoreConfig" button
    And I click the "MoreConfigs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "小于" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "9"
    And I click the "Ensure" button
    And I wait for "1000" millsecond
    And I set the parameter "FilterValue" with value "6"
    And I click the "SettingIcon" button
    And I wait for "3000" millsecond
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I wait for "1500" millsecond
#    And I will see the success message "展示条件已启用"
#    Then I will see the "trendThree" doesn't exist
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

  @dashboard @dashboardSmoke
  Scenario: 展示条件-时间范围输入项预置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I wait for "500" millsecond
    And I click the "inputSettingType" button
    And I click the "timeRangee" button
    And I wait for "DateEditor" will be visible
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible
    And I click the "SettingIcon" button
    And I wait for "500" millsecond
    And I switch the dashboard "OpenShowCondition" button to "disable"
    And I wait for "500" millsecond
    And I will see the success message "展示条件已关闭"

  @dashboard @dashboardSmoke
  Scenario: 展示条件-时间范围输入项 RZY-4790
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "行布局趋势图3" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "不为空" from the "ShowCondition"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "配置成功"
    And I click the "MoreXuanTing2" button
#    And I click the "MoreConfig" button
    And I click the "MoreConfigs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "为空" from the "ShowCondition"
    And I click the "Ensure" button
    And I wait for "1000" millsecond
    And I click the "SettingIcon" button
    And I wait for "3000" millsecond
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I wait for "500" millsecond
#    And I will see the success message "展示条件已启用"
    Then I will see the "trendTwo" doesn't exist
    Then I wait for "trendThree" will be visible
    And I click the "trendThree" button
    And I wait for "1500" millsecond
    And I click the "SettingIcon" button
    And I wait for "500" millsecond
    And I switch the dashboard "OpenShowCondition" button to "disable"
    And I wait for "1500" millsecond
#    And I will see the success message "展示条件已关闭"
    And I click the "trendThree" button
    When the chart title is "行布局趋势图3" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "包含" from the "ShowCondition"
    And I wait for "ShowValue" will be visible
    And I set the parameter "ShowValue" with value "-1h"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "配置成功"
    And I click the "MoreXuanTing2" button
#    And I click the "MoreConfig" button
    And I click the "MoreConfigs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "匹配正则" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "now/d,?now"
    And I click the "Ensure" button
    And I wait for "1000" millsecond
    And I click the "SettingIcon" button
    And I wait for "3000" millsecond
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I wait for "500" millsecond
#    And I will see the success message "展示条件已启用"
    Then I will see the "trendThree" doesn't exist
    Then I wait for "trendTwo" will be visible
    And I click the "trendTwo" button
    And I wait for "1500" millsecond
    And I click the "SettingIcon" button
    And I wait for "500" millsecond
    And I switch the dashboard "OpenShowCondition" button to "disable"
    And I wait for "1500" millsecond
#    And I will see the success message "展示条件已关闭"
    And I click the "trendThree" button
    When the chart title is "行布局趋势图3" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "MoreConfigs" button under some element
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "等于" from the "ShowCondition"
    And I wait for "ShowValue" will be visible
    And I set the parameter "ShowValue" with value "now/d,now"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "配置成功"
    And I click the "MoreXuanTing2" button
#    And I click the "MoreConfig" button
    And I click the "Configs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "不等于" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "now/d,now"
    And I click the "Ensure" button
    And I wait for "1000" millsecond
    And I click the "SettingIcon" button
    And I wait for "3000" millsecond
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I wait for "500" millsecond
#    And I will see the success message "展示条件已启用"
    Then I wait for "trendThree" will be visible
    Then I will see the "trendTwo" doesn't exist
#    Then I wait for "trendTwo" will be visible

  @dashboard @dashboardSmoke
  Scenario: 展示条件缺失校验 RZY-4792
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "FilterName" will be visible
    When the chart title is "行布局趋势图3" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for "1000" millsecond
    And I move the mouse pointer to the "CleanShowFilterConfig"
    And I click the "CleanShowFilterConfig" button
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I wait for "TipErrorShowCondition" will be visible
    And I move the mouse pointer to the "CleanShowConditio"
    And I click the "CleanShowConditio" button
    And I set the parameter "ShowValue" with value ""
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "配置成功"

  @dashboard @dashboardSmoke
  Scenario: 展示条件-下拉菜单输入项预置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I wait for "500" millsecond
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
    And I wait for "500" millsecond
    And I choose the "111" from the "DefaultDropdownList"
    And I wait for "1500" millsecond
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible
    And I click the "SettingIcon" button
    And I wait for "500" millsecond
    And I switch the dashboard "OpenShowCondition" button to "disable"
    And I wait for "1500" millsecond

  @dashboard @dashboardSmoke
  Scenario: 展示条件-下拉菜单输入项 RZY-4785
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "行布局趋势图3" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "不为空" from the "ShowCondition"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "配置成功"
    And I click the "MoreXuanTing2" button
#    And I click the "MoreConfig" button
    And I click the "MoreConfigs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "为空" from the "ShowCondition"
    And I click the "Ensure" button
    And I wait for "1000" millsecond
    And I click the "SettingIcon" button
    And I wait for "3000" millsecond
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I wait for "500" millsecond
    Then I will see the "trendTwo" doesn't exist
    Then I wait for "trendThree" will be visible


  @dashboard @dashboardSmoke
  Scenario: 展示条件-动态菜单输入项预置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    And I click the "FilterName" button
    And I click the "FilterSetting" button
    And I wait for "500" millsecond
    And I choose the "动态菜单" from the "InputType"
    And I click the "SingleChoice" button
    And I set the parameter "DynamicField" with value "apache.geo.city"
    And I set the parameter "Spl" with value "*|stats count() by 'apache.geo.city'"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "Search" button under some element
    And I wait for loading invisible
    And I choose the "成都市" from the "DefaultDropdownList"
    And I wait for "1500" millsecond
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible
    And I wait for "1000" millsecond
    And I click the "SettingIcon" button
    And I wait for "500" millsecond
    And I switch the dashboard "OpenShowCondition" button to "disable"
    And I wait for "1500" millsecond

  @dashboard @dashboardSmoke
  Scenario: 展示条件-动态菜单输入项 RZY-4786
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "行布局趋势图3" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button under some element
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "包含" from the "ShowCondition"
    And I wait for "ShowValue" will be visible
    And I set the parameter "ShowValue" with value "市"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "配置成功"
    And I click the "MoreXuanTing2" button
#    And I click the "MoreConfig" button
    And I click the "MoreConfigs" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And I choose the "filter" from the "ShowFilterConfig"
    And I choose the "匹配正则" from the "ShowCondition"
    And I set the parameter "ShowValue" with value "aab?市"
    And I click the "Ensure" button
    And I wait for "1000" millsecond
    And I choose the "成都市" from the "FilterDropdown"
    And I click the "SettingIcon" button
    And I wait for "1500" millsecond
    And I switch the dashboard "OpenShowCondition" button to "enable"
    And I wait for "500" millsecond
    Then I will see the "trendTwo" doesn't exist
    Then I wait for "trendThree" will be visible

  @cleanDashboard
  Scenario Outline: 删除行布局所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name   |
      | 行布局趋势图1 |
      | 行布局趋势图2 |
      | 行布局趋势图3 |





