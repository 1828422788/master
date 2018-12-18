Feature: 知识分组（RZY-880）

  Background:
    Given open the "knowledge.ListPage" page for uri "/knowledge/"

  @knowledge
  Scenario Outline:
    Given the data name is "<name>" then i click the "分组" button
    And I choose the "<Type>" from the "GroupComboBox"
    And I click the "Ensure" button
    Then I will see the <Result>

  @all @smoke
    Examples:
      | name   | Type                    | Result                 |
      | sunxj1 | AutoTestWithAllResource | success message "保存成功" |
