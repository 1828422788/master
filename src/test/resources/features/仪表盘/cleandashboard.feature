@cleanDashboard
Feature: 仪表盘删除

  @cleandbinput
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name         |
      | 仪表盘1669所用趋势图 |
      | 仪表盘所用趋势图     |

  @cleandbinput
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name  |
      | 测试输入项 |

  @cleandbdrilldown
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 钻取跳转   |
      | 测试钻取配置 |

  @cleandbdrilldown
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name    |
      | 测试标签钻取  |
      | 仪表盘钻取配置 |

  @cleandbmyaxes
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name    |
      | 仪表盘多Y轴图 |

  @cleandbmyaxes
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name    |
      | 仪表盘多Y轴图 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name              |
      | 仪表盘曲线图       |
      | 仪表盘面积图       |
      | 仪表盘散点图       |
      | 仪表盘柱状图       |
      | 仪表盘饼状图       |
      | 仪表盘玫瑰图       |
      | 仪表盘条形图       |
      | 仪表盘旭日图       |
      | 仪表盘火焰图       |
      | 仪表盘和弦图       |
      | 仪表盘桑基图       |
      | 仪表盘力图         |
      | 仪表盘区间图       |
      | 仪表盘多Y轴图      |
      | 仪表盘热力地图     |
      | 仪表盘攻击地图     |
      | 仪表盘区划地图     |
      | 仪表盘统计地图     |
      | 仪表盘表格样式设置 |
      | 仪表盘单值         |
      | 仪表盘环形比例图   |
      | 仪表盘水球图       |
      | 仪表盘字符云图     |
      | 仪表盘循序图       |
      | 仪表盘雷达图       |
      | 仪表盘漏斗图       |
      | 仪表盘矩阵热力图   |
      | 仪表盘调用链       |
      | 仪表盘网络节点图   |


  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name              |
      | 仪表盘曲线图       |
      | 仪表盘面积图       |
      | 仪表盘散点图       |
      | 仪表盘柱状图       |
      | 仪表盘饼状图       |
      | 仪表盘玫瑰图       |
      | 仪表盘条形图       |
      | 仪表盘旭日图       |
      | 仪表盘火焰图       |
      | 仪表盘和弦图       |
      | 仪表盘桑基图       |
      | 仪表盘力图         |
      | 仪表盘区间图       |
      | 仪表盘多Y轴图      |
      | 仪表盘热力地图     |
      | 仪表盘攻击地图     |
      | 仪表盘区划地图     |
      | 仪表盘统计地图     |
      | 仪表盘表格样式     |
      | 仪表盘单值         |
      | 仪表盘环形比例图   |
      | 仪表盘水球图       |
      | 仪表盘字符云图     |
      | 仪表盘循序图       |
      | 仪表盘雷达图       |
      | 仪表盘漏斗图       |
      | 仪表盘矩阵热力图   |
      | 仪表盘调用链       |
      | 仪表盘网络节点图   |

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

  @cleanDashboard04
  Scenario Outline: 删除行布局所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name   |
      | 行布局趋势图1 |
      | 行布局趋势图2 |
      | 行布局趋势图3 |

  @cleanDashboard1
  Scenario: 删除知识库
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Given the data name is "apache" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    When I click the "Ensure" button
    And I will see the success message "删除知识成功"

  @cleanDashboard1
  Scenario: 删除字段提取
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'仪表盘配置字段提取'}" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

  @dashboard @cleanDashboard1
  Scenario: 删除事件操作
    Given open the "event.ListPage" page for uri "/event/action/"
    When the data name is "{'column':'1','name':'仪表盘测试事件列表'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除事件操作成功"

  @cleanDashboard1
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name    |
      | 仪表盘事件操作 |

  @cleanDashboard03
  Scenario: 删除全局时间 RZY-4570
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "OpenEdit" button to "enable"
    And I wait for "1000" millsecond
    And I move the mouse pointer to the "TimeName"
    And I click the "TimeName" button
    And I click the "deleteTimeTag" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button under some element
    Then I wait for "TimeName" will be invisible

  @cleanDashboard03
  Scenario Outline: 删除验证仪表盘全局时间趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name   |
      | 验证仪表盘全局时间 |

  @cleanDashboard03
  Scenario Outline: 删除报表
    When open the "report.ListPage" page for uri "/reports/"
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
#    And the data name is "{'column':'2','name':'<name>'}" then i click the "更多" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    And I wait for "EnsureButton" will be visible
    When I click the "EnsureButton" button
    And I wait for "Message" will be visible
    Then I wait for element "Message" change text to "删除成功"

    Examples:
      | name     |
      | 仪表盘保存为报表 |

  @cleanDashboard2
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name    |
      | 仪表盘关联搜索 |

  @cleanDashboard2
  Scenario Outline: 删除字段提取
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
#    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除成功"

    Examples:
      | name             |
      | 仪表盘关联搜索_workflow |
      | 仪表盘关联搜索_return   |
      | 仪表盘关联搜索_message  |

  @cleanDashboard2
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button in more menu
#    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name        |
      | 仪表盘workflow |
      | 仪表盘return   |
      | 仪表盘message  |
