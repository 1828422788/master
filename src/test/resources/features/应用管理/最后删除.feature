@clean @cleanApp @app-clean
Feature: 应用删除

  Scenario Outline:
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name                        |
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
      | DatasetApp                  |
      | KVApp                       |
      | AppFieldConfig              |

  Scenario: 删除数据集
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "AutoTestApp" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button

  Scenario Outline: 删除拓扑图资源
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button

    Examples:
      | name    |
      | app所选资源 |
      | app所选资源 |
      | app所选资源 |
      | app所选资源 |
      | app所选资源 |
      | app所选资源 |
      | app所选资源 |
      | app所选资源 |
      | app所选资源 |
      | app所选资源 |
      | app所选资源 |
      | app所选资源 |
      | app所选资源 |
      | app所选资源 |