@clearDashboard
Feature: 仪表盘删除

  Scenario Outline: 删除趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name               |
      | 验证仪表盘全局时间 |
      | 行布局趋势图1      |
      | 行布局趋势图2      |
      | 行布局趋势图3      |

  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name           |
      | FirstAutoTest  |
      | UI自动化创建   |
      | 仪表盘行布局   |
      | 仪表盘行布局1  |
      | 仪表盘行布局2  |
      | 仪表盘行布局3  |
      | 仪表盘行布局4  |
      | 仪表盘行布局5  |
      | 仪表盘行布局6  |
      | 仪表盘行布局7  |
      | 仪表盘行布局51 |
      | 仪表盘行布局52 |
      | 仪表盘行布局53 |

  Scenario Outline: 删除报表
    When open the "report.ListPage" page for uri "/reports/"
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    When I click the "Ensure" button
    And I wait for element "Message" change text to "删除成功"

    Examples:
      | name             |
      | 仪表盘保存为报表 |