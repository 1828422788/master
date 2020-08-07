@dashboard @dashboardSmoke
Feature: 仪表盘详情行布局

  Scenario: 新建一个行布局tag
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

  Scenario: 添加行
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "AddEventButton" button
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
    And I wait for "1000" millsecond
    And I click the "Ensure" button

  Scenario: 编辑行
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "UIautotest"
    Then I will see the "dashboard.DetailPage" page


    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I set the parameter "SearchChartInput" with value "验证仪表盘全局时间"
    And I wait for loading invisible
    And I click the "{'Checkbox':'验证仪表盘全局时间'}" button
    And I click the "Ensure" button
    And I wait for "1000" millsecond



