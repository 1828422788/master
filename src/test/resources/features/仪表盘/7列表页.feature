#@dashboard
Feature: 仪表盘设为/取消默认（RZY-211）

  Scenario:页签管理（RZY-215）
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the "ChartYeQian" button
    And I wait for "1000" millsecond
    Then I wait for "FiveOnePage" will be visible
    Then I wait for "FiftyOnePage" will be visible
    And I click the "FiftyOnePage" button
    And I wait for "1000" millsecond
    Then I wait for element "ChartYeQian" change text to "50 条/页"



