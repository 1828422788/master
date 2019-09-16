@all @smoke @configs @configsSmoke
Feature: 字段提取分组

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"

  Scenario Outline:
    When the data name is "主规则副本" then i click the "分组" button
    And I <group>
    And I click the "Ensure" button

    Examples:
      | group                                                  |
      | cancel selection "default_ParserRule" from the "Group" |

  Scenario: 验证分组搜索
    When I choose the "未分组" from the "GroupList"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'主规则副本'}"
    Then I will see the search result "{'column':'0','name':'RZY2868redirect主规则','contains':'no'}"
