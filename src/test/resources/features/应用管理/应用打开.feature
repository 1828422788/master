#@all @smoke @app @appSmoke
Feature: 应用打开

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"

  Scenario Outline: 验证单个资源的app资源范围是否正确
    When the data name is "<name>" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I wait for loading invisible
    And I wait for "EmptyText" will be visible
    And I will see the element "Title" name is "<name>"

    Examples:
      | name             |
      | ReportApp        |
      | DashboardApp     |
      | AlertApp         |
      | TrendApp         |
      | SavedsearchesApp |
      | KnowledgeApp     |
      | MacroApp         |
      | ConfigsApp       |

  Scenario Outline: 验证资源正确
    When the data name is "<name>" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I wait for loading invisible
    Then I will see the search result "app所选资源"
    And I will see the element "Title" name is "<name>"

    Examples:
      | name        |
      | TopologyApp |
