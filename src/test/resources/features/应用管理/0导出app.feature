@all @smoke @app @appSmoke
Feature: 应用导出

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"

  Scenario Outline: 验证导出是否成功
    Given delete file "/target/download-files/<name>.tar"
    When the data name is "<name>" then i click the "导出" button
    And I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "ExportButton" button
    Then I will see the success message "请等待下载开始后，点击确定返回列表页，然后等待下载完成"

    Examples:
      | name             |
      | EventApp         |
      | ReportApp        |
      | DashboardApp     |
      | AlertApp         |
      | ScheduleApp      |
      | TrendApp         |
      | SavedsearchesApp |
      | KnowledgeApp     |
      | MacroApp         |
      | TopologyApp      |
      | ConfigsApp       |