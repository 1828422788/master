@trend @acceleration @accelerationVerify
Feature: 趋势图加速_8验证命中加速

  Scenario Outline: 验证命中加速
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "AccelerationManagement" button
    When I will see the "trend.AccelerationPage" page
    And I wait for loading invisible
    Then I will see the text "<name>" exist in page

  Examples:
    | name                |
    | 仪表盘引用趋势图    |
    | 报表引用趋势图_预览 |
    | 仪表盘引用趋势图    |
    | 报表引用趋势图_执行 |

  @trendSmoke @accelerationSmoke
  Examples:
    | name                |
    | 趋势图加速_1天      |