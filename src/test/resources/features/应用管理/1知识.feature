@all @smoke @app @appSmoke
Feature: 应用知识模块（RZY-2128）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KnowledgeApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page

  Scenario: 新增知识并验证是否跳转到外部
    When I click the "Create" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "KnowledgeApp"
    Then I will see the "knowledge.CreatePage" page
    And I set the parameter "EventCode" with value "AutoTestAppKnowledge"
    And I set the parameter "Describe" with value "test"
    Then I click the "Save" button

  Scenario: 知识编辑
    When the data name is "AutoTestAppKnowledge" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "KnowledgeApp"
    Then I will see the "knowledge.CreatePage" page
    And I set the parameter "EventCode" with value "AutoTestApp"
    Then I click the "Save" button

  Scenario Outline: 全文搜索
    When I set the parameter "SearchInput" with value "<search>"
    And I click the "Search" button
    And I wait for element "SearchCount" change text to "<value>"

    Examples:
      | search      | value       |
      | AutoTestApp | 全文搜索共 1 个结果 |

  Scenario: 修改标签
    When the data name is "AutoTestAppKnowledge" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTag"
    And I choose the "AutoTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"

  Scenario: 标签搜索
    Given I wait for loading invisible
    When I choose the "AutoTag" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result "AutoTestAppKnowledge"

  Scenario Outline: 删除知识
    Given the data name is "{'column':'1','name':'<Name>'}" then i click the "删除" button
    When I click the "Ensure" button
    And I will see the success message "删除知识成功"

    Examples:
      | Name        |
      | AutoTestApp |