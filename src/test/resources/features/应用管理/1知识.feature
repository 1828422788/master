@all @smoke @app @appSmoke
Feature: 应用知识

  Scenario: 新增知识并验证是否跳转到外部
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KnowledgeApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    And I click the "Create" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I click the "Next" button
    And I set the parameter "EventCode" with value "知识app"
    And I click the "Next" button
    Then I will see the element "SuccessAdd" name is "添加成功"

  Scenario: 知识编辑
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KnowledgeApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    When the data name is "知识app" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I click the "Next" button
    And I set the parameter "EventCode" with value "知识app修改名称"
    And I click the "Next" button
    Then I will see the element "SuccessAdd" name is "添加成功"

  Scenario Outline: 全文搜索
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KnowledgeApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    When I set the parameter "SearchInput" with value "<search>"
    And I click the "Search" button
    And I wait for "SearchCount" will be visible
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"

    Examples:
      | search |
      | 知识app  |

  Scenario: 修改标签
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KnowledgeApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    When the data name is "知识app" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTag"
    And I choose the "AutoTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"

  Scenario: 标签搜索
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KnowledgeApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    Given I wait for loading invisible
    When I choose the "AutoTag" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result "知识app"

  Scenario: 新建无所属应用知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I set the parameter "RichEditor" with value "若该知识没被删除，则证明app全局资源有问题"
    And I click the "Next" button
    And I click the "Next" button
    When I set the parameter "EventCode" with value "测试无应用"
    And I click the "Next" button
    Then I will see the element "SuccessAdd" name is "添加成功"

  Scenario: 按照应用搜索
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I choose the "KnowledgeApp" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "知识app"
    Then I will see the search result "{'column':'0','name':'测试无应用','contains':'no'}"

  Scenario Outline: 修改app资源范围
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "OverallSituation" button
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

    Examples:
      | name         |
      | KnowledgeApp |

  Scenario Outline: 删除知识
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KnowledgeApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    Given the data name is "{'column':'1','name':'<Name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    When I click the "Ensure" button
    And I will see the success message "删除知识成功"

    Examples:
      | Name  |
      | 测试无应用 |
      | 知识app |