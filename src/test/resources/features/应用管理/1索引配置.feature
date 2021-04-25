@app @appSmoke
Feature: 应用路由管理

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button in more menu
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
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"

  Scenario: 编辑topic
    When I click the "Topic" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.TopicSetting" page
    When the data name is "AutoApp" then i click the "编辑" button
    And I set the parameter "Describe" with value "app测试"
    And I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
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

  Scenario: 路由新建
    When I click the "AddButton" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.MatchRuleCreatePage" page
    And I set the parameter "AppName" with value "apptest"
    And I click the "CreateButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

  Scenario: 路由编辑
    When the data name is "apptest" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.MatchRuleCreatePage" page
    And I set the parameter "Desc" with value "apptestcreate"
    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

  Scenario: 路由删除
    When the data name is "apptest" then i click the "删除" button
    And I wait for "Ensure" will be visible
    Then I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"

  Scenario: 验证返回列表页不跳出app
    When I click the "Topic" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.TopicSetting" page
    And I click the "ReturnList" button
    And I wait for title change text to "路由配置"
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"

#  Scenario: 验证返回列表页不跳出app
#    When I click the "Index" button
#    And I will see the "app.AppPage" page
#    And I will see the element "Title" name is "AutoTestAppWithAllResources"
#    Then I will see the "index.ListPage" page
#    And I click the "ReturnList" button
#    And I wait for title change text to "路由配置"
#    Then I will see the "app.AppPage" page
#    And I will see the element "Title" name is "AutoTestAppWithAllResources"
