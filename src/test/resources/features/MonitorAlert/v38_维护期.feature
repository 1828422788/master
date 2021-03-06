@maintain @bvtalert @alertcase
Feature: 监控维护期

  Background:
    Given open the "alert.MaintenancePage" page for uri "/alerts/maintenance/"

  @maintain1
  Scenario Outline: api_维护期每天9-13点_字段统计_总计resplen_邮件
    Given I click the "CreateButton" button
    And I set the parameter "MaintainBeginTimeInput" with value "02:00"
    And I choose the "02" from the "MaintainBeginTimeList" in the time list
    And I wait for loading invisible
    When I set the parameter "MaintainReason" with value "<reason>"
    And I set the parameter "MaintainEndTimeInput" with value "23:00"
    And I choose the "23" from the "MaintainEndTimeList" in the time list
    And I click the "ChooseAlertButton" button
    And I set the parameter "AlertNameSearchInput" with value "<alert_name>"
    And I click the "AlertNameSearchIcon" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<alert_name>"
    And I wait for loading invisible
    And I click the "AlertNameEnsure" button
    And I click the "SaveButton" button
    Then I will see the success message "创建成功"

    Examples:
      | reason                          | alert_name                      |
      | 维护期_字段统计_分组事件数status_邮件_每天0-23点 | 维护期_字段统计_分组事件数status_邮件_每天0-23点 |
      | 维护期_del                         | 维护期_字段统计_分组事件数status_邮件_每天0-23点 |
      | 维护期_update                      | 维护期_字段统计_分组事件数status_邮件_每天0-23点 |

  @maintain2
  Scenario Outline: 单次
    Given I click the "CreateButton" button
    When I set the parameter "MaintainReason" with value "<reason>"

    And I click the "ChooseAlertButton" button
    And I set the parameter "AlertNameSearchInput" with value "<alert_name>"
    And I click the "AlertNameSearchIcon" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<alert_name>"
    And I wait for loading invisible
    And I click the "AlertNameEnsure" button
    And I click the "SingleButton" button
    And I click the "SingleBeginTimeButton" button
    And I click the "BeginTimeDiv" button
    And I click the "SingleCurrentTimeButton" button
    And I click the "SaveButton" button
    Then I will see the success message "创建成功"

    Examples:
      | reason                           | alert_name                       |
      | 维护期_字段统计_分组事件数status_邮件_单次今天9点开始 | 维护期_字段统计_分组事件数status_邮件_单次今天9点开始 |

    @alertSmoke
    Examples:
      | reason                           | alert_name                       |
      | 维护期_字段统计_分组事件数status_邮件_永久       | 维护期_字段统计_分组事件数status_邮件_永久       |

  @maintain3 @alertSmoke
  Scenario Outline:每周一至周六
    Given I click the "CreateButton" button
    And I click the "ChooseAlertButton" button
    And I set the parameter "AlertNameSearchInput" with value "<alert_name>"
    And I click the "AlertNameSearchIcon" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<alert_name>"
    And I wait for loading invisible
    And I click the "AlertNameEnsure" button
    And I choose the "每周" from the "PerformPlanList"
    And I set the parameter "MaintainBeginTimeInput" with value "02:00"
    And I choose the "02" from the "MaintainBeginTimeList" in the time list
    When I set the parameter "MaintainReason" with value "<reason>"
    And I choose the "一" from the "BeginWeeklyDayList"
    And I set the parameter "MaintainEndTimeInput" with value "23:00"
    And I choose the "23" from the "MaintainEndTimeList" in the time list
    And I choose the "六" from the "EndWeeklyDayList"
    And I click the "SaveButton" button
    Then I will see the success message "创建成功"

    Examples:
      | reason                         | alert_name                     |
      | 维护期_字段统计_分组事件数status_邮件_每周一至周六 | 维护期_字段统计_分组事件数status_邮件_每周一至周六 |

  @maintain4
  Scenario Outline:每月
    Given I click the "CreateButton" button
    And I click the "ChooseAlertButton" button
    And I set the parameter "AlertNameSearchInput" with value "<alert_name>"
    And I click the "AlertNameSearchIcon" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<alert_name>"
    And I wait for loading invisible
    And I click the "AlertNameEnsure" button
    And I choose the "每月" from the "PerformPlanList"
    And I set the parameter "MaintainBeginTimeInput" with value "02:00"
    And I choose the "02" from the "MaintainBeginTimeList" in the time list
    And I choose the "1日" from the "BeginWeeklyDayList"
    When I set the parameter "MaintainReason" with value "<reason>"
    And I set the parameter "MaintainEndTimeInput" with value "23:00"
    And I choose the "23" from the "MaintainEndTimeList" in the time list
    And I choose the "28日" from the "EndWeeklyDayList"
    And I click the "SaveButton" button
    Then I will see the success message "创建成功"

    Examples:
      | reason                         | alert_name                     |
      | 维护期_字段统计_分组事件数status_邮件_每月1-30 | 维护期_字段统计_分组事件数status_邮件_每月1-30 |

  @maintain51
  Scenario Outline: 搜索维护期
    And I set the parameter "ReasonNameSearchInput" with value "<reasonName>"
    And I click the "ReasonNameSearchIcon" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<reasonName>'}"

    Examples:
      | reasonName                       |
      | 维护期_字段统计_分组事件数status_邮件_单次今天9点开始 |

  @maintain5
  Scenario Outline: 查看监控是否正在维护
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I set the parameter "AlertListSearchInput" with value "<alert_name>"
    And I click the "AlertListSearchInputButton" button
    And I wait for loading invisible
    And I wait for "MaintainFlag" will be visible

    @alertSmoke
    Examples:
      | alert_name                       |
      | 维护期_字段统计_分组事件数status_邮件_每周一至周六   |
      | 维护期_字段统计_分组事件数status_邮件_永久       |

    Examples:
      | alert_name                       |
      | 维护期_字段统计_分组事件数status_邮件_每月1-30   |
      | 维护期_字段统计_分组事件数status_邮件_每天0-23点  |
      | 维护期_字段统计_分组事件数status_邮件_单次今天9点开始 |

  @maintaindel
  Scenario Outline: 删除维护期
    Given open the "alert.MaintenancePage" page for uri "/alerts/maintenance/"
    When the data name is "<reasonName>" then i click the "删除" button
    And I click the "EnsureDelete" button
    And I set the parameter "ReasonNameSearchInput" with value "<reasonName>"
    And I will see the "TmpNoData" is display
    
    Examples:
      | reasonName                       |
      | 维护期_del                          |

  @toalert
  Scenario: 返回监控首页
    When I click the "ReturnToAlertPage" button
    Then the page's title will be "监控"