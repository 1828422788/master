@knowledge @knowledgeSmoke @knowledge2
Feature: 知识分组（RZY-880）

  Background:
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Then I wait for loading invisible

  Scenario Outline: 修改标签
    When the data name is "<name>" then i click the "标签" button in more menu
    And I choose the new value "<Type>" from the "TagField"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"

    Examples:
      | name | Type    |
      | 知识名  | testTag |

  Scenario: 验证标签修改成功
    When the data name is "知识名" then I "expand" the item
    Then I will see the element "ExpandedRow" contains "资源标签..............testTag"

