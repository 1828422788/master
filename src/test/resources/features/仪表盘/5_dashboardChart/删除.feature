@cleanDashboard @cleanDashboardChart
Feature: 仪表盘图表删除

  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name             |
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


  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
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

  Scenario: 删除创建的下载任务
    Given open the "ListPageFactory" page for uri "/download/"
    And I wait for loading invisible
    And the data name contains "汉字Abc" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

