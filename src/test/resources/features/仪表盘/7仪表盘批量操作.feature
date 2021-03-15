@dashboard @dashboard_multi

Feature: 仪表盘批量操作

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
    And I wait for loading invisible
    And I click the dashboard icon which name is "Test_Batch_Control_Resource_1"
    Then I will see the text "资源标签..............AutoTestTag" exist in page
#    Then I will see the data "{'column':'0','name':'Test_Batch_Control_Resource_1'}" values "{'column':'5','name':'AutoTestTag'}"

  Scenario: 批量操作-新建无标签资源
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "Test_Batch_Control_Resource_2"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"
    And I wait for loading invisible
    And I click the dashboard icon which name is "Test_Batch_Control_Resource_2"
    Then I will see the text "资源标签..............无" exist in page
#    Then I will see the data "{'column':'0','name':'Test_Batch_Control_Resource_2'}" values "{'column':'5','name':''}"

#    Examples: 新建成功
#      | name                          | resourceTag |
#      | Test_Batch_Control_Resource_1 | AutoTestTag |
#      | Test_Batch_Control_Resource_2 |             |


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
    And I click the dashboard icon which name is "Test_Batch_Control_Resource_2"
    Then I will see the text "资源标签..............Multi_Add_Tag" exist in page
    And I click the dashboard icon which name is "Test_Batch_Control_Resource_1"
    Then I will see the text "资源标签..............Multi_Add_Tag, AutoTestTag" exist in page
#    Then I will see the data "{'column':'1','name':'Test_Batch_Control_Resource_2'}" values "{'column':'6','name':'Multi_Add_Tag'}"
#    And I will see the data "{'column':'1','name':'Test_Batch_Control_Resource_1'}" values "{'column':'6','name':'Multi_Add_Tag, AutoTestTag'}"

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
