@dbdrilldown @dashboard0330 @dashboard39
Feature: 仪表盘钻取配置二


  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 钻取配置二 |

  @dashboard39pre1
  Scenario Outline: 新建趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchConfig" button
    And I wait for "FenPianQuYang" will be visible
    And I set the parameter "FenPianQuYang" with value ""
    And I click the "CloseWindow" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    Given I wait for loading complete
    And I wait for "Header" will be visible
    And I wait for "2000" millsecond
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "Complete" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      |  name    |  spl                             |
      | 钻取配置1 | *\|stats count() by json.caller |


  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "测试钻取配置二"
    And I click the "Ensure" button
    Then I wait for "SettingIcon" will be visible

    Examples:
      | name   |
      | 钻取配置二 |


  Scenario: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "钻取配置二"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for loading invisible
    And I set the parameter "SearchChartInput" with value "钻取配置"
    And I wait for loading invisible
    And I click the "{'Checkbox':'钻取配置1'}" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"


  Scenario: 开启钻取配置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "钻取配置二"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I switch the dashboard "OpenDrilldown" button to "enable"
#    And I click the "OpenDrilldown" button
    And I wait for "500" millsecond


  Scenario: 无钻取动作0 RZY-316
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "钻取配置二"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "钻取配置1" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "Ensure" will be visible
    Then I will see the element "DrillActionText" value is "无钻取动作"


  Scenario Outline: url默认格式和原始模式 RZY-1741
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "钻取配置二"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "钻取配置1" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "Ensure" will be visible
    And I choose the "跳转到自定义URL" from the "DrillAction"
    And I wait for "1500" millsecond
    And I set the parameter "Url" with value "<url>"
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I wait for "500" millsecond
    And I click the "Ensure" button
    And I refresh the website
    And I wait for "JsonCallerText" will be visible
    And I click the "JsonCallerText" button
    And switch to another window
    And I close all tabs except main tab
#    And I wait for "Progress" will be invisible
    And I wait for loading invisible
    Then I will see the url contains "<urlPart>"

    Examples:
      |  url                                           |    urlPart                                                             |
      | https://github.com/search?q=${click.value2\|u} | github.com/search?q=phplib%2Fxiaomi%2FModel%2FDevice%2FEvent.php%3A451 |
      | https://github.com/search?q=${click.value2\|n} | github.com/search?q=phplib/xiaomi/Model/Device/Event.php:451 |
