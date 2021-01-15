Feature: 监控维护期

  Background:
    Given open the "alert.MaintenancePage" page for uri "/alerts/maintenance/"

  @alertSmoke @maintenance
  Scenario Outline: api_维护期每天9-13点_字段统计_总计resplen_邮件
    Given I click the "CreateButton" button
    When I set the parameter "MaintainReason" with value "<reason>"

    And I click the "ChooseAlertButton" button
    And I set the parameter "AlertNameSearchInput" with value "<alert_name>"
    And I click the "AlertNameSearchIcon" button
    And I wait for "2000" millsecond
    And I click the "AlertNameBody" button
    And I wait for "4000" millsecond
    And I click the "AlertName" button
    And I wait for "2000" millsecond
    And I click the "AlertNameEnsure" button

    And I set the parameter "MaintenanceBeginTime" with value "09:00"
    And I set the parameter "MaintenanceEndTime" with value "13:00"

    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | reason                         | alert_name         |
      | api_维护期每天9-13点_字段统计_总计resplen_邮件 | api_维护期每天9-13点_字段统计_总计resplen_邮件 |


  Scenario Outline: RZY-2998:监控-维护期-执行计划-定时-每天1-2
    Given I click the "Create" button
    When I set the parameter "searchReason" with value "<reason>"

    And I click the "ChooseAlertName" button
    And I set the parameter "AlertNameSearchInput" with value "<alert_name>"
    And I click the "AlertNameSearchIcon" button
    And I wait for "2000" millsecond
    And I click the "AlertNameBody" button
    And I wait for "4000" millsecond
    And I click the "AlertName" button
    And I wait for "2000" millsecond
    And I click the "AlertNameEnsure" button

    And I set the parameter "MaintenanceBeginTime" with value "09:00"
    And I set the parameter "MaintenanceEndTime" with value "13:00"

    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | reason                         | alert_name         |
      | api_维护期每天9-13点_字段统计_总计resplen_邮件 | api_维护期每天9-13点_字段统计_总计resplen_邮件 |


  @smoke @alertSmoke
  Scenario Outline: 搜索维护期
    And I set the parameter "ReasonNameSearchInput" with value "<reasonName>"
    And I click the "ReasonNameSearchIcon" button
    And I wait for loading invisible
 #   Then I will see the search result "{'column':'0','name':'<reasonName>'}"

    Examples:
      | reasonName |
      | 维护期5   |

#  @smoke @alertSmoke
  Scenario: 查看监控是否正在维护
    Given open the "alert.ListPage" page for uri "/alerts/"
    When choose from "{'DropdownMenu':'default_Alert'}"
    Then I will see the search result "{'column':'0','name':'正在维护'}"

  @third @alertSmoke
  Scenario: 删除维护期
    When the data name is "RZY-2998:监控-维护期-执行计划-定时-每天9:00" then i click the "删除" button
    And I click the "EnsureDelete" button
    Then I will see the success message "删除成功"

  @smoke @alertSmoke
  Scenario: 返回监控首页
    When I click the "ReturnToAlertPage" button
    Then the page's title will be "监控"