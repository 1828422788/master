@fulllink @fulllinkMulti
Feature: 全链路_批量操作

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for loading invisible

  Scenario Outline: 创建全链路
    When I click the "Create" button
    And I set the parameter "Name" with value "<name>"
    And I click the "Ensure" button
    And I will see the element "SuccessMessage" contains "创建成功"

  Examples:
    |   name          |
    |  test_multi_1   |
    |  test_multi_2   |
    |  test_multi_3   |

  Scenario: 添加资源标签
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for loading invisible
    And I click the "BatchControl" button
    And I click the "SelectAll" button
    And I choose the "添加资源标签" from the "BatchOperation"
    And I choose the "auto_package" from the "TagField"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    And I wait for loading invisible
    And I click the "Complete" button

  Scenario: 验证标签
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for loading invisible
    Then I will see the data "test_multi_1" values "{'column':'4','name':'auto_package'}"
    Then I will see the data "test_multi_2" values "{'column':'4','name':'auto_package'}"
    Then I will see the data "test_multi_3" values "{'column':'4','name':'auto_package'}"

  Scenario: 批量删除
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for loading invisible
    And I click the "BatchControl" button
    And I click the "SelectAll" button
    And I choose the "删除" from the "BatchOperation"
    Then I will see the message "您选中的 3 个资源将被删除，是否继续？"
    And I click the "Cancel" button
    When the data name is "{'column':'1','name':'test_multi_3'}" then i click the "删除" button in more menu
    Then I will see the message "确认删除 [test_multi_3] ?"
    When I click the "Ensure" button
    Then I will see the success message "删除成功"
    And I wait for "SuccessMessage" will be invisible
    And I choose the "删除" from the "BatchOperation"
    Then I will see the message "您选中的 2 个资源将被删除，是否继续？"
    When I click the "Ensure" button
    Then I will see the success message "删除成功"
    And I wait for loading invisible
    And I click the "Complete" button

  Scenario: 验证删除
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for loading invisible
    Then I wait for "NoData" will be visible

  Scenario Outline: 提示
    And I click the "BatchControl" button
    And I choose the "<button>" from the "BatchOperation"
    Then I will see the message "请至少选择一个资源进行操作"

  Examples:
    | button        |
    | 删除          |
    | 添加资源标签  |