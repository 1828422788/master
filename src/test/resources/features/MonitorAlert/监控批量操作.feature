@alert @alert_multi

Feature: 监控批量操作

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible

  Scenario: 批量操作-新建有标签资源
    When I click the "CreateAlert" button
    Then I will see the "alert.CreatePage" page
    And I set the parameter "AlertName" with value "Test_Batch_Control_Resource_1"
    And I set the parameter "ResourceTagInput" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "SelectDropdown"
    And I set the parameter "SearchContent" with value "*"
    And I "unchecked" the label after "监控启用"
    And I set the parameter "TriggerInput" with value "5"
    And I set the parameter "TriggerLevel" with value "1"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"
    And I click the "EnsureButton" button
    And I wait for loading invisible
    And I will see the data "{'column':'1','name':'Test_Batch_Control_Resource_1'}" values "{'column':'7','name':'AutoTestTag'}"

  Scenario: 批量操作-新建无标签资源
    When I click the "CreateAlert" button
    Then I will see the "alert.CreatePage" page
    And I set the parameter "AlertName" with value "Test_Batch_Control_Resource_2"
    And I set the parameter "SearchContent" with value "*"
    And I "unchecked" the label after "监控启用"
    And I set the parameter "TriggerInput" with value "60"
    And I set the parameter "TriggerLevel" with value "100"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"
    And I click the "EnsureButton" button
    And I wait for loading invisible
    And I will see the data "{'column':'1','name':'Test_Batch_Control_Resource_2'}" values "{'column':'7','name':'无'}"

#    Examples: 创建资源成功
#      | AlertName                     | AlertRts    | SearchContent | AlertTrigger | AlertLevelInput | Result                   |
#      | Test_Batch_Control_Resource_1 | AutoTestTag | *             | 5            | 1               | success message "创建成功" |
#      | Test_Batch_Control_Resource_2 |             | *             | 60           | 100             | success message "创建成功" |


  Scenario: 批量操作-空操作
    When I click the "BatchControl" button
    And I wait for "SelectBatchOperation" will be visible
    And I click the "SelectBatchOperation" button
    And I click the "EnableResources" button
    Then I will see the message "请至少选择一个资源进行操作"
#
  Scenario: 批量操作-启用资源
    When I click the "BatchControl" button
    And I "checked" the checkbox in list which name is "Test_Batch_Control_Resource_1,Test_Batch_Control_Resource_2" in column "2"
    And I click the "SelectBatchOperation" button
    And I click the "EnableResources" button
    And I wait for "Modal" will be visible
    And I click the "Ensure" button
    And I wait for "100" millsecond
    Then I will see the success message "更新成功"
    And I wait for loading invisible
    Then I will see the element "{'column':'2','name':'Test_Batch_Control_Resource_2'}" is "open"
    And I will see the element "{'column':'2','name':'Test_Batch_Control_Resource_1'}" is "open"

  Scenario: 批量操作-添加资源标签
    When I click the "BatchControl" button
    And I "checked" the checkbox in list which name is "Test_Batch_Control_Resource_1,Test_Batch_Control_Resource_2" in column "2"
    And I click the "SelectBatchOperation" button
    And I click the "AddResourceTags" button
    And I wait for "Modal" will be visible
    And I set the parameter "Tag" with value "Multi_Add_Tag"
    And I choose the "Multi_Add_Tag" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "100" millsecond
    Then I will see the success message "更新成功"
    And I wait for loading invisible
    Then I will see the data "{'column':'2','name':'Test_Batch_Control_Resource_2'}" values "{'column':'8','name':'Multi_Add_Tag'}"
    And I will see the data "{'column':'2','name':'Test_Batch_Control_Resource_1'}" values "{'column':'8','name':'Multi_Add_Tag, AutoTestTag'}"

  Scenario: 批量操作-删除资源
    When I click the "BatchControl" button
    And I "checked" the checkbox in list which name is "Test_Batch_Control_Resource_1,Test_Batch_Control_Resource_2" in column "2"
    And I click the "SelectBatchOperation" button
    And I click the "DeleteResources" button
    And I wait for "Modal" will be visible
    And I click the "Ensure" button
    And I wait for "100" millsecond
    Then I will see the success message "删除成功"
    And I click the "CompleteBatchControl" button
