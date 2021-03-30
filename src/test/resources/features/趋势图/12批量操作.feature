@trend @trendMulti
Feature: 趋势图批量操作

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading complete
    And I wait for "BatchControl" will be visible

  Scenario Outline: create_trend
    Then I click the "NewTrendButton" button
    And I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() by apache.status,apache.geo.city"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    And I wait for "3000" millsecond
    And I click the "NextButton" button under some element
    And I wait for "2000" millsecond
    When I set the parameter "NameInput" with value "<name>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

  Examples:
    |   name          |
    |  test_multi_1   |
    |  test_multi_2   |
    |  test_multi_3   |

  Scenario: multi_tag
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for "2000" millsecond
    And I click the "BatchControl" button under some element
    And I click the "SelectAll" button
    And I click the "SelectBatchOperation" button under some element
    And I click the "AddResourceTags" button
    And I wait for "Ensure" will be visible
    And I choose the "auto_package" from the "TagField" in config
    And I click the "TagPanel" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    And I wait for loading complete
    And I click the "CompleteBatchControl" button under some element

  Scenario: verify_tag
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for "2000" millsecond
    Then I will see the data "test_multi_1" values "{'column':'4','name':'auto_package'}"
    Then I will see the data "test_multi_2" values "{'column':'4','name':'auto_package'}"
    Then I will see the data "test_multi_3" values "{'column':'4','name':'auto_package'}"

  Scenario: multi_delete
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for "2000" millsecond
    And I click the "BatchControl" button under some element
    And I click the "SelectAll" button
    And I click the "SelectBatchOperation" button under some element
    And I click the "DeleteResources" button
    And I wait for "Ensure" will be visible
    And I wait for "Cancel" will be visible
    Then I will see the message "您选中的 3 个资源将被删除，是否继续？"
    And I click the "Cancel" button
    When the data name is "{'column':'1','name':'test_multi_3'}" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    Then I will see the message "确认删除 [test_multi_3] ?"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    And I wait for "SuccessMessage" will be invisible
    And I click the "SelectBatchOperation" button under some element
    And I click the "DeleteResources" button
    And I wait for "Ensure" will be visible
    Then I will see the message "您选中的 2 个资源将被删除，是否继续？"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    And I wait for loading complete
    And I click the "CompleteBatchControl" button under some element

  Scenario: verify_delete
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible

  Scenario Outline: prompt
    And I wait for "2000" millsecond
    And I click the "BatchControl" button under some element
    And I click the "SelectBatchOperation" button under some element
    And I click the "<button>" button
    And I wait for "Ensure" will be visible
    Then I will see the message "请至少选择一个资源进行操作"

  Examples:
    | button           |
    | AddResourceTags  |
    | DeleteResources  |