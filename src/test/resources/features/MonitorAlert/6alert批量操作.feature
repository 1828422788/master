@bvtalert @alertcase @alertbatch
Feature: alert批量操作

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"
    Given I wait for loading complete

  @alertbatch0
  Scenario Outline:  alert批量操作-新建
    And I set the parameter "SearchInputName" with value "<name>"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'<name>'}" then i click the "复制" button in more menu

    And I set the parameter "SearchInputName" with value "<name>(副本)"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'<name>(副本)'}" then i click the "编辑" button

    Then I will see the "alert.CreatePage" page
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I set the parameter "AlertName" with value "<newName>"

    When I click the "SaveButton" button

    Examples:
      | name                                | newName             |
      | api00_all_事件数_扩展chart_all_sample_合并 | test删除_事件计数_设备切分ip1 |
      | api00_all_事件数_扩展chart_all_sample_合并 | test删除_事件计数_设备切分ip2 |


  @alertbatch1
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

  @alertbatch2
  Scenario:  alert批量操作-启动
    When I click the "BatchControl" button
    When I set the parameter "searchInputName" with value "test删除_事件计数_设备切分ip"
    Given I wait for loading complete
    And I wait for "2000" millsecond

    When I click the "AllSelectCheckbox" button
    And I click the "SelectBatchOperation" button
    Given I wait for loading complete

    And I wait for "2000" millsecond
    And I click the "MultiStart" button
#    Then I will see the text "确定启用 3 个资源" exist in page
    And I click the "Ensure" button
#    And I wait for "SuccessMessage" will be visible
#    Then I will see the success message "更新成功"

  @alertbatch3
  Scenario Outline:  alert批量操作-启动-验证
    When I set the parameter "searchInputName" with value "<name>"
    Given I wait for loading complete
    And I wait for "2000" millsecond
#    Then I will see the switch button "switchOne" is "enable"
    Then I will see the element "{'column':'1','name':'<name>'}" is "open"

    Examples:
      | name                |
      | test删除_事件计数_设备切分ip1 |
      | test删除_事件计数_设备切分ip2 |

  @alertbatch4
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
    And I choose the "autoui001" from the "ResourceGroupList"
    And I wait for "2000" millsecond

    When I click the "Ensure" button
#    And I wait for "100" millsecond
#    Then I will see the success message "更新成功"
    And I wait for "5000" millsecond

  @alertbatch5
  Scenario Outline:  alert批量操作-添加资源标签-验证
    And I set the parameter "SearchInputName" with value "<name>"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'<name>'}" then I "expand" the item
    And I wait for "2000" millsecond
    And I will see the element "TagOfTheLastItem" contains "autoui001"
    And the data name is "{'column':'1','name':'<name>'}" then I "close" the item

    Examples:
      | name                |
      | test删除_事件计数_设备切分ip1 |
      | test删除_事件计数_设备切分ip2 |

  @alertbatch6
  Scenario:  alert批量操作-删除
    When I click the "BatchControl" button
    And I set the parameter "SearchInputName" with value "test删除_事件计数_设备切分ip"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    When I click the "allSelectCheckbox" button
#    Then I will see the text "test删除_事件计数_设备切分ip" exist in page
    And I click the "SelectBatchOperation" button
    And I click the "DeleteResources" button
    And I click the "Ensure" button
    And I wait for "100" millsecond
    Then I will see the success message "删除成功"
    And I click the "CompleteBatchControl" button

  @alertbatch7
  Scenario Outline:  alert批量操作-删除-验证
    And I set the parameter "SearchInputName" with value "<name>"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    Then I will see the text "<name>" is not existed in page

    Examples:
      | name                |
      | test删除_事件计数_设备切分ip1 |
      | test删除_事件计数_设备切分ip2 |

