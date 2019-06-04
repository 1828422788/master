@app @appSmoke
Feature: 应用拓扑图（RZY-2142）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "Topology" button
    Then I will see the "topology.ListPage" page

  Scenario: 新建拓扑图
    When I click the "CreateButton" button
    And I set the parameter "NameInput" with value "AutoTestApp"
    And I choose the "AutoTestRoleWithAllResource" from the "GroupInput"
    And I click the "EnsureButton" button

  Scenario: 拓扑图重命名
    When the data name is "AutoTestApp" then i click the "重命名" button
    Then I set the parameter "NameInput" with value "AutoApp"
    Then I click the "EnsureButton" button
    Then I will see the success message "保存成功"

  Scenario Outline: 根据分组搜索（RZY-355）
    Given I choose the "<group>" from the "GroupDropdownList"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | group                       | name    |
      | AutoTestRoleWithAllResource | AutoApp |

  Scenario Outline: 根据输入内容搜索（RZY-354）
    Given I set the search input with "<name>"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>'}"

    Examples:
      | name    |
      | AutoApp |

  Scenario: 删除拓扑图
    When the data name is "AutoApp" then i click the "删除" button
    And I click the "Ensure" button
