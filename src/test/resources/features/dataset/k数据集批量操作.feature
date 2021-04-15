@dataset @dataset_multi @datasetk

Feature: 数据集批量操作

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"
    Given I wait for loading complete

  @datasetk1
  Scenario: 批量操作-新建有标签资源
    When I click the "Create" button
    And I set the parameter "Name" with value "Test_Batch_Control_Resource_1"
    And I set the parameter "Alias" with value "bc1"
    And I set the parameter "Spl" with value "*"
    And I choose the "auto_package" from the "resourceGroupList"
    And I wait for "2000" millsecond

    And I click the "Save" button
    Then I will see the "dataset.DetailPage" page
    Given I wait for loading complete
    And I click the "backList" button

  @datasetk2
  Scenario: 批量操作-新建有标签资源
    When I click the "Create" button
    And I set the parameter "Name" with value "Test_Batch_Control_Resource_2"
    And I set the parameter "Alias" with value "bc2"
    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    Then I will see the "dataset.DetailPage" page
    Given I wait for loading complete
    And I click the "backList" button
    Given I wait for loading complete

  @datasetk3
  Scenario: 批量操作-新建有标签资源
    And I set the parameter "SearchInputName" with value "Test_Batch_Control_Resource_1"
    And I wait for "2000" millsecond
    Then I will see the data "{'column':'0','name':'Test_Batch_Control_Resource_1'}" values "{'column':'2','name':'bc1'}"
    And the data name is "{'column':'0','name':'Test_Batch_Control_Resource_1'}" then I "expand" the item
    And I wait for "2000" millsecond
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And the data name is "{'column':'0','name':'Test_Batch_Control_Resource_1'}" then I "close" the item

  @datasetk4
  Scenario: 批量操作-新建无标签资源
    And I set the parameter "SearchInputName" with value "Test_Batch_Control_Resource_2"
    And I wait for "2000" millsecond
    Then I will see the data "{'column':'0','name':'Test_Batch_Control_Resource_2'}" values "{'column':'2','name':'bc2'}"

  @datasetk5
  Scenario: 批量操作-空操作
    When I click the "BatchControl" button
    And I wait for "SelectBatchOperation" will be visible
    And I click the "SelectBatchOperation" button
    And I click the "AddResourceTags" button
    Then I will see the message "请至少选择一个资源进行操作"

  @datasetk6
  Scenario: 批量操作-添加资源标签
    When I click the "BatchControl" button
    And I set the parameter "SearchInputName" with value "Test_Batch_Control_Resource"
    Given I wait for loading complete
    And I wait for "2000" millsecond

    When I click the "allSelectCheckbox" button
    And I click the "SelectBatchOperation" button
    Given I wait for loading complete

    When I click the "AddResourceTags" button
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I choose the "AutoTest" from the "ResourceGroupList"
    And I wait for "2000" millsecond

    When I click the "Ensure" button
#    And I wait for "100" millsecond
#    Then I will see the success message "更新成功"
    And I wait for "5000" millsecond

    Given open the "dataset.ListPage" page for uri "/dataset/"
    Given I wait for loading complete
    And I set the parameter "SearchInputName" with value "Test_Batch_Control_Resource"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And the data name is "{'column':'0','name':'Test_Batch_Control_Resource_1'}" then I "expand" the item
    And I wait for "2000" millsecond
    And I will see the element "TagOfTheLastItem" contains "AutoTest"
    And the data name is "{'column':'0','name':'Test_Batch_Control_Resource_1'}" then I "close" the item

    And I wait for "2000" millsecond
    And the data name is "{'column':'0','name':'Test_Batch_Control_Resource_2'}" then I "expand" the item
    And I wait for "2000" millsecond
    And I will see the element "TagOfTheLastItem" contains "AutoTest"
    And the data name is "{'column':'0','name':'Test_Batch_Control_Resource_2'}" then I "close" the item

  @datasetk7
  Scenario: 批量操作-删除资源
    When I click the "BatchControl" button
    And I set the parameter "SearchInputName" with value "Test_Batch_Control_Resource"
    When I click the "allSelectCheckbox" button

    And I click the "SelectBatchOperation" button
    And I click the "DeleteResources" button
    And I click the "Ensure" button
    And I wait for "100" millsecond
    Then I will see the success message "删除成功"
    And I click the "CompleteBatchControl" button
