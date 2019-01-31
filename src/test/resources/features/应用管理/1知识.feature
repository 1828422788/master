@all @smoke @app @appSmoke
Feature: 应用知识模块

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "RightArrow" button
    And I click the "Knowledge" button
    Then I will see the "knowledge.ListPage" page

  Scenario: 新增知识并验证是否跳转到外部
    When I click the "CreateKnowledge" button
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    And I set the parameter "EventCode" with value "AutoTestAppKnowledge"
    And I choose the "AutoTestRoleWithAllResource" from the "GroupComboBox"
    And I set the parameter "Describe" with value "test"
    Then I click the "Confirm" button

  Scenario Outline: 验证分组下拉框是否正确
    When the data name is "AutoTestAppKnowledge" then i click the "分组" button
    And I will see the element "GroupComboBox" name is "<groupName>"

    Examples:
      | groupName                                         |
      | AutoTestRoleWithAllResource\nAutoTestForKnowledge |

  Scenario Outline: 验证全部资源下拉框是否正确
    When I click the "ArrowDown" button
    And I wait for "GroupMenu" will be visible
    And I will see the element "GroupMenu" name is "<groupMenuName>"
    And I click the "Setting" button
    And the page's title will be "资源分组管理"
    Then I will see the element "Title" name is "AutoTest...pWithAllResources"

    Examples:
      | groupMenuName                                               |
      | 设置\n全部资源\nAutoTestForKnowledge\nAutoTestRoleWithAllResource |

  Scenario: 验证资源筛选是否正确
    When I click the "ArrowDown" button
    And I set the parameter "SearchGroup" with value "default"
    And I wait for "NoMatch" will be visible

  Scenario Outline: 全文搜索
    When I set the parameter "SearchInput" with value "<search>"
    And I click the "SearchButton" button
    Then I will see the element "SearchCount" name is "<value>"

    Examples:
      | search   | value       |
      | autotest | 全文搜索共 1 个结果 |

  Scenario Outline: 删除知识
    Given the data name is "<Name>" then i click the "删除" button
    When I click the "EnsureDeleteButton" button
    And I will see the success message "删除成功"

    Examples:
      | Name                 |
      | AutoTestAppKnowledge |