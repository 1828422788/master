@app @appSmoke
Feature: 应用定时任务

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Report" button
    Then I will see the "report.ListPage" page

  Scenario:
    When I click the "CreateButton" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then I will see the "report.CreatePage" page
