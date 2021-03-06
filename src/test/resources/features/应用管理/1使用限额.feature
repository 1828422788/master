@app
Feature: 应用限额管理（RZY-2182）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "AutoTestAppWithAllResources"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"

  Scenario:
    When I click the "Limit" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    Then I will see the "usage.ListPage" page
    And I click the "ShowButton" button