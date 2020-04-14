@clean @cleanApp
Feature: 应用删除

  Scenario Outline:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name                        |
      | DatasetApp                  |
      | AutoTestAppWithAllResources |
      | EventApp                    |
      | ReportApp                   |
      | DashboardApp                |
      | AlertApp                    |
      | TrendApp                    |
      | SavedsearchesApp            |
      | KnowledgeApp                |
      | MacroApp                    |
      | TopologyApp                 |
      | ConfigsApp                  |
      | AuthApp                     |

  Scenario: 删除数据集
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When the data name is "AutoTestApp" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button