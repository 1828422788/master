@all @smoke @app @appSmoke
Feature: 应用查看

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"

  Scenario Outline:
    When the data name is "<name>" then i click the "查看" button
    And I will see the "app.DetailPage" page
    And I wait for "Name" will be visible
    And I will see the input element "Name" value will contains "<name>"
    And I will see the element "MenuName" name is "<menuName>"
    And I will see the element "DefaultPage" name is "<defaultPage>"

    Examples:
      | name      | menuName | defaultPage |
      | ReportApp | 报表       | 报表          |