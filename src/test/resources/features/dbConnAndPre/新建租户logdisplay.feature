Feature: 租户系统-租户新建
  Background:
    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"

  @logdisplay
  Scenario Outline: 新建logdisplay域
#    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
#    When I set the parameter "Username" with properties "admin"
#    And I set the parameter "Password" with properties "admin@rizhiyi.com"
#    And I click the "LoginButton" button

    And I will see the "tenant.ListPage" page
    And I click the "CreateButton" button
    Then I will see the "tenant.CreatePage" page

    And I set the parameter "tenantName" with value "<name>"
    And I set the parameter "DomainName" with value "<domainName>"
    And I choose the "<supportFeature>" from the "SupportFeatureList"

    And I set the parameter "DailyLimit" with value "<dailyLimit>"
    And I set the parameter "uploadLimit" with value "<uploadLimit>"
    And I set the parameter "ExcessLimit" with value "<excessLimit>"

    And I choose the "<excessBehavior>" from the "ExcessBehaviorList"

    And I set the parameter "ManagerName" with value "<managerName>"
    And I set the parameter "ManagerEmail" with value "<managerEmail>"
    And I set the parameter "ManagerPassword" with value "<managerPassword>"
    And I set the parameter "InputAgain" with value "<inputAgain>"

    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
#    Then I wait for "SuccessMessage" will be visible
    Examples:
      | name  | domainName | supportFeature                                                                                                                                                                                                                        | dailyLimit | uploadLimit|excessLimit | excessBehavior | managerName | managerEmail        | managerPassword | inputAgain |
      | logdisplay| logdisplay   | API,AgentConfiguration,Alert,Apps,Backup,Beneficiary,Dashboard,FieldExtract,Galaxee,IncidentAction,IndexManagement,Ingest,IngestPriority,Knowledge,MachineLearning,OfflineSearch,Pivot,Report,Schedule,Search,StatisticModel,Topology | 100         | 5           |3           | 拒绝采集输入   | logdisplay      | atestc@yottabyte.cn | All#123456      | All#123456  |

