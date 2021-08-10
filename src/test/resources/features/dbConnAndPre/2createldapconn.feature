Feature: 新建ldap连接配置

  @newldapconn @autoui01
  Scenario Outline: 新建ldap配置-3个
    Given open the "dbConnectionPre.LdapConnListPage" page for uri "/ldapconnection/"
    And I click the "CreateLdapConn" button

    Then I will see the "dbConnectionPre.EditPage" page

    And I wait for loading complete
    And I wait for "2000" millsecond

    And I set the parameter "NewLdapConnName" with value "<NewLdapConnName>"
    And I set the parameter "NewBaseDName" with value "<NewBaseDName>"
    And I set the parameter "NewLdapHost" with value "<NewLdapHost>"
    And I set the parameter "NewLdapConnPort" with value "<NewLdapConnPort>"
    And I set the parameter "NewBindDnName" with value "<NewBindDnName>"
    And I set the parameter "LdapUserPassword" with value "<LdapUserPassword>"
    And I click the "LdapConnVerifyButton" button
    And I click the "SaveButton" button
    Then I will see the success message "创建成功"


    Examples:
      | NewLdapConnName | NewBaseDName      | NewLdapHost   | NewLdapConnPort | NewBindDnName              | LdapUserPassword |
      | ldpconnsample   | dc=example,dc=org | 192.168.1.221 | 389             | cn=admin,dc=example,dc=org | admin            |
      | update_ldpconn  | dc=example,dc=org | 192.168.1.221 | 389             | cn=admin,dc=example,dc=org | admin            |
      | del_ldpconn     | dc=example,dc=org | 192.168.1.221 | 389             | cn=admin,dc=example,dc=org | admin            |

  @delldapconn
  Scenario Outline: 删除ldap连接
    Given open the "dbConnectionPre.LdapConnListPage" page for uri "/ldapconnection/"
    And I wait for "1000" millsecond

    When I set the parameter "LdapConnNameSearchInput" with value "<LdapConnName>"
    And I click the "DelLdapConnButton" button
    And I wait for "AffirmDelLdapConnButton" will be visible
    And I click the "AffirmDelLdapConnButton" button

    Examples:
      | LdapConnName |
      | del_ldpconn  |

