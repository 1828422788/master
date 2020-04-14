@all @smoke @app @appSmoke

  Scenario: 新增知识并验证是否跳转到外部
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KnowledgeApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    When I click the "Create" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "KnowledgeApp"
    Then I will see the "knowledge.CreatePage" page
    And I set the parameter "EventCode" with value "AutoTestAppKnowledge"
    And I set the parameter "Describe" with value "test"
    Then I click the "Save" button

  Scenario: 知识编辑
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KnowledgeApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    When the data name is "AutoTestAppKnowledge" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "KnowledgeApp"
    Then I will see the "knowledge.CreatePage" page
    And I set the parameter "EventCode" with value "AutoTestApp"
    Then I click the "Save" button

  Scenario Outline: 全文搜索
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KnowledgeApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    When I set the parameter "SearchInput" with value "<search>"
    And I click the "Search" button
    And I wait for element "SearchCount" change text to "<value>"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"

    Examples:
      | search      | value       |
      | AutoTestApp | 全文搜索共 1 个结果 |

  Scenario: 修改标签
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KnowledgeApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KnowledgeApp"
    Then I will see the "knowledge.ListPage" page
    When the data name is "AutoTestAppKnowledge" then i click the "标签" button
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
    Then I will see the search result "AutoTestAppKnowledge"

  Scenario: 新建无所属应用
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    When I set the parameter "EventCode" with value "测试无应用"
    And I set the parameter "Describe" with value "若该知识没被删除，则证明app全局资源有问题"
    And I click the "Save" button
    And I wait for loading invisible

  Scenario: 按照应用搜索
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I choose the "KnowledgeApp" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "AutoTestAppKnowledge"
    Then I will see the search result "{'column':'0','name':'测试无应用','contains':'no'}"

  Scenario Outline: 修改app资源范围
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "OverallSituation" button
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

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
      | Name        |
      | 测试无应用       |
      | AutoTestApp |