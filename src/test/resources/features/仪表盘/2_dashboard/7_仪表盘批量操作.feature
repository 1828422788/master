@dashboard @dashboard_multi @dashboard07
Feature: 仪表盘07批量操作

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  Scenario: 批量操作-新建有标签资源
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "Test_Batch_Control_Resource_1"
    And I click the "ResourceInput" button
    And I wait for "1000" millsecond
    And I set the parameter "ResourceTagInput" with value "AutoTestTag"
    And I wait for "500" millsecond
    And I choose the "AutoTestTag" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"
    And I refresh the website
    And I set the parameter "SearchInput" with value "Test_Batch_Control_Resource_1"
    And I wait for loading invisible
    And I click the dashboard icon which name is "Test_Batch_Control_Resource_1"
    Then I will see the text "资源标签..............AutoTestTag" exist in page

  Scenario: 批量操作-新建无标签资源
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "Test_Batch_Control_Resource_2"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"
    And I refresh the website
    And I set the parameter "SearchInput" with value "Test_Batch_Control_Resource_2"
    And I wait for loading invisible
    And I click the dashboard icon which name is "Test_Batch_Control_Resource_2"
    Then I will see the text "资源标签..............无" exist in page


  Scenario: 批量操作-空操作
    When I click the "BatchControl" button
    And I wait for "SelectBatchOperation" will be visible
    And I click the "SelectBatchOperation" button
    And I click the "AddResourceTags" button
    And I wait for "Message" will be visible
    Then I will see the message contains "请至少选择一个资源进行操作"

  Scenario: 批量操作-添加资源标签
    And I set the parameter "SearchInput" with value "Test_Batch_Control_Resource"
    And I wait for "Loading" will be invisible
    When I click the "BatchControl" button
    And I click the "ListItemOne" button
    And I wait for "1000" millsecond
    And I click the "ListItemTwo" button
    And I click the "SelectBatchOperation" button
    And I click the "AddResouceTag" button
    And I click the "TagToInput" button
    And I wait for "1000" millsecond
    And I set the parameter "MultiInputTag" with value "auto_package"
    And I wait for "500" millsecond
    And I choose the "auto_package" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    And I wait for "SuccessMessage" will be invisible
    And I click the dashboard icon which name is "Test_Batch_Control_Resource_2"
    Then I will see the text "资源标签..............auto_package" exist in page
    And I click the dashboard icon which name is "Test_Batch_Control_Resource_1"
    Then I will see the text "资源标签..............auto_package, AutoTestTag" exist in page
#
  Scenario: 批量操作-删除资源
    And I set the parameter "SearchInput" with value "Test_Batch_Control_Resource"
    And I wait for "Loading" will be invisible
    When I click the "BatchControl" button
    And I click the "ListItemOne" button
    And I wait for "1000" millsecond
    And I click the "ListItemTwo" button
    And I click the "SelectBatchOperation" button
    And I click the "DeleteResources" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"