@dashboard9 @dashboardpart3
Feature: 仪表盘多选菜单数组操作

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
      | 仪表盘多选菜单数组操作 |

  @dashboardpart3Smoke
  Scenario Outline: 新建多选数组操作标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "多选数组操作"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建标签成功"

    Examples:
      | name  |
      | 仪表盘多选菜单数组操作 |

  @dashboardpart3Smoke
  Scenario Outline: 创建仪表盘多选菜单数组趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
#    And I click the "Create" button
    Then I will see the "trend.CreatePageDash" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I wait for "Today" will be visible
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
      | name                | spl                                   |
      | 仪表盘多选菜单数组     | tag:sample04061424_chart \|stats count() by 'apache.geo.city'  |

  @dashboardpart3Smoke
  Scenario: 添加下拉多选输入项与趋势图
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘多选菜单数组操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "仪表盘多选菜单数组"
    And I wait for loading invisible
    And I click the "{'Checkbox':'仪表盘多选菜单数组'}" button
#    And I "checked" the checkbox which name is "仪表盘多选菜单数组"
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

  @dashboardpart3Smoke
  Scenario: 开启钻取配置 (RZY-4479)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘多选菜单数组操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenDrilldown" button to "enable"
#    And I click the "OpenDrilldown" button
    And I wait for "500" millsecond

  @dashboardpart3Smoke
  Scenario: 多选菜单数组操作-Push RZY-4794
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘多选菜单数组操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘多选菜单数组" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "DrillAction" will be visible
    And I choose the "管理本页过滤项/输入项数值" from the "DrillAction"
    And I wait for "1000" millsecond
    And I click the "NewCreat" button
    And I choose the "Push" from the "OptionItems"
    And I wait for "1000" millsecond
    And I set the parameter "TokenInput" with value "filter"
    And I wait for "1000" millsecond
    And I choose the "${click.value2}" from the "ParamValue1"
#    And I click the "ParamValue1" button
    And I wait for "1000" millsecond
    And I click the "Ensure" button
    And I wait for "2000" millsecond
    And I click the "ChengDuShi" button
    And I click the "Nanjingshi" button
    And I wait for "2000" millsecond
    And I click the "FilterDropDown1" button
    Then I wait for "ChengdushiList" will be visible
    Then I wait for "NanjingshiList" will be visible

  @dashboardpart3Smoke
  Scenario: 多选菜单数组操作-Pop RZY-4795
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘多选菜单数组操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I click the "ChengDuShi" button
    And I click the "Nanjingshi" button
    And I wait for "1000" millsecond
    When the chart title is "仪表盘多选菜单数组" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "DrillAction" will be visible
    And I choose the "管理本页过滤项/输入项数值" from the "DrillAction"
    And I wait for "1000" millsecond
#    And I click the "NewCreat" button
    And I choose the "Pop" from the "OptionItems"
    And I wait for "1000" millsecond
    And I set the parameter "TokenInput" with value "filter"
    And I wait for "1000" millsecond
    And I click the "Ensure" button
    And I wait for "2000" millsecond
    And I wait for "ChengDuShi" will be visible
    And I click the "ChengDuShi" button
#    And I click the "Nanjingshi" button
    And I wait for "3000" millsecond
    And I click the "FilterDropDown1" button
    Then I wait for "ChengdushiList" will be visible
    Then I wait for "NanjingshiList" will be invisible


  Scenario: 多选菜单数组操作-Unshift RZY-4796
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘多选菜单数组操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘多选菜单数组" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "DrillAction" will be visible
    And I choose the "管理本页过滤项/输入项数值" from the "DrillAction"
    And I wait for "1000" millsecond
    And I choose the "Unshift" from the "OptionItems"
    And I wait for "1000" millsecond
    And I set the parameter "TokenInput" with value "filter"
#    And I click the "ParamValue1" button
#    And I wait for "ClickValue" will be visible
#    And I click the "ClickValue" button
    And I wait for "1000" millsecond
    And I choose the "${click.value2}" from the "ParamValue1"
    And I wait for "1000" millsecond
    And I click the "Ensure" button
    And I wait for "2000" millsecond
    And I click the "ChengDuShi" button
    And I click the "Nanjingshi" button
    And I wait for "2000" millsecond
    And I click the "FilterDropDown1" button
    Then I wait for "ChengdushiList" will be visible
    Then I wait for "NanjingshiList" will be visible


  Scenario: 多选菜单数组操作-Shift RZY-4797
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘多选菜单数组操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I click the "ChengDuShi" button
    And I click the "Nanjingshi" button
    And I click the "FilterDropDown1" button
    Then I wait for "NanjingshiList" will be visible
    And I wait for "1000" millsecond
    When the chart title is "仪表盘多选菜单数组" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1000" millsecond
    And I choose the "管理本页过滤项/输入项数值" from the "DrillAction"
    And I wait for "1000" millsecond
#    And I click the "NewCreat" button
    And I choose the "Shift" from the "OptionItems"
    And I wait for "1000" millsecond
    And I set the parameter "TokenInput" with value "filter"
    And I wait for "1000" millsecond
    And I click the "Ensure" button
    And I wait for "2000" millsecond
    And I click the "ChengDuShi" button
#    And I click the "Nanjingshi" button
    And I wait for "3000" millsecond
    And I click the "FilterDropDown1" button
    Then I wait for "ChengdushiList" will be visible
    Then I wait for "NanjingshiList" will be invisible


  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 仪表盘多选菜单数组操作   |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name    |
      | 仪表盘多选菜单数组  |