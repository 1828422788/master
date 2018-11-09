@report @all @smoke @reportSmoke
Feature: 报表分组

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline:
    When the data name is "<name>" then i click the "分组" button
    And I cancel selection "<group>" from the "ChangeGroup"
    And I click the "Ensure" button
    And I will see the success message "至少选择一个报表分组"
    And I wait for "SuccessMessage" will be invisible
    And I choose the "<newGroup>" from the "ChangeGroup"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | name        | group          | newGroup                               |
      | sxjautotest | default_Report | default_Report,AutoTestWithAllResource |