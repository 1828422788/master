@all @timedTask @timedTaskMulti
Feature: 定时任务批量操作

  Scenario Outline: create_schedule
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart  | stats count()"
    And I click the "DateEditor" button under some element
    And I click the "Today" button
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "TaskName" with value "<name>"
    And I set the parameter "Period" with value "5"
    And I choose the "分钟" from the "ExecuteTime"
    And I set the parameter "StartTimeInput" with value "23:59:00"
    And I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"

  Examples:
    |   name          |
    |  test_multi_1   |
    |  test_multi_2   |
    |  test_multi_3   |

  Scenario: multi_tag
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading complete
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for "2000" millsecond
    And I wait for "BatchControl" will be visible
    And I click the "BatchControl" button under some element
    And I click the "SelectAll" button
    And I click the "SelectBatchOperation" button under some element
    And I click the "AddResourceTags" button
    And I wait for "Ensure" will be visible
    And I choose the "auto_package" from the "TagField"
    And I click the "TagPanel" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    And I wait for loading complete
    And I click the "CompleteBatchControl" button under some element

  Scenario: verify_tag
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading complete
    And I wait for "BatchControl" will be visible
    And the data name is "{'column':'1','name':'test_multi_1'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And the data name is "{'column':'1','name':'test_multi_1'}" then I "close" the item

    And the data name is "{'column':'1','name':'test_multi_2'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And the data name is "{'column':'1','name':'test_multi_2'}" then I "close" the item

    And the data name is "{'column':'1','name':'test_multi_3'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And the data name is "{'column':'1','name':'test_multi_3'}" then I "close" the item

  Scenario: switch_off
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading complete
    And I wait for "BatchControl" will be visible
    And the data name is "{'column':'1','name':'test_multi_1'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible

    And the data name is "{'column':'1','name':'test_multi_2'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible

    And the data name is "{'column':'1','name':'test_multi_3'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    
  Scenario: multi_switch
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading complete
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for "2000" millsecond
    And I wait for "BatchControl" will be visible
    And I click the "BatchControl" button under some element
    And I click the "SelectAll" button
    And I click the "SelectBatchOperation" button under some element
    And I click the "EnableResources" button
    And I wait for "Ensure" will be visible
    And I will see the message "确定启用 3 个资源"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    And I wait for loading complete
    And I click the "Finish" button under some element

  Scenario: verify_switch
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading complete
    And I wait for "BatchControl" will be visible
    When the data name is "{'column':'1','name':'test_multi_1'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'test_multi_2'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'test_multi_3'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"


  Scenario: multi_delete
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading complete
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for "2000" millsecond
    And I wait for "BatchControl" will be visible
    And I click the "BatchControl" button under some element
    And I click the "SelectAll" button
    And I click the "SelectBatchOperation" button under some element
    And I click the "DeleteResources" button
    And I wait for "Ensure" will be visible
    Then I will see the message "您选中的 3 个资源将被删除，是否继续？"
    And I click the "Cancel" button
    When the data name is "{'column':'2','name':'test_multi_3'}" then i click the "删除" button in more menu
    And I click the "Ensure" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    And I click the "SelectBatchOperation" button under some element
    And I click the "DeleteResources" button
    And I wait for "Ensure" will be visible
    Then I will see the message "您选中的 2 个资源将被删除，是否继续？"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    And I wait for loading complete
    And I click the "Finish" button under some element

  Scenario: verify_delete
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading complete
    And I wait for "BatchControl" will be visible
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible

  Scenario Outline: prompt
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading complete
    And I wait for "BatchControl" will be visible
    And I click the "BatchControl" button under some element
    And I click the "SelectBatchOperation" button under some element
    And I click the "<button>" button
    And I wait for "Ensure" will be visible
    Then I will see the message "请至少选择一个资源进行操作"

    Examples:
      | button          |
      | DeleteResources |
      | AddResourceTags |
      | EnableResources |