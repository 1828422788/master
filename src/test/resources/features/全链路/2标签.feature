@fulllink @tagFulllink
Feature: 全链路_标签

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond

  Scenario: 创建全链路
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I set the parameter "Name" with value "Tag_Test"
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建成功"

  Scenario: 添加标签
    When the data name is "Tag_Test" then i click the "标签" button in more menu
    And I choose the "auto_package" from the "TagField" in config
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"

  Scenario: 验证标签
    Then I will see the data "Tag_Test" values "{'column':'4','name':'auto_package'}"

  Scenario Outline: 删除全链路
    When the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    Then I will see the message "确认删除 [<name>] ?"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

    Examples:
    | name             |
    | Tag_Test         |

