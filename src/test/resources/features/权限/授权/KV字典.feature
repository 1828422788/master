@auth
Feature: 权限-KV字典

  Scenario: 新建拓扑图
    Given open the "topology.ListPage" page for uri "/topology/"
    When I click the "Create" button
    And I set the parameter "NameInput" with value "KV字典所用"
    And I click the "Ensure" button

  Scenario Outline: 新建app
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    Given delete file "/target/download-files/<name>.tar"
    And I set the parameter "NameInput" with value "<name>"
    And I click the "AddResource" button
    And I set the parameter "SearchResourceInput" with value "KV字典所用"
    And I wait for "SearchLoading" will be invisible
    And I "check" the checkbox which name is "KV字典所用" in tiny table
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I wait for "MenuName" will be visible
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    And I choose the "<menuName>" from the "DefaultPage"
    And I click the "CurrentApp" button
    And I click the "CreateButton" button under some element
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name     | menuName | url         |
      | KV字典权限测试 | 仪表盘      | /dashboard/ |

  Scenario Outline: 安装资源成功
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/target/download-files/<appName>.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__admin__" from the "Role"
    And I click the "NextButton" button under some element
    And I click the "NextButton" button
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName  |
      | KV字典权限测试 |

  Scenario: 授权可查看KV字典，无可新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "创建KV字典"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario: 验证无新建权限
    Given open the "LoginPage" page for uri "/dashboard/"
    And I wait for title change text to "仪表盘"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "kv.ListPage" page for uri "/kvstores/"
    Then I will see the "Create" doesn't exist

  Scenario: 授权新建
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'应用'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "KV字典权限测试" in auth table
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

  Scenario: 验证新建
    Given open the "LoginPage" page for uri "/dashboard/"
    And I wait for title change text to "仪表盘"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "kv.ListPage" page for uri "/kvstores/"
    And I click the "Create" button
    Then I will see the "kv.CreatePage" page
    And I set the parameter "Name" with value "AuthTest"
    And I choose the "KV字典权限测试" from the "App"
    And I set the parameter "FieldList" with value "authlist"
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"

  Scenario Outline: 无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'KV字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name     |
      | AuthTest |

  Scenario: 验证无读取权限
    Given open the "LoginPage" page for uri "/dashboard/"
    And I wait for title change text to "仪表盘"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "kv.ListPage" page for uri "/kvstores/"
    Then I will see the search result "{'column':'0','name':'AuthTest','contains':'no'}"

  Scenario Outline: 授权读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'KV字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name     |
      | AuthTest |

  Scenario Outline: 验证读取
    Given open the "LoginPage" page for uri "/dashboard/"
    And I wait for title change text to "仪表盘"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "kv.ListPage" page for uri "/kvstores/"
    Then the data name is "<name>" then i will see "查看授权" button
    When the data name is "<name>" then i click the "查看" button
    Then I will see the element "Name" value is "<name>"
    Given open the "kv.ListPage" page for uri "/kvstores/"
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

    Examples:
      | name     |
      | AuthTest |

  Scenario Outline: 授权读取+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'KV字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I "checked" function "读取,编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name     |
      | AuthTest |

  Scenario Outline: 验证读取+编辑权限
    Given open the "LoginPage" page for uri "/dashboard/"
    And I wait for title change text to "仪表盘"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "kv.ListPage" page for uri "/kvstores/"
    Then the data name is "<name>" then i will see "查看标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"
    When the data name is "<name>" then i click the "查看" button
    Then I will see the element "Name" value is "<name>"
    Given open the "kv.ListPage" page for uri "/kvstores/"
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

    Examples:
      | name     |
      | AuthTest |

  Scenario Outline: 授权读取+编辑+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'KV字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name     |
      | AuthTest |

  Scenario Outline: 验证读取+编辑+转授权限
    Given open the "LoginPage" page for uri "/dashboard/"
    And I wait for title change text to "仪表盘"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "kv.ListPage" page for uri "/kvstores/"
    Then the data name is "<name>" then i will see "查看标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"
    When the data name is "<name>" then i click the "查看" button
    Then I will see the element "Name" value is "<name>"
    Given open the "kv.ListPage" page for uri "/kvstores/"
    When the data name is "<name>" then i click the "授权" button
    When I "check" the function "读取" which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

    Examples:
      | name     |
      | AuthTest |

  Scenario Outline: 验证二次授权读取
    Given open the "LoginPage" page for uri "/dashboard/"
    And I wait for title change text to "仪表盘"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "kv.ListPage" page for uri "/kvstores/"
    Then the data name is "<name>" then i will see "查看授权" button
    When the data name is "<name>" then i click the "查看" button
    Then I will see the element "Name" value is "<name>"
    Given open the "kv.ListPage" page for uri "/kvstores/"
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled

    Examples:
      | name     |
      | AuthTest |

  Scenario Outline: 授权二次读取+编辑
    Given open the "LoginPage" page for uri "/dashboard/"
    And I wait for title change text to "仪表盘"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "kv.ListPage" page for uri "/kvstores/"
    When the data name is "<name>" then i click the "授权" button
    And I choose the "角色" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "读取,编辑" which name is "__user_验证授权用户__" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

    Examples:
      | name     |
      | AuthTest |

  Scenario Outline: 验证二次授权读取+编辑权限
    Given open the "LoginPage" page for uri "/dashboard/"
    And I wait for title change text to "仪表盘"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "kv.ListPage" page for uri "/kvstores/"
    Then the data name is "<name>" then i will see "查看标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"
    When the data name is "<name>" then i click the "查看" button
    Then I will see the element "Name" value is "<name>"
    Given open the "kv.ListPage" page for uri "/kvstores/"
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled

    Examples:
      | name     |
      | AuthTest |

  Scenario Outline: 授权二次读取+编辑+转授
    Given open the "LoginPage" page for uri "/dashboard/"
    And I wait for title change text to "仪表盘"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "kv.ListPage" page for uri "/kvstores/"
    When the data name is "<name>" then i click the "授权" button
    And I choose the "用户分组" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "读取,编辑,转授" which name is "验证授权用户分组" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

    Examples:
      | name     |
      | AuthTest |

  Scenario Outline: 仅授权AutoTest读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'KV字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name     |
      | AuthTest |

  Scenario Outline: 验证二次授权读取+编辑+转授权限
    Given open the "LoginPage" page for uri "/dashboard/"
    And I wait for title change text to "仪表盘"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "kv.ListPage" page for uri "/kvstores/"
    Then the data name is "<name>" then i will see "查看标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"
    When the data name is "<name>" then i click the "查看" button
    Then I will see the element "Name" value is "<name>"
    Given open the "kv.ListPage" page for uri "/kvstores/"
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the function "读取,编辑,转授" which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

    Examples:
      | name     |
      | AuthTest |

  Scenario Outline: 验证二次授权的授权生效
    Given open the "LoginPage" page for uri "/dashboard/"
    And I wait for title change text to "仪表盘"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "kv.ListPage" page for uri "/kvstores/"
    Then the data name is "<name>" then i will see "查看标签授权" button

    Examples:
      | name     |
      | AuthTest |

  Scenario Outline: 授权有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'KV字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When the data name is "<name>" then I click the "无限期" button in auth table
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name     |
      | AuthTest |

  Scenario Outline: 新建并授权所有权限
    Given open the "kv.ListPage" page for uri "/kvstores/"
    And I click the "Create" button
    Then I will see the "kv.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I choose the "KV字典权限测试" from the "App"
    And I set the parameter "FieldList" with value "authlist"
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'KV字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name        |
      | TestForAuth |

  Scenario Outline: 验证所有权限及有效期限
    Given open the "LoginPage" page for uri "/dashboard/"
    And I wait for title change text to "仪表盘"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "kv.ListPage" page for uri "/kvstores/"
    Then the data name is "<name>" then i will see "查看标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"
    When the data name is "<name>" then i click the "查看" button
    Then I will see the element "Name" value is "<name>"
    Given open the "kv.ListPage" page for uri "/kvstores/"
    When the data name is "<name>" then i click the "授权" button
    When I "check" the function "读取,删除" which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given open the "kv.ListPage" page for uri "/kvstores/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Message" will be visible
    Then I will see the message "删除成功"
    Given open the "kv.ListPage" page for uri "/kvstores/"
    Then I will see the search result "{'column':'0','name':'AuthTest','contains':'no'}"

    Examples:
      | name        |
      | TestForAuth |

  Scenario Outline: 删除KV字典
    Given open the "kv.ListPage" page for uri "/kvstores/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Message" will be visible
    Then I will see the message "删除成功"

    Examples:
      | name     |
      | AuthTest |

  Scenario Outline: 删除拓扑图资源
    Given open the "topology.ListPage" page for uri "/topology/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button

    Examples:
      | name   |
      | KV字典所用 |
      | KV字典所用 |

  Scenario Outline: 删除app
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name     |
      | KV字典权限测试 |