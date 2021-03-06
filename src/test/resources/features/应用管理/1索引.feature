@app
Feature: 应用索引配置(RZY-2183)

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "AutoTestAppWithAllResources"
    Then I will see the "app.AppPage" page

  @appSmoke
  Scenario: 索引新建
    When I click the "Index" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.ListPage" page
    And  I wait for "2000" millsecond
    Given I click the "AddButton" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.CreatePage" page
    Then I click the "Next" button
    And I wait for "1000" millsecond
    When I set the parameter "Name" with value "auto_app_create"
    And I set the parameter "SavedTime" with value "2"
    And I set the parameter "DivideTime" with value "1"
    Then I click the "Next" button
    And I wait for "1000" millsecond
    Then I click the "Next" button
    And I wait for "1000" millsecond
    Then I click the "Finish" button
    And I wait for "1000" millsecond
    And I wait for "Message" will be visible
    Then I will see the message "索引配置完成!"

  Scenario: 索引编辑
    When I click the "Index" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.ListPage" page
    And I wait for "1000" millsecond
    When the data name is "{'column':'1','name':'auto_app_create'}" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.CreatePage" page
    Then I click the "Next" button
    And I wait for "1000" millsecond
    And I set the parameter "Desc" with value "app测试"
    Then I click the "Next" button
    And I wait for "1000" millsecond
    Then I click the "Next" button
    And I wait for "1000" millsecond
    Then I click the "Finish" button
    And I wait for "1000" millsecond
    And I wait for "Message" will be visible
    Then I will see the message "索引配置完成!"
  #  And I click the "SavedButton" button
  #  And I wait for "Message" will be visible
  #  Then I will see the message "保存成功"

  Scenario: 删除索引
    When I click the "Index" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "index.ListPage" page
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'auto_app_create'}" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"