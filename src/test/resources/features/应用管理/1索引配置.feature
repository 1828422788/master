@app @appSmoke
  Feature: 应用索引配置(RZY-2183)

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Indexsetting" button
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.ListPage" page

  Scenario: 新建topic配置
    When I click the "Topic" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.TopicSetting" page
    When I click the "CreateButton" button
    And I set the parameter "Name" with value "AutoApp"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

  Scenario: 编辑topic
    When I click the "Topic" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.TopicSetting" page
    When the data name is "AutoApp" then i click the "编辑" button
    And I set the parameter "Describe" with value "app测试"
    And I click the "EnsureButton" button
    Then I will see the success message "更新成功"

  Scenario: 删除topic
    When I click the "Topic" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.TopicSetting" page
    When the data name is "AutoApp" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

  Scenario: 索引新建
    When I click the "Index" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.ListPage" page
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "auto_app_create"
    And I set the parameter "SavedTime" with value "2"
    And I set the parameter "DivideTime" with value "1"
    And I click the "CreateButton" button
    Then I will see the success message "保存成功"

  Scenario: 索引编辑
    When I click the "Index" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.ListPage" page
    When the data name is "{'column':'1','name':'auto_app_create'}" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AutoTest...pWithAllResources"
    Then I will see the "index.CreatePage" page
    And I set the parameter "Desc" with value "app测试"
    And I click the "SavedButton" button
    Then I will see the success message "保存成功"

  Scenario: 索引禁用
    When I click the "Index" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    And I will see the "index.ListPage" page
    Then the data name is "{'column':'1','name':'auto_app_create'}" then I "close" the switch
    Then I will see the success message "禁用成功"

  Scenario: 删除索引
    When I click the "Index" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.ListPage" page
    When the data name is "{'column':'1','name':'auto_app_create'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"

  Scenario: 路由新建
    When I click the "AddButton" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AutoTest...pWithAllResources"
    Then I will see the "index.MatchRuleCreatePage" page
    And I set the parameter "AppName" with value "apptest"
    And I click the "CreateButton" button
    Then I will see the success message "保存成功"

  Scenario: 路由编辑
    When the data name is "apptest" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AutoTest...pWithAllResources"
    Then I will see the "index.MatchRuleCreatePage" page
    And I set the parameter "AppName" with value "apptestcreate"
    And I click the "SavedButton" button
    Then I will see the success message "保存成功"

  Scenario: 路由删除
    When the data name is "apptestcreate" then i click the "删除" button
    And I wait for "Ensure" will be visible
    Then I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"

