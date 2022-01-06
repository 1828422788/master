@clearDashboardDrillDown
Feature: 仪表盘删除

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  @cleandashboard0429
  Scenario Outline: 删除仪表盘
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    Given I wait for loading complete
    And I wait for "3000" millsecond
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 测试钻取变量   |

  @cleandbdrilldown38
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    Given I wait for loading complete
    And I wait for "3000" millsecond
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 钻取跳转   |
      | 测试钻取配置 |

  @cleandbdrilldown38
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    Given I wait for loading complete
    And I wait for "3000" millsecond
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name    |
      | 测试标签钻取  |
      | 仪表盘钻取配置 |

  @cleanDashboard39
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    Given I wait for loading complete
    And I wait for "3000" millsecond
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 钻取配置二   |

  @cleanDashboard39
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    Given I wait for loading complete
    And I wait for "3000" millsecond
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name    |
      | 钻取配置1 |