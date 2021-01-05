@cleare0
Feature: 新建数据库连接配置

  @deldblookup @cleare0
  Scenario Outline: 删除连接-3
    Given open the "dbConnectionPre.DbOutputPage" page for uri "/dbsettings/"
    And I click the "DbLookupConfig" button
    And I wait for "1000" millsecond

    When I set the parameter "DbLookupSearchInput" with value "<dbLookupName>"
    And I click the "DelDbLookupButton" button
    And I wait for "AffirmDelDbLookupButton" will be visible
    And I click the "AffirmDelDbLookupButton" button

    Examples:
      | dbLookupName |
      | outsample |
      | outsample_u |
      | deloutsample |

  @deldblookup @cleare0
  Scenario Outline: 删除连接-3
    Given open the "dbConnectionPre.dbSettingPage" page for uri "/dbsettings/"
    And I click the "DbLookupConfig" button
    And I wait for "1000" millsecond

    When I set the parameter "DbLookupSearchInput" with value "<dbLookupName>"
    And I click the "DelDbLookupButton" button
    And I wait for "AffirmDelDbLookupButton" will be visible
    And I click the "AffirmDelDbLookupButton" button

    Examples:
      | dbLookupName |
      | lookupsample |
      | dellookupsample |
      | u_lookupsample |

  @delconn @cleare0
  Scenario Outline: 删除连接
    Given open the "dbConnectionPre.dbSettingPage" page for uri "/dbsettings/"
    And I click the "DbConnConfig" button
    And I wait for "1000" millsecond

    When I set the parameter "DbConnNameSearchInput" with value "<DbConnName>"
    And I click the "DelDbConnNameButton" button
    And I wait for "AffirmDelDbConnNameButton" will be visible
    And I click the "AffirmDelDbConnNameButton" button

    Examples:
      | DbConnName |
      | v33dbx        |
      | delv33dbx    |
      | editv33dbx    |
      | v33vertica    |

  @cleare0 @delldapconn
  Scenario Outline: 删除ldap连接
    Given open the "dbConnectionPre.LdapConnListPage" page for uri "/ldapconnection/"
    And I wait for "1000" millsecond

    When I set the parameter "LdapConnNameSearchInput" with value "<LdapConnName>"
    And I click the "DelLdapConnButton" button
    And I wait for "AffirmDelLdapConnButton" will be visible
    And I click the "AffirmDelLdapConnButton" button

    Examples:
      | LdapConnName     |
      | ldpconnsamplessl |
      | update_ldpconn   |
      | ldpconnsample    |


