@authtest1
Feature: 权限-搜索权限

  Scenario Outline: 授权所需功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    And I click the "Resource" button
    When I "checked" the checkbox which name is "可查看仪表盘"
    And I wait for "1000" millsecond
    And I click the "Data" button
    And I wait for "1000" millsecond
    When I "checked" the checkbox which name is "可查看搜索权限"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索权限'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "SearchAuth" in auth table
    When the data name is "SearchAuth" then I click the "无限期" button in auth table
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario: 新建搜索权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I click the "Create" button
    And I set the parameter "Name" with value "测试二次授权"
    And I set the parameter "Appname" with value "*"
    And I click the "Ensure" button
    Then I will see the success message "操作成功"

  Scenario Outline: 授权无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索权限'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button

    Examples:
      | name   |
      | 测试二次授权 |

  Scenario Outline: 验证无读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"
    Then I logout current user

    Examples:
      | name   |
      | 测试二次授权 |

  Scenario Outline: 授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索权限'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button

    Examples:
      | name   |
      | 测试二次授权 |

  Scenario Outline: 验证读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "查看授权" button
    And the data name is "{'column':'0','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

    Examples:
      | name   |
      | 测试二次授权 |

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索权限'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button

    Examples:
      | name   |
      | 测试二次授权 |

  Scenario Outline: 验证所有权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "查看授权" button
    And the data name is "{'column':'0','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "查看授权" button
    Then I logout current user

    Examples:
      | name   |
      | 测试二次授权 |

  Scenario: 给AutoTest授权所有权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And the data name is "{'column':'0','name':'测试二次授权'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  Scenario Outline: 二次授权读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "查看授权" button
    And the data name is "{'column':'0','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Then I logout current user

    Examples:
      | authRole | authName | function | name   |
      | 用户       | 验证授权用户   | 读取       | 测试二次授权 |

  Scenario: 验证有效期限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'SearchAuth','contains':'no'}"
    Then I logout current user

  Scenario: 还原SearchAuth权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索权限'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "SearchAuth" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario: 删除二次授权
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    And the data name is "{'column':'0','name':'测试二次授权'}" then i click the "删除" button
    And I click the "Ensure" button