Feature: 导入监控用例，新建sslldap配置

  @upres1 @pre00
  Scenario:执行导入
    When open the "dbConnectionPre.ResListPage" page for uri "/resource/"
#    Then I wait for "ImportAndExportButton" will be visible
    Then I wait for loading complete
    And I click the "ImportAndExportButton" button
    And I click the "ImportButton" button

    Then I will see the "dbConnectionPre.ImportResPage" page
    And I wait for "AddDataset" will be visible
    And I wait for "2000" millsecond
    When I upload a file "Upload" with name "/src/test/resources/testdata/app/v35资源包监控60个.tar"
    And I wait for "2000" millsecond

    And I choose the "__admin__" from the "RoleList"
    And I click the "NextButton" button

    And I click the "CompleteButton" button
#    And I wait for "Message" will be visible
    And I wait for "AddSuccMessage" will be visible

  @pre00 @newldapconnssl
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
    And I click the "SaveButton" button

    Examples:
      | NewLdapConnName  | NewBaseDName      | NewLdapHost   | NewLdapConnPort | NewBindDnName              | LdapUserPassword |
      | ldpconnsamplessl | dc=example,dc=org | 192.168.1.221 | 636             | cn=admin,dc=example,dc=org | admin            |
