@dashboard @dashboardBatchOperation
Feature: 仪表盘07批量操作

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  Scenario: 批量操作-新建有标签资源
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "Test_Batch_Control_Resource_1"
    And I choose the "AutoTest" from the "TagField"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    And I set the parameter "TextFilter" with value "Test_Batch_Control_Resource_1"
    And I wait for loading invisible
    And the data name is "Test_Batch_Control_Resource_1" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............AutoTest"

  Scenario: 批量操作-新建无标签资源
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "Test_Batch_Control_Resource_2"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    And I set the parameter "TextFilter" with value "Test_Batch_Control_Resource_2"
    And I wait for loading invisible
    And the data name is "Test_Batch_Control_Resource_2" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............无"

  Scenario: 批量操作-空操作
    When I click the "BatchControl" button
    And I choose the "添加资源标签" from the "BatchOperation"
    Then I will see the message contains "请至少选择一个资源进行操作"

  Scenario: 批量操作-添加资源标签
    And I set the parameter "TextFilter" with value "Test_Batch_Control_Resource"
    And I wait for loading invisible
    When I click the "BatchControl" button
    And I click the "SelectAll" button
    And I choose the "添加资源标签" from the "BatchOperation"
    And I choose the "auto_package" from the "TagField"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Complete" button
    And the data name is "Test_Batch_Control_Resource_2" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............auto_package"
    And the data name is "Test_Batch_Control_Resource_2" then I "close" the item
    And the data name is "Test_Batch_Control_Resource_1" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............auto_package, AutoTest"
    And the data name is "Test_Batch_Control_Resource_1" then I "close" the item

  Scenario: 批量操作-删除资源
    And I set the parameter "TextFilter" with value "Test_Batch_Control_Resource_"
    And I wait for loading invisible
    When I click the "BatchControl" button
    And I click the "SelectAll" button
    And I choose the "删除" from the "BatchOperation"
    And I click the "Ensure" button
    Then I will see the success message "删除成功"