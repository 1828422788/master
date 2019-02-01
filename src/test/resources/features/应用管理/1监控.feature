@all @smoke @app @appSmoke
Feature: 应用监控模块（RZY-2122）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "Alert" button
    Then I will see the "alert.ListPage" page

  Scenario: 新建监控
    When I click the "CreateAlert" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "AutoTestAppAlert"
    And I choose the "AutoTestRoleWithAllResource" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "*"
    And I switch the "AlertEnable" button to "disable"
    And I set the parameter "AlertTriggerInput" with value "1"
    And I set the parameter "AlertLevelInput" with value "1"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Then take a screenshot with name "2122：APP-新建监控"

  Scenario: 编辑监控
    When the data name is "AutoTestAppAlert" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "AutoTestAppAlertChangeName"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Then take a screenshot with name "2122：APP-编辑监控"
