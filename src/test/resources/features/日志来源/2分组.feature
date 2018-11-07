@resourceGroups @all @smoke @resourceGroupsSmoke
Feature: 日志来源分组

  Background:
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "分组" button
    Then I cancel selection "<group>" from the "GroupInput"
    And I click the "EnsureButton" button
    Then I will see the error message "<errorMsg>"
    Then I click the "Ensure" button
    And I choose the "<group>" from the "GroupInput"
    Then I click the "EnsureButton" button
    Then I will see the success message "<successMsg>"

    Examples:
      | name        | group               | errorMsg  | successMsg |
      | sxjautotest | default_SourceGroup | 来源分组 不能为空 | 保存成功       |