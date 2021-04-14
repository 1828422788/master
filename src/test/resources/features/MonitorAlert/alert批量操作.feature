@bvtalert @alertcase
Feature: alert批量操作

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"
    Given I wait for loading complete

  @multiOperate1
  Scenario Outline:  alert批量操作空操作
    When I click the "BatchControl" button
    And I wait for "2000" millsecond
    And I wait for "SelectBatchOperation" will be visible
    And I click the "SelectBatchOperation" button
#    And I click the "MultiChooseButton" button
    When I click the "<btn>" button
    Then I will see the text "请至少选择一个资源进行操作" exist in page

    Examples:
      | btn                 |
      | MultiStart          |
      | MultiAddResourceTag |
      | MultiDelete         |

  @multiOperate2
  Scenario:  alert批量操作-启动
    When I click the "BatchControl" button
    When I set the parameter "searchInputName" with value "test删除_事件计数_设备切分ip"
    And I wait for "2000" millsecond

    When I click the "allSelectCheckbox" button
    And I click the "SelectBatchOperation" button
    Given I wait for loading complete

    And I wait for "2000" millsecond
    And I click the "MultiStart" button
#    Then I will see the text "确定启用 3 个资源" exist in page
    And I click the "Ensure" button
#    And I wait for "SuccessMessage" will be visible
#    Then I will see the success message "更新成功"

  Scenario:  alert批量操作-启动-验证
    When I set the parameter "searchInputName" with value "test删除_事件计数_设备切分ip"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    Then I will see the switch button "switchOne" is "enable"

  Scenario:  alert批量操作-添加资源标签
    When I click the "BatchControl" button
    And I set the parameter "searchInputName" with value "test删除_事件计数_设备切分ip"
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

  Scenario:  alert批量操作-添加资源标签-验证
    Given open the "dataset.ListPage" page for uri "/dataset/"
    Given I wait for loading complete
    And I set the parameter "SearchInputName" with value "Test_Batch_Control_Resource"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And the data name is "{'column':'0','name':'test删除_事件计数_设备切分ip1'}" then I "expand" the item
    And I wait for "2000" millsecond
    And I will see the element "TagOfTheLastItem" contains "AutoTest"
    And the data name is "{'column':'0','name':'test删除_事件计数_设备切分ip1'}" then I "close" the item

    And I wait for "2000" millsecond
    And the data name is "{'column':'0','name':'test删除_事件计数_设备切分ip2'}" then I "expand" the item
    And I wait for "2000" millsecond
    And I will see the element "TagOfTheLastItem" contains "AutoTest"
    And the data name is "{'column':'0','name':'test删除_事件计数_设备切分ip2'}" then I "close" the item

  Scenario:  alert批量操作-删除
    When I click the "BatchControl" button
    And I set the parameter "SearchInputName" with value "test删除_事件计数_设备切分ip"
    When I click the "allSelectCheckbox" button
#    Then I will see the text "test删除_事件计数_设备切分ip" exist in page
    And I click the "SelectBatchOperation" button
    And I click the "DeleteResources" button
    And I click the "Ensure" button
    And I wait for "100" millsecond
    Then I will see the success message "删除成功"
    And I click the "CompleteBatchControl" button

  Scenario:  alert批量操作-删除-验证
    And I set the parameter "SearchInputName" with value "test删除_事件计数_设备切分ip"
    And I wait for "3000" millsecond
    Then I will see the text "test删除_事件计数_设备切分ip1" is not existed in page





