@all @smoke @app
Feature: 打开应用

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"

  Scenario:
    When the data name is "AutoTest" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "FirstSubNav" name is "仪表盘"
    And I will see the element "SecondSubNav" name is "AutoTest"
    And I click the detail which name is "autotest"
    And I will see the element "FirstSubNav" name is "仪表盘"
    Then I will see the element "SecondSubNav" name is "AutoTest"