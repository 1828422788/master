@fulllink @renameFulllink
Feature: 全链路_重命名

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "Loading" will be invisible

  Scenario: 创建全链路
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I set the parameter "Name" with value "Rename_Test"
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建成功"

  Scenario: 重命名_取消
    When the data name is "Rename_Test" then i click the "重命名" button in more menu
    And I will see the input element "Name" value will be "Rename_Test"
    And I set the parameter "Name" with value "TEST_TEST"
    And I click the "Cancel" button
    Then I will see the search result "{'column':'0','name':'TEST_TEST','contains':'no'}"
    When the data name is "Rename_Test" then i click the "重命名" button in more menu
    And I will see the input element "Name" value will be "Rename_Test"

  Scenario: 重命名
    When the data name is "Rename_Test" then i click the "重命名" button in more menu
    And I set the parameter "Name" with value "Test_Rename"
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "修改成功"

  Scenario: 验证重命名
    When I set the parameter "SearchInput" with value "Rename_Test"
    And I wait for "2000" millsecond
    And I wait for "Nodata" will be visible
    When I set the parameter "SearchInput" with value "Test_Rename"
    And I wait for "2000" millsecond
    When the data name is "Test_Rename" then i click the "编辑" button in more menu

  Scenario Outline: 删除全链路
    When the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    Then I will see the message "确认删除 [<name>] ?"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

    Examples:
    | name             |
    | Test_Rename      |

