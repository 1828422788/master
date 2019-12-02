Feature: 权限-搜索权限

  Scenario Outline: 无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索权限"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'搜索权限'}" button
    And I wait for loading invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    Then I will see the search result "{'column':'1','name':'<name>','contains':'no'}"

    Examples:
      | name           |
      | AutoTestSearch |

  Scenario Outline: 仅授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索权限"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'搜索权限'}" button
    And I wait for loading invisible
    And I "checked" the label before "<name>"
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看授权" button

    Examples:
      | name           |
      | AutoTestSearch |

