@all @smoke @app @appSmoke
Feature: 应用查看

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"

  Scenario Outline:
    When the data name is "<name>" then i click the "查看" button
    And I will see the "app.DetailPage" page
    And I will see the element "Name" name is "<name>"
    And I will see the element "Describe" name is "<describe>"
    And I will see the element "MenuName" name is "<menuName>"
    And I will see the element "DefaultPage" name is "<defaultPage>"
    And I will see the element "ResourceRange" name is "<resourceRange>"

    Examples:
      | name        | describe | menuName | defaultPage | resourceRange |
      | AutoTestApp | AutoTest | 仪表盘      | 仪表盘         | 全局            |



