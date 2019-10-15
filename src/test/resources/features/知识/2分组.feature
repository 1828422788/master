@knowledge @knowledgeSmoke
Feature: 知识分组（RZY-880）

  Background:
    Given open the "knowledge.ListPage" page for uri "/knowledge/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "标签" button
    And I set the parameter "TagInput" with value "<Type>"
    And I click the "Ensure" button
    Then I will see the <Result>

    Examples:
      | name     | Type     | Result                 |
      | 名称1, 名称2 | TestTag | success message "保存成功" |
