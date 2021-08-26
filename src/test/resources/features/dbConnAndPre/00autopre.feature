@pre00
Feature: 导入监控用例，新建sslldap配置

  @upres1
  Scenario Outline:执行导入
    When open the "dbConnectionPre.ResListPage" page for uri "/resource/"
#    Then I wait for "ImportAndExportButton" will be visible
    Then I wait for loading complete
    And I click the "ImportAndExportButton" button
    And I click the "ImportButton" button

    Then I will see the "dbConnectionPre.ImportResPage" page
    And I wait for "AddDataset" will be visible
    And I wait for "2000" millsecond
    When I upload a file "Upload" with name "<appPath>"
    And I wait for "2000" millsecond

    And I choose the "__admin__" from the "RoleList"
    And I click the "NextButton" button

    And I click the "CompleteButton" button
#    And I wait for "Message" will be visible
    And I wait for "AddSuccMessage" will be visible

    Examples:
      | appPath                                          |
      | /src/test/resources/testdata/app/v35资源包监控60个.tar |
      | /src/test/resources/testdata/app/alertadd.tar |


  @newldapconnssl
  Scenario Outline: 新建ssl ldap配置-1个
    Given open the "dbConnectionPre.LdapConnListPage" page for uri "/ldapconnection/"
    And I click the "CreateLdapConn" button

    Then I will see the "dbConnectionPre.EditPage" page
    And I wait for loading complete
    And I wait for "2000" millsecond

    And I set the parameter "NewLdapConnName" with value "<NewLdapConnName>"
    And I set the parameter "NewBaseDName" with value "<NewBaseDName>"
    And I set the parameter "NewLdapHost" with value "<NewLdapHost>"
    And I set the parameter "NewLdapConnPort" with value "<NewLdapConnPort>"
    And I click the "LdapSSlOnOff" button

    When I upload a file "Upload" with name "/src/test/resources/testdata/app/ca.crt"

    And I set the parameter "NewBindDnName" with value "<NewBindDnName>"
    And I set the parameter "LdapUserPassword" with value "<LdapUserPassword>"
    And I click the "LdapConnVerifyButton" button
    And I click1 the "SaveButton" button
    Given I wait for loading complete
    Then I will see the message contains "创建成功"
    And I click the "ConfirmButton" button

    Examples:
      | NewLdapConnName  | NewBaseDName      | NewLdapHost   | NewLdapConnPort | NewBindDnName              | LdapUserPassword |
      | ldpconnsamplessl | dc=example,dc=org | 192.168.1.221 | 636             | cn=admin,dc=example,dc=org | admin            |


  @newresourcetag
  Scenario Outline: 创建宏，目的是创建一个资源标签，供UI自动化使用
    Given open the "macroSearch.ListPage" page for uri "/macro/"
    When I click the "CreateMacroButton" button
    Then I will see the "macroSearch.CreatePage" page
    And I wait for "2000" millsecond

    When I set the parameter "MacroName" with value "<name>"
    When I click the "MacroResTagList" button

    When I set the parameter "MacroResTagInput" with value "autoui001"
    And I choose the "autoui001" from the "MacroResTagList"

    And I set the parameter "Definition" with value "<definition>"
    And I set the parameter "ValidateExpression" with value "<validateExpression>"
    And I set the parameter "ValidateFalseInfo" with value "<validateFalseInfo>"
    And I wait for "2000" millsecond

    And I click the "SaveMacroButton" button
#    Then I will see the success message "保存成功"

    Examples: 新建成功
      | name        | definition         | validateExpression | validateFalseInfo |
      | resourcetag | tag:sample04061424 |                    |                   |


  @onalertpre00
  Scenario Outline: 启用监控
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading complete
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for "3000" millsecond

    When the data name is "{'column':'1','name':'<name>'}" then I "open" the switch
    And I wait for "3000" millsecond
    And I wait for loading complete

    Then I will see the element "{'column':'1','name':'<name>'}" is "open"

    Examples:
      | name          |
      | api00_all_事件数 |
      | api00_事件管理用例1 |
      | api00_事件管理用例2 |
      | api00_事件管理用例3 |