@knowledge @knowledgeSmoke @knowledge2
Feature: 知识分组（RZY-880）

  Background:
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Then I wait for loading invisible

  Scenario Outline: 修改标签
    When the data name is "<name>" then i click the "标签" button in more menu
    And I click the "TagInput" button
    And I wait for "1000" millsecond
    And I set the parameter "Tag" with value "<Type>"
    And I choose the "<Type>" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"

    Examples:
      | name | Type    |
      | 知识名  | testTag |

  Scenario: 验证标签修改成功
    When the data name is "知识名" then i will see "testTag" button

