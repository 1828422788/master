@knowledge @knowledgeSmoke
Feature: 知识分组（RZY-880）

  Background:
    Given open the "knowledge.ListPage" page for uri "/knowledge/"

  Scenario Outline: 修改标签
    Given the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "<Type>"
    And I choose the "<Type>" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"

    Examples:
      | name   | Type    |
      | sunxj1 | testTag |

