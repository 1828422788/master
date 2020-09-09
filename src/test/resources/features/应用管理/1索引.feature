@app @appSmoke
Feature: 应用索引配置(RZY-2183)

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    Then I will see the "app.AppPage" page

  Scenario: 索引新建
    When I click the "Index" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.ListPage" page
    Given I click the "AddButton" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "auto_app_create"
    And I set the parameter "SavedTime" with value "2"
    And I set the parameter "DivideTime" with value "1"
    And I click the "CreateButton" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"

  Scenario: 索引编辑
    When I click the "Index" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.ListPage" page
    When the data name is "{'column':'0','name':'auto_app_create'}" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.CreatePage" page
    And I set the parameter "Desc" with value "app测试"
    And I click the "SavedButton" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"

  Scenario: 删除索引
    When I click the "Index" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.ListPage" page
    When the data name is "{'column':'0','name':'auto_app_create'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"