@dataset @datasetBatchOperation
Feature: 数据集_11批量操作

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible

  Scenario: 批量操作-新建有标签资源
    When I click the "Create" button
    And I set the parameter "Name" with value "Test_Batch_Control_Resource_1"
    And I set the parameter "Alias" with value "bc1"
    And I set the parameter "Spl" with value "*"
    And I choose the "auto_ui" from the "TagField"
    And I click the "Ensure" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    And I click the "Return" button

  Scenario: 批量操作-新建有标签资源
    When I click the "Create" button
    And I set the parameter "Name" with value "Test_Batch_Control_Resource_2"
    And I set the parameter "Alias" with value "bc2"
    And I set the parameter "Spl" with value "*"
    And I click the "Ensure" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    And I click the "Return" button

  Scenario: 批量操作-新建有标签资源
    Then I will see the data "{'column':'0','name':'Test_Batch_Control_Resource_1'}" values "{'column':'2','name':'bc1'}"
    And the data name is "{'column':'0','name':'Test_Batch_Control_Resource_1'}" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............auto_ui"
    And the data name is "{'column':'0','name':'Test_Batch_Control_Resource_1'}" then I "close" the item

  Scenario: 批量操作-新建无标签资源
    Then I will see the data "{'column':'0','name':'Test_Batch_Control_Resource_2'}" values "{'column':'2','name':'bc2'}"
    And the data name is "{'column':'0','name':'Test_Batch_Control_Resource_2'}" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............无"

  Scenario: 批量操作-空操作
    When I click the "BatchControl" button
    And I choose the "添加资源标签" from the "BatchOperation"
    Then I will see the message "请至少选择一个资源进行操作"

  Scenario: 批量操作-添加资源标签
    And I set the parameter "TextFilter" with value "Test_Batch_Control_Resource"
    And I wait for loading invisible
    When I click the "BatchControl" button
    And I click the "SelectAll" button
    And I choose the "添加资源标签" from the "BatchOperation"
    And I choose the "字段统计" from the "TagField"
    When I click the "Ensure" button
    Then I will see the success message "更新成功"
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    And the data name is "Test_Batch_Control_Resource_1" then I "expand" the item
    And I will see the element "ExpandedRow" contains "字段统计"
    And I will see the element "ExpandedRow" contains "auto_ui"
    And the data name is "Test_Batch_Control_Resource_1" then I "close" the item
    And the data name is "Test_Batch_Control_Resource_2" then I "expand" the item
    And I will see the element "ExpandedRow" contains "字段统计"
    And the data name is "Test_Batch_Control_Resource_2" then I "close" the item

  Scenario: 批量操作-删除资源
    When I click the "BatchControl" button
    And I set the parameter "TextFilter" with value "Test_Batch_Control_Resource"
    And I wait for loading invisible
    And I click the "SelectAll" button
    And I choose the "删除" from the "BatchOperation"
    And I click the "Ensure" button
    Then I will see the success message "删除成功"