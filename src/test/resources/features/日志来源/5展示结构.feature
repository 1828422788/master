@resourceGroups @all @smoke @resourceGroupsSmoke
Feature: 日志来源展示结构

  Scenario Outline: 层级结构-展示（RZY-375）
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I click the "ArrowDown" button
    Then I will see the "<nodeName>" node is "<attribute>"

    Examples:
      | nodeName | attribute |
      | temptest | disabled  |

  Scenario: 新增子节点（RZY-378步骤1）
    Given open the "sourceGroup.StructurePage" page for uri "/sources/sourcegroups/structure/"
    When I click the "AutoTestLogSource" button
    And I click the "AddSubSourceButton" button
    And I set the parameter "SourceName" with value "subSource"
    And I choose the "default_SourceGroup" from the "SourceGroup"
    And I click the "SaveButton" button
    Then I will see the success message "创建成功"

  Scenario: 修改父层级（RZY-378步骤2）
    Given open the "sourceGroup.StructurePage" page for uri "/sources/sourcegroups/structure/"
    And I click the "SubSource" button
    And I choose the "sunxjautotest" from the "FatherSource"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"
    And I click the "EnsureButton" button
    And I refresh the website
    And I will see the element "EditSubSource" name is "subSource"

  Scenario: 层级关系验证（RZY-378步骤4）
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    When the data name is "subSource" then i click the "编辑" button
    Then I will see the "sourceGroup.CreatePage" page
    And I set the parameter "Tag" with value "*"
    And I click the "EnsureCreateButton" button
    Then I will see the success message "更新成功"
    And open the "sourceGroup.StructurePage" page for uri "/sources/sourcegroups/structure/"
    Then I will see the element "EditSubSource" name is "subSource"

  Scenario: 删除节点（RZY-378步骤3）
    Given open the "sourceGroup.StructurePage" page for uri "/sources/sourcegroups/structure/"
    And I click the "SubSource" button
    And I click the "DeleteSubSourceButton" button
    And I click the "EnsureButton" button
    Then I will see the message "删除成功"