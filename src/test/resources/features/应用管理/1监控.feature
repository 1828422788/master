@all @smoke @app @appSmoke
Feature: 应用监控模块

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "RightArrow" button
    And I click the "Alert" button
    Then I will see the "alert.ListPage" page

  Scenario:
    When I click the "CreateAlert" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    And I will see the "alert.CreatePage" page
