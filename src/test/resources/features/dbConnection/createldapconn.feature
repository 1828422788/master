Feature: 新建ldap连接配置

  @newldap
  Scenario Outline: 新建ldap配置-1个
    Given open the "dbConnection.LdapConnPage" page for uri "/ldapconnection/"

    And I click the "CreateLdapConn" button

    And I wait for loading complete
    And I wait for "2000" millsecond

    And I set the parameter "NewLdapConnName" with value "ldpconn"
#    And I set the parameter "NewBaseDName" with value "<NewBaseDName>"
#    And I set the parameter "NewLdapHost" with value "<NewLdapHost>"
#    And I set the parameter "NewLdapConnPort" with value "<NewLdapConnPort>"
#    And I set the parameter "NewBindDnName" with value "<NewBindDnName>"
#    And I set the parameter "LdapUserPassword" with value "<LdapUserPassword>"
#    And I click the "LdapConnVerifyButton" button
    And I click the "SaveButtton" button
    And I wait for element "SearchStatus" change text to "保存成功"

    Examples:
      | NewLdapConnName | NewBaseDName      | NewLdapHost   | NewLdapConnPort | NewBindDnName | LdapUserPassword |
      | ldpconn         | dc=example,dc=org | 192.168.1.221 | 389            | cn=admin,dc=example,dc=org         | admin |