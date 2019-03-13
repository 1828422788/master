@all @smoke @configs
Feature: 字段提取删除

  Scenario Outline:
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

  @configsSmoke
    Examples:
      | name        |
      | AutoTest    |
      | AutoTest(1) |

  @clean
    Examples:
      | name              |
      | AutoTestForTrend  |
      | RZY-2866搜索页结果验证   |
      | RZY-2861新建字段提取    |
      | redirect主规则       |
      | RZY2864在搜索页验证严格解析 |
      | redirect副规则       |
      | 脱敏                |
      | return            |
      | message           |
      | workflow          |

  @clean
  Scenario: 删除agent配置
    Given open the "agent.CreatePage" page for uri "/sources/input/agent/"
    And I click the detail with properties "{'name':'rizhiyi_server_host','column':'1'}"
    And switch to another window
    And the data name is "date" then i click the "删除" button
    Then I click the "Ensure" button