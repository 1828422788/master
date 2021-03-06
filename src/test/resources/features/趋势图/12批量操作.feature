@trend @trendMulti
Feature: 趋势图批量操作

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible

  Scenario Outline: 新建趋势图-3个
    Then I click the "NewTrendButton" button
    And I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() by apache.status,apache.geo.city"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "3000" millsecond
    And I click the "NextButton" button
    And I wait for "2000" millsecond
    When I set the parameter "NameInput" with value "<name>"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

  Examples:
    |   name          |
    |  test_multi_1   |
    |  test_multi_2   |
    |  test_multi_3   |

  Scenario: 批量操作_添加资源标签
    When I set the parameter "TextFilter" with value "test_multi_"
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
    When I set the parameter "TextFilter" with value "test_multi_"
    And I wait for loading invisible
    And the data name is "test_multi_1" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............auto_package"
    And the data name is "test_multi_1" then I "close" the item
    And the data name is "test_multi_2" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............auto_package"
    And the data name is "test_multi_2" then I "close" the item
    And the data name is "test_multi_3" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............auto_package"
    And the data name is "test_multi_3" then I "close" the item

  Scenario: 批量操作_删除
    When I set the parameter "TextFilter" with value "test_multi_"
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
    When I set the parameter "TextFilter" with value "test_multi_"
    And I wait for loading invisible
    Then I wait for "NoData" will be visible

  Scenario Outline: 检查提示
    And I click the "BatchControl" button
    And I choose the "<button>" from the "BatchOperation"
    Then I will see the message "请至少选择一个资源进行操作"

  Examples:
    | button       |
    | 添加资源标签 |
    | 删除         |