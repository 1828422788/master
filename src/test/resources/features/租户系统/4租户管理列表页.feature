@tenant
Feature: 租户系统-列表页

  Background:
    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
#    When I set the parameter "Username" with properties "saas_username"
#    And I set the parameter "Password" with properties "saas_password"
#    And I click the "LoginButton" button
    And I will see the "tenant.ListPage" page

  Scenario Outline: 搜索租户
    When I set the parameter "SearchInput" with value "<name>"

    Then take a screenshot with name "tenantStatus/搜索租户结果"
#     Then I will see the search result "{'column':'1','name':'<name>'}"
  #  Then I will see the search result contains "{'column':'1','name':'<name>'}"

    Examples:
      | name |
      | ops (ops) |


  Scenario Outline: 查看ops租户的信息
#    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
#    When I set the parameter "Username" with properties "saas_username"
#    And I set the parameter "Password" with properties "saas_password"
#    And I click the "LoginButton" button
#    And I will see the "tenant.ListPage" page
    And I click the "lookButton" button
    Then I will see the "everydayLimit" result will be "100.0GB"
    Then I will see the "timeOfValidity" result will be "<time>"
    Then I will see the "support" result will be "<support>"

    Examples:
      | time                                     |support|
      |2020/01/16 17:08:17 — 2020/10/22 12:00:00 |BeneficiaryIncidentActionLynxeeAppsStatisticModelDashboardBackupIngestPriorityMachineLearningPivotGalaxeeSearchOfflineSearchAlertScheduleKnowledgeTopologyAgentConfigurationFieldExtractReportIndexManagementAPIIngest   |


