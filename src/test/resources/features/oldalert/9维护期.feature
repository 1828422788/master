@alertss
Feature: 监控维护期

  Background:
    Given open the "alert.MaintenancePage" page for uri "/alerts/maintenance/"

  #@alertSmoke @second
  Scenario Outline: RZY-2998:监控-维护期-执行计划-定时-每天9:00
    Given I click the "Create" button
    When I set the parameter "Reason" with value "<reason>"
    And I choose the "<group>" from the "Group"
    And I set the parameter "StartMinute" with value "0"
    And I set the parameter "StartHour" with value "9"
    And I set the parameter "EndHour" with value "10"
    And I set the parameter "EndMinute" with value "0"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | reason                         | group         |
      | RZY-2998:监控-维护期-执行计划-定时-每天9:00 | default_Alert |

  #@smoke @alertSmoke
  Scenario Outline: 编辑维护期（修改影响涉及范围并检查）
    Given the data name is "<name>" then i click the "编辑" button
    And I click the "Single" button
    And I click the "StartTime" button
    And I click the "RightNow" button
    And I click the "EndTime" button
    And I set the time input "TimeInput" to "35" minutes later
    And I click the "EnsureButton" button
    And I wait for "Available" will be invisible
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | name                           |
      | RZY-2998:监控-维护期-执行计划-定时-每天9:00 |

  Scenario Outline: 新建维护期失败（为空校验）
    Given I click the "Create" button
    When I set the parameter "Reason" with value "<reason>"
    And I choose the "<group>" from the "Group"
    And I click the "SaveButton" button
    Then I will see the error message "<message>"

    Examples:
      | reason | group         | message     |
      |        |               | 请填写必须参数，谢谢！ |
      | test   |               | 请填写必须参数，谢谢！ |
      | test   | default_Alert | 请填写必须参数，谢谢！ |

  Scenario Outline: 新建维护期失败（校验开始日期晚于结束日期）
    Given I click the "Create" button
    When I set the parameter "Reason" with value "<reason>"
    And I choose the "<group>" from the "Group"
    And I click the "StartTime" button
    And I set the time input "TimeInput" to "20" minutes later
    And I click the "EnsureButton" button
    And I click the "EndTime" button
    And I click the "RightNow" button
    And I wait for "Available" will be invisible
    And I click the "SaveButton" button
    Then I will see the error message "<message>"

    Examples:
      | reason | group         | message                 |
      | test   | default_Alert | 保存失败: 默认系统错误\n错误码: FE_1 |

  #@smoke @alertSmoke
  Scenario Outline: 搜索维护期
    Given I set the parameter "SearchReason" with value "<reason>"
    And I wait for "1000" millsecond
    Then I will see the search result "{'column':'0','name':'<reason>'}"

    Examples:
      | reason |
      | 2998   |

#  @smoke @alertSmoke
  Scenario: 查看监控是否正在维护
    Given open the "alert.ListPage" page for uri "/alerts/"
    When choose from "{'DropdownMenu':'default_Alert'}"
    Then I will see the search result "{'column':'0','name':'正在维护'}"

  #@third @alertSmoke
  Scenario: 删除维护期
    When the data name is "RZY-2998:监控-维护期-执行计划-定时-每天9:00" then i click the "删除" button
    And I click the "EnsureDelete" button
    Then I will see the success message "删除成功"

  #@smoke @alertSmoke
  Scenario: 返回监控首页
    When I click the "ReturnToAlertPage" button
    Then the page's title will be "监控"