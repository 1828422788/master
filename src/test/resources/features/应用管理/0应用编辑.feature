@all @app
Feature: 应用编辑

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"

  Scenario Outline: 修改单个资源app的资源范围，增加监控菜单
    When the data name is "<name>" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "app.CreatePage" page
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "搜索宏测试"
    And I set the parameter "Url" with value "/macro/"
    And I click the "SaveMenuButton" button
    And I click the "OverallSituation" button
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  @smoke @appSmoke
    Examples: 编辑成功
      | name             |
      | ReportApp        |
      | DashboardApp     |
      | AlertApp         |
      | ScheduleApp      |
      | TrendApp         |
      | SavedsearchesApp |
      | KnowledgeApp     |
      | MacroApp         |
      | SourceApp        |
      | TopologyApp      |
      | ConfigsApp       |

  Scenario Outline: 验证单个资源的app全局范围生效
    When the data name is "<name>" then i click the "打开" button
    And I wait for loading invisible
    Then I will see the "app.AppPage" page
    And I click the "ArrowDown" button
    Then I will see the element "LiText" value is "<group>"

    Examples:
      | name             | group                  |
      | ReportApp        | default_Report         |
      | DashboardApp     | default_DashBoardGroup |
      | AlertApp         | default_Alert          |
      | ScheduleApp      | default_SavedSchedule  |
      | TrendApp         | default_Trend          |
      | SavedsearchesApp | default_SavedSearch    |
      | KnowledgeApp     | default_Knowledge      |
      | MacroApp         | default_Macro          |
      | SourceApp        | default_SourceGroup    |
      | TopologyApp      | default_Topology       |
      | ConfigsApp       | default_ParserRule     |

  @smoke @appSmoke
  Scenario: 更改资源范围
    When the data name is "AutoTestAppWithAllResources" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "app.CreatePage" page
    And I click the "SourceConfig" button
    And I set the parameter "SearchSource" with value "AutoTest"
    And I click the "AllCheck" button
    And I click the "CloseDialog" button
    And I wait for "ResourceConfig" will be invisible
    And I click the "CurrentApp" button
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
