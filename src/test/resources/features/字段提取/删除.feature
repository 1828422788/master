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
      | name             |
      | AutoTestForTrend |
      | RZY-2861         |

#  Scenario: 删除agent配置
#    Given open the "agent.CreatePage" page for uri "/sources/input/agent/"
#    And I click the detail which name is "{'name':'192.168.1.134','column':'1'}"
#    And switch to another window
#    And the data name is "date" then i click the "删除" button