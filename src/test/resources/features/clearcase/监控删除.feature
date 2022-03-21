@clean
Feature: 监控删除

  Scenario Outline: 监控删除
    Given open the "alert.ListPage" page for uri "/alerts/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDeleteButton" button

  # @alertSmoke
    Examples:
      | name                                   |
      | RZY-434:字段统计监控步骤1(副本)                  |
      | RZY-434:字段统计监控步骤5(副本)                  |
      | 监控高级配置测试(副本)                           |
      | 监控高级配置测试                               |
      | RZY-435:连续统计监控步骤5                      |
      | RZY-435:连续统计监控步骤3                      |
      | RZY-435:连续统计监控步骤2                      |
      | RZY-435:连续统计监控步骤1                      |
      | RZY-434:字段统计监控步骤5                      |
      | RZY-434:字段统计监控步骤4                      |
      | RZY-434:字段统计监控步骤3                      |
      | RZY-434:字段统计监控步骤2                      |
      | RZY-434:字段统计监控步骤1                      |

  @cleanSecond
  Scenario: 删除维护期
    Given open the "alert.MaintenancePage" page for uri "/alerts/maintenance/"
    When the data name is "RZY-2998:监控-维护期-执行计划-定时-每天9:00" then i click the "删除" button
    And I click the "EnsureDelete" button
    Then I will see the success message "删除成功"

  # @clean @alertSmoke
  Scenario Outline: 删除关联知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    When the data name is "<name>" then i click the "删除" button
    Then I click the "EnsureDeleteButton" button

    Examples:
      | name              |
      | KnowledgeForAlert |

  @clean
  Scenario Outline: 删除关联知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    When the data name is "<name>" then i click the "删除" button
    Then I click the "EnsureDeleteButton" button

    Examples:
      | name           |
      | AlertKnowledge |

  Scenario: 删除已存搜索
    Given open the "splSearch.SearchPage" page for uri "/search/"
    When I click the "OpenSavedSearchButton" button
    Then "删除" the data "监控所需已存搜索" in columnNum "1"
    Then I click the "DeleteSavedSearch" button