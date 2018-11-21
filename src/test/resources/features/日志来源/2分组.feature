@resourceGroups @all @smoke @resourceGroupsSmoke
Feature: 日志来源分组

  Background:
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "分组" button
    Then I <group>
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

    Examples:
      | name        | group                                                        |
      | sxjautotest | cancel selection "default_SourceGroup" from the "GroupInput" |
      | sxjautotest | choose the "default_SourceGroup" from the "GroupInput"       |

