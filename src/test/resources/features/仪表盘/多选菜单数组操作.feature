@yibiaopanshuruxiang
Feature: 多选菜单数组操作

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name  |
      | 仪表盘多选菜单数组操作 |

  @dashboard @dashboardSmoke
  Scenario Outline: 新建多选数组操作标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "多选数组操作"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete
    And I back to before

    Examples:
      | name  |
      | 仪表盘多选菜单数组操作 |

  @dashboard @dashboardSmoke
  Scenario Outline: 创建仪表盘多选菜单数组趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I wait for "Today" will be visible
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
      | name                | spl                                   |
      | 仪表盘多选菜单数组     | *\|stats count() by 'apache.geo.city'  |

  @dashboard @dashboardSmoke
  Scenario: 添加下拉多选输入项与趋势图
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘多选菜单数组操作"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "仪表盘多选菜单数组"
    And I wait for loading invisible
    And I "checked" the checkbox which name is "仪表盘多选菜单数组"
    And I click the "Ensure" button
    And I wait for loading complete
    And I wait for "4000" millsecond
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I choose the "下拉菜单" from the "InputType"
    And I click the "MultiSelect" button
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible
