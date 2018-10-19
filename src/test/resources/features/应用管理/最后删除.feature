#@all @smoke @app
Feature: 应用删除

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"

  Scenario:
    When the data name is "AutoTest" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"
    And I refresh the website
    Then I will see the data "AutoTest" is not available on the list


