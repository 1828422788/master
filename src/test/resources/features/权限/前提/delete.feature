Feature: 删除基本用户

  Scenario Outline: 删除用户分组
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"

    Examples:
      | name          |
      | AutoTestGroup |
      | 验证授权用户分组      |

  Scenario Outline: 删除用户
    Given open the "users.ListPage" page for uri "/account/users/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"

    Examples:
      | name     |
      | AutoTest |
      | 验证授权用户   |

  Scenario: 删除搜索权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    When the data name is "{'column':'1','name':'SearchAuth'}" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

