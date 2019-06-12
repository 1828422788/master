@clean
Feature: 监控删除

  Scenario Outline: 监控删除
    Given open the "alert.ListPage" page for uri "/alerts/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDeleteButton" button

  @cleanSecond
    Examples:
      | name                                       |
      | RZY-436:SPL统计监控步骤2                         |
      | RZY-3016:监控-设备切分-执行结果验证-填写appname          |
      | RZY-3015:监控-设备切分-执行结果验证-填写tag              |
      | RZY-2971:监控-设备切分-执行结果验证-填写ip或timestamp     |
      | RZY-3035:监控-设备切分-执行结果验证-字段统计型监控-填写hostname |
      | RZY-435:连续统计监控步骤5                          |
      | RZY-435:连续统计监控步骤4                          |
      | RZY-435:连续统计监控步骤3                          |
      | RZY-435:连续统计监控步骤2                          |
      | RZY-435:连续统计监控步骤1                          |
      | RZY-434:字段统计监控步骤5                          |
      | RZY-434:字段统计监控步骤4                          |
      | RZY-434:字段统计监控步骤3                          |
      | RZY-434:字段统计监控步骤2                          |
      | RZY-434:字段统计监控步骤1                          |
      | RZY-437:基线对比监控步骤4                          |
      | RZY-437:基线对比监控步骤3                          |
      | RZY-437:基线对比监控步骤2                          |
      | RZY-437:基线对比监控步骤1                          |
      | RZY-436：SPL统计监控步骤1                         |

  @cleanFirst
    Examples:
      | name                      |
      | RZY-2465:事件数监控-监控记录是否正确展示 |
      | RZY-2471:新建监控类型-基线对比监控    |
      | RZY-2470:新建监控类型-SPL统计监控   |
      | RZY-2469:新建监控类型-连续统计监控    |
      | RZY-2468:新建监控类型-字段统计监控    |
      | RZY-2478:新建监控类型-事件数监控     |
      | linux日志关键字告警              |

    Examples:
      | name              |
      | RZY-448：告警转发      |
      | RZY-449：ping主机    |
      | RZY-446：邮件监控      |
      | RZY-445：rsyslog监控 |

  @alertSmoke
    Examples:
      | name                  |
      | RZY-434:字段统计监控步骤5(副本) |
      | RZY-434:字段统计监控步骤5     |
      | RZY-434:字段统计监控步骤4     |
      | RZY-434:字段统计监控步骤3     |
      | RZY-434:字段统计监控步骤2     |
      | RZY-434:字段统计监控步骤1     |

  @cleanSecond
  Scenario: 删除维护期
    Given open the "alert.MaintenancePage" page for uri "/alerts/maintenance/"
    When the data name is "RZY-2998:监控-维护期-执行计划-定时-每天9:00" then i click the "删除" button
    And I click the "EnsureDelete" button
    Then I will see the success message "删除成功"

  @clean @alertSmoke
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