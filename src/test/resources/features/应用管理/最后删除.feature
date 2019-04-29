@clean
Feature: 应用删除

  Scenario Outline:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"

    Examples:
      | name                        |
      | AutoTestAppWithAllResources |
      | ReportApp                   |
      | DashboardApp                |
      | AlertApp                    |
      | ScheduleApp                 |
      | TrendApp                    |
      | SavedsearchesApp            |
      | KnowledgeApp                |
      | MacroApp                    |
      | SourceApp                   |
      | TopologyApp                 |
      | ConfigsApp                  |
      | AutoTestAuth                |

  Scenario Outline: 删除对应的资源分组
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    When I set the search input with "<name>"
    And the data name is "<name>" then i click the "删除" button
    Then I click the "MessageBoxOKButton" button

    Examples:
      | name                        |
      | AutoTestSourceForApp        |
      | AutoTestAppWithAllResources |