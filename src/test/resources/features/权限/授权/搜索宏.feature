@authtest1
Feature: 权限-搜索宏

  Scenario Outline: 勾选所需功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    And I click the "Resource" button
    And I wait for "1000" millsecond
    When I "checked" the checkbox which name is "可查看搜索宏,可查看仪表盘"
    When I "unchecked" the checkbox which name is "新建宏"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario: 验证无新建权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And I will see the "Create" doesn't exist
    Then I logout current user

  Scenario: 授权新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    And I click the "Resource" button
    When I "checked" the checkbox which name is "新建宏"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证新建权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoTestUserCreate"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "保存成功"
    Then I logout current user

  Scenario: 授权无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "AutoTestUserCreate" in auth table
    And I "unchecked" the checkbox which name is "AutoTestUserCreate" in auth table
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证无读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I will see the search result "{'column':'0','name':'AutoTestUserCreate','contains':'no'}"
    Then I logout current user

  Scenario: 授权读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "AutoTestUserCreate" in auth table
    And I "unchecked" the checkbox which name is "AutoTestUserCreate" in auth table
    When I "checked" function "读取" from the auth table which name is "AutoTestUserCreate"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

  @logout
  Scenario: 验证读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "AutoTestUserCreate" then i will see "授权" button
    And the data name is "AutoTestUserCreate" then i click the "授权" button
    And I wait for loading invisible
    And I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

  Scenario: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "AutoTestUserCreate" in auth table
    When I "unchecked" function "删除,转授" from the auth table which name is "AutoTestUserCreate"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario Outline: 验证读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "编辑标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "AutoTestUserCreate" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoTestRename"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"
    Then I logout current user

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name           |
      | AutoTestRename |

  Scenario Outline: 验证读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "编辑标签授权删除" button
    When the data name is "<name>" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "searchMacro.CreatePage" page
    And I wait for "1000" millsecond
    When I set the parameter "Name" with value "AutoTestCreate"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "AutoTestCreate" then i click the "删除" button
    And I wait for "Ensure" will be visible
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "删除成功"
    Then I logout current user

    Examples:
      | name           |
      | AutoTestRename |

  Scenario: 新建拓扑图以测试读取+删除
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoTestUserCreate"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

  Scenario: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "AutoTestUserCreate" in auth table
    When I "unchecked" function "编辑,转授" from the auth table which name is "AutoTestUserCreate"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证读取+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "AutoTestUserCreate" then i will see "授权删除" button
    And the data name is "AutoTestUserCreate" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "AutoTestUserCreate" then i click the "删除" button
    And I wait for "Ensure" will be visible
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "删除成功"
    Then I logout current user

  Scenario: 新建拓扑图以测试读取+转授
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoTest"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

  Scenario Outline: 授权读取+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 验证读取+转授
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "授权" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i will see "授权" button
    Then I logout current user

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 授权读取+编辑+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 验证读取+编辑+转授
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "编辑标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "uncheck" the checkbox which name is "验证授权用户" in tiny table
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "编辑标签授权" button
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "searchMacro.CreatePage" page
    And I wait for "1000" millsecond
    When I set the parameter "Name" with value "AutoTestCreate"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then I logout current user

    Examples:
      | name     |
      | AutoTest |

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "AutoTestCreate" in auth table
    When the data name is "AutoTestCreate" then I click the "无限期" button in auth table
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario: 新建
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoTest"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 验证所有权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "编辑标签授权删除" button
    When the data name is "<name>" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "编辑标签授权删除" button
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "searchMacro.CreatePage" page
    And I wait for "1000" millsecond
    When I set the parameter "Name" with value "AutoTestRename"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"
    Then I logout current user

    Examples:
      | name     |
      | AutoTest |

  Scenario: 新建搜索宏以测试二次授权
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "测试二次授权"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

  Scenario: 给AutoTest用户授权
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    When the data name is "测试二次授权" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Then I logout current user

  Scenario Outline: 二次授权读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "授权" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Then I logout current user

    Examples:
      | authRole | authName | function | name   |
      | 用户       | 验证授权用户   | 读取       | 测试二次授权 |

  Scenario Outline: 二次授权读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "编辑标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "测试二次授权"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"
    Then I logout current user

    Examples:
      | authRole | authName        | function | name   |
      | 角色       | __user_验证授权用户__ | 编辑       | 测试二次授权 |

  Scenario Outline: 二次授权读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "编辑标签授权删除" button
    When the data name is "<name>" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "searchMacro.CreatePage" page
    And I wait for "1000" millsecond
    When I set the parameter "Name" with value "测试二次授权"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "测试二次授权" then i click the "删除" button
    And I wait for "Ensure" will be visible
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "删除成功"
    Then I logout current user

    Examples:
      | authRole | authName | function | name   |
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | 测试二次授权 |

  @logout
  Scenario: 验证有效期限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then I will see the search result "{'column':'0','name':'AutoTestCreate','contains':'no'}"
    Then I logout current user

  Scenario Outline: 授权读取+删除+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 验证读取+删除+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 验证读取+删除+转授
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "授权删除" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "授权删除" button
    And the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "删除成功"
    Then I logout current user

    Examples:
      | name           |
      | AutoTestCreate |
