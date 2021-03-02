@dataset @dataset_multi

Feature: 数据集批量操作

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible

  Scenario: 批量操作-新建有标签资源
    When I click the "Create" button
    And I set the parameter "Name" with value "Test_Batch_Control_Resource_1"
    And I set the parameter "Alias" with value "bc1"
    And I set the parameter "Spl" with value "*"
    And I set the parameter "resourceTagInput" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Save" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    And I click the "backList" button
    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'Test_Batch_Control_Resource_1'}" values "{'column':'2','name':'bc1'}"
    And I will see the data "{'column':'0','name':'Test_Batch_Control_Resource_1'}" values "{'column':'6','name':'AutoTestTag'}"

  Scenario: 批量操作-新建无标签资源
    When I click the "Create" button
    And I set the parameter "Name" with value "Test_Batch_Control_Resource_2"
    And I set the parameter "Alias" with value "bc2"
    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    And I click the "backList" button
    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'Test_Batch_Control_Resource_2'}" values "{'column':'2','name':'bc2'}"
    And I will see the data "{'column':'0','name':'Test_Batch_Control_Resource_2'}" values "{'column':'6','name':'无'}"

#    Examples: 新建成功
#      | name                          | alias | Spl | resourceTag |
#      | Test_Batch_Control_Resource_1 | bc1   | *   | AutoTestTag |
#      | Test_Batch_Control_Resource_2 | bc2   | *   |             |


  Scenario: 批量操作-空操作
    When I click the "BatchControl" button
    And I wait for "SelectBatchOperation" will be visible
    And I click the "SelectBatchOperation" button
    And I click the "AddResourceTags" button
    Then I will see the message "请至少选择一个资源进行操作"

  Scenario: 批量操作-添加资源标签
    When I click the "BatchControl" button
    And I "checked" the checkbox in list which name is "Test_Batch_Control_Resource_1,Test_Batch_Control_Resource_2" in column "1"
    And I click the "SelectBatchOperation" button
    And I click the "AddResourceTags" button
    And I wait for "Modal" will be visible
    And I set the parameter "Tag" with value "Multi_Add_Tag"
    And I choose the "Multi_Add_Tag" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "100" millsecond
    Then I will see the success message "更新成功"
    And I wait for loading invisible
    Then I will see the data "{'column':'1','name':'Test_Batch_Control_Resource_1'}" values "{'column':'7','name':'Multi_Add_Tag,AutoTestTag'}"
    And I will see the data "{'column':'1','name':'Test_Batch_Control_Resource_2'}" values "{'column':'7','name':'Multi_Add_Tag'}"

  Scenario: 批量操作-删除资源
    When I click the "BatchControl" button
    And I "checked" the checkbox in list which name is "Test_Batch_Control_Resource_1,Test_Batch_Control_Resource_2" in column "1"
    And I click the "SelectBatchOperation" button
    And I click the "DeleteResources" button
    And I wait for "Modal" will be visible
    And I click the "Ensure" button
    And I wait for "100" millsecond
    Then I will see the success message "删除成功"
    And I click the "CompleteBatchControl" button
