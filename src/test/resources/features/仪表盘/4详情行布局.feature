@dashboard @dashboardSmoke
Feature: 仪表盘详情行布局

  Scenario: 新建一个行布局tag(RZY-4628)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "rowLayout"
    And I click the "RowLayout" button
    And I click the "EnsureCreateTagButton" button
    And I back to before

  Scenario Outline: 新建行布局趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "FenPianQuYang" button
    And I alter the input element "FenPianQuYang" value to "0"
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | name      | spl                                   |
      | 行布局趋势图1 | *\|stats count() by 'apache.geo.city' |
      | 行布局趋势图2 | *\|stats count() by 'apache.geo.city' |
      | 行布局趋势图3 | *\|stats count() by 'apache.geo.city' |

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
    And I wait for "1000" millsecond
    And I click the "AddEventButton" button
#    And I will see the element "AddChart" attribute "aria-disabled" is "false"
    And I click the "AddRow" button
    And I wait for loading invisible
    And I click the "{'Checkbox':'行布局趋势图1'}" button
    And I click the "{'Checkbox':'行布局趋势图2'}" button
    And I click the "{'Checkbox':'行布局趋势图3'}" button
    And I wait for "500" millsecond
    And I click the "Ensure" button
    And I wait for "1000" millsecond

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

  Scenario: 行布局添加图表(RZY-4631)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
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

  Scenario: 删除行内图表(RZY-4636)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    And I click the "MoreXuanTing" button
    And I click the "ChartDelete" button
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除成功"
    Then I will see the "TrendOne" is not exist

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





