@tenant
Feature: 租户新建（RZY-1691）
  Background:
    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"

  @tenantSmoke
  Scenario Outline: 保存成功
#    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
    When I set the parameter "Username" with properties "saas_username"
    And I set the parameter "Password" with properties "saas_password"
    And I click the "LoginButton" button
    And I will see the "tenant.ListPage" page
    And I click the "CreateButton" button
    Then I will see the "tenant.CreatePage" page

    And I set the parameter "Name" with value "<name>"
    And I set the parameter "DomainName" with value "<domainName>"
    And I choose the "<supportFeature>" from the "supportFeature"

    And I set the parameter "DailyLimit" with value "<dailyLimit>"
    And I set the parameter "uploadLimit" with value "<uploadLimit>"
    And I set the parameter "ExcessLimit" with value "<excessLimit>"

    And I choose the "<excessBehavior>" from the "ExcessBehavior"

    And I set the parameter "ManagerName" with value "<managerName>"
    And I set the parameter "ManagerEmail" with value "<managerEmail>"
    And I set the parameter "ManagerPassword" with value "<managerPassword>"
    And I set the parameter "InputAgain" with value "<inputAgain>"

    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
  #  Then I wait for "SuccessMessage" will be visible

    Examples:
      | name  | domainName | supportFeature                                                                                                                                                                                                                        | dailyLimit |uploadLimit| excessLimit | excessBehavior | managerName | managerEmail       | managerPassword | inputAgain |
      | first | firstdomain| API,AgentConfiguration,Alert,Apps,Backup,Beneficiary,Dashboard,FieldExtract,Galaxee,IncidentAction,IndexManagement,Ingest,IngestPriority,Knowledge,MachineLearning,OfflineSearch,Pivot,Report,Schedule,Search,StatisticModel,Topology | 1          | 10        |3            | 拒绝采集输入     | first       | first@yottabyte.cn | All#123456      | All#123456  |

  @tenantSmoke
  Scenario Outline: 新建autotest域
#    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
#    When I set the parameter "Username" with properties "saas_username"
#    And I set the parameter "Password" with properties "saas_password"
#    And I click the "LoginButton" button
    And I will see the "tenant.ListPage" page
    And I click the "CreateButton" button
    Then I will see the "tenant.CreatePage" page

    And I set the parameter "Name" with value "<name>"
    And I set the parameter "DomainName" with value "<domainName>"
    And I choose the "<supportFeature>" from the "supportFeature"

    And I set the parameter "DailyLimit" with value "<dailyLimit>"
    And I set the parameter "uploadLimit" with value "<uploadLimit>"
    And I set the parameter "ExcessLimit" with value "<excessLimit>"

    And I choose the "<excessBehavior>" from the "ExcessBehavior"

    And I set the parameter "ManagerName" with value "<managerName>"
    And I set the parameter "ManagerEmail" with value "<managerEmail>"
    And I set the parameter "ManagerPassword" with value "<managerPassword>"
    And I set the parameter "InputAgain" with value "<inputAgain>"

    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
#    Then I wait for "SuccessMessage" will be visible
    Examples:
      | name  | domainName | supportFeature                                                                                                                                                                                                                        | dailyLimit | uploadLimit|excessLimit | excessBehavior | managerName | managerEmail        | managerPassword | inputAgain |
      | atesta| autotesta   | API,AgentConfiguration,Alert,Apps,Backup,Beneficiary,Dashboard,FieldExtract,Galaxee,IncidentAction,IndexManagement,Ingest,IngestPriority,Knowledge,MachineLearning,OfflineSearch,Pivot,Report,Schedule,Search,StatisticModel,Topology | 1          | 5           |3           | 拒绝采集输入   | atesta      | atesta@yottabyte.cn | All#123456      | All#123456  |


  Scenario Outline: 保存失败
#    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
#    When I set the parameter "Username" with properties "saas_username"
#    And I set the parameter "Password" with properties "saas_password"
#    And I click the "LoginButton" button
    And I will see the "tenant.ListPage" page
    And I click the "CreateButton" button
    Then I will see the "tenant.CreatePage" page

    And I set the parameter "Name" with value "<name>"
    And I set the parameter "DomainName" with value "<domainName>"
    And I choose the "<supportFeature>" from the "supportFeature"

    And I set the parameter "DailyLimit" with value "<dailyLimit>"
    And I set the parameter "uploadLimit" with value "<uploadLimit>"
    And I set the parameter "ExcessLimit" with value "<excessLimit>"

    And I choose the "<excessBehavior>" from the "ExcessBehavior"

    And I set the parameter "ManagerName" with value "<managerName>"
    And I set the parameter "ManagerEmail" with value "<managerEmail>"
    And I set the parameter "ManagerPassword" with value "<managerPassword>"
    And I set the parameter "InputAgain" with value "<inputAgain>"

    And I click the "SaveButton" button
    Then I will see the success message "<message>"


    Examples:
      | name | domainName         | supportFeature | dailyLimit | uploadLimit | excessLimit | excessBehavior | managerName  | managerEmail       | managerPassword | inputAgain | message|
      |      |                    |                |            |             |             |                |              |                    |                 |            | 名称 不能为空 |
      | test |                    |                |            |             |             |                |              |                    |                 |            | 域名 不能为空 |
      | test | test               |                |            |             |             |                |              |                    |                 |            | 支持特性 不能为空 |
      | test | test               | API            |            |             |             |                |              |                    |                 |            | 每日限额 不能为空 |
      | test | test               | API            | 1          |2            |             |                |              |                    |                 |            | 超额次数限定 不能为空|
      | test | test               | API            | 1          |             | 1           |                |              |                    |                 |            | 超额行为 不能为空   |
      | test | test               | API            | 1          | 2           | 1           | 拒绝采集输入     |              |                    |                 |            | 管理员名称 不能为空  |
      | test | test               | API            | 1          | 2           | 1           | 拒绝采集输入     | test         |                    |                 |            | 管理员邮箱 不能为空  |
      | test | test               | API            | 1          |  2          | 1           | 拒绝采集输入     | test         | test               |                 |            | 邮箱地址 不合法 |
      | test | test               | API            | 1          | 2           | 1           | 拒绝采集输入     | test         | tools@yottabyte.cn |                 |            | 密码需满足：8-16个字符 |
      | test | test               | API            | 1          | 2           | 1           | 拒绝采集输入     | test         | tools@yottabyte.cn | 12345678        | 12345678   | 密码需满足：至少包含数字和字母|
      | test | test               | API            | 1          |  2          | 1           | 拒绝采集输入     | test         | tools@yottabyte.cn | 12345678a       |            | 密码不一致  |
      | test | testtemp           | API            | 1          | 2            | 1           | 拒绝采集输入     | test         | atest@yottabyte.cn | 12345678a       | 12345678a | 邮件名已存在\n错误码: FE_533|
      | test | Test               | API            | 1          |  2           | 1           | 拒绝采集输入     | test         | tools@yottabyte.cn | 12345678a       | 12345678a | 域名只支持小写字母、数字、下划线，且不能以下划线开头，长度小于10 |
      | test | auto_testa         | API            | 1          |  2           | 1           | 拒绝采集输入     | test         | tools@yottabyte.cn | 12345678a       | 12345678a |域名已存在\n错误码: FE_531  |
      | test | auto_testauto_test | API            | 1          |  2           | 1           | 拒绝采集输入     | test         | tools@yottabyte.cn | 12345678a       | 12345678a | 域名只支持小写字母、数字、下划线，且不能以下划线开头，长度小于10 |
      | test | test               | API            | 200000001  |   2          | 1           | 拒绝采集输入     | test         | tools@yottabyte.cn | 12345678a       | 12345678a | 每日限额 需小于 8388608GB |
      | test | test               | API            | 1          |  2           | 2147483648  | 拒绝采集输入     | test         | tools@yottabyte.cn | 12345678a       | 12345678a | 超额次数限定 需小于 2147483647 |
