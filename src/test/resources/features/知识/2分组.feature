@knowledge @knowledgeSmoke
Feature: 知识分组（RZY-880）

  Background:
    Given open the "knowledge.ListPage" page for uri "/knowledge/"

  Scenario Outline: 修改标签
    Given the data name is "<name>" then i click the "标签" button in more menu
    And I set the parameter "Tag" with value "<Type>"
    And I choose the "<Type>" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"

    Examples:
      | name | Type    |
      | 知识名  | testTag |

  Scenario: 验证标签修改成功
    When the data name is "知识名" then i will see "testTag" button

