Feature: 仪表盘钻取配置二

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 钻取配置二 |

  @dashboard @dashboardSmoke
  Scenario Outline: 新建趋势图
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
      |  name    |  spl                             |
      | 钻取配置1 | *\|stats count() by json.caller |

  @dashboard @dashboardSmoke
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "测试钻取配置二"
    And I click the "Ensure" button
    And I wait for loading complete
    And I back to before

    Examples:
      | name   |
      | 钻取配置二 |

  @dashboard @dashboardSmoke
  Scenario: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "钻取配置二"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "钻取配置"
    And I wait for loading invisible
    And I click the "{'Checkbox':'钻取配置1'}" button
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

  @dashboard @dashboardSmoke
  Scenario: 开启钻取配置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "钻取配置二"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenDrilldown" button to "enable"
#    And I click the "OpenDrilldown" button
    And I wait for "500" millsecond

  @dashboard @dashboardSmoke
  Scenario: 无钻取动作0 RZY-316
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "钻取配置二"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "钻取配置1" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for loading invisible
    Then I will see the element "DrillActionText" value is "无钻取动作"

  @dashboard @dashboardSmoke
  Scenario Outline: url默认格式和原始模式 RZY-1741
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "钻取配置二"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "钻取配置1" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for loading invisible
    And I choose the "跳转到自定义URL" from the "DrillAction"
    And I set the parameter "Url" with value "<url>"
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I refresh the website
    And I wait for "JsonCallerText" will be visible
    And I click the "JsonCallerText" button
    And switch to another window
    And I close all tabs except main tab
    And I wait for "Progress" will be invisible
    Then I will see the url contains "<urlPart>"

    Examples:
      |  url                                           |    urlPart                                                             |
      | https://github.com/search?q=${click.value2\|u} | github.com/search?q=phplib%2Fxiaomi%2FModel%2FDevice%2FEvent.php%3A451 |
      | https://github.com/search?q=${click.value2\|n} | github.com/search?q=phplib/xiaomi/Model/Device/Event.php:451 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 钻取配置二   |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name    |
      | 钻取配置1 |
      | 钻取配置2 |