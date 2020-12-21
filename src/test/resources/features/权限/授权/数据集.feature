@authtest1
Feature: 权限-数据集

  Scenario Outline: 勾选所需功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    And I wait for "1000" millsecond
    When I "checked" the checkbox which name is "可查看数据集,可查看仪表盘"
    When I "unchecked" the checkbox which name is "新建数据集"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario: 验证无新建权限
    Given I login user "AutoTest" with password "All#123456"
    Given open the "dataset.ListPage" page for uri "/dataset/"
    Then I will see the "Create" doesn't exist
    Then I logout current user

  Scenario: 授权新建
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    And I wait for "1000" millsecond
    When I "checked" the checkbox which name is "新建数据集"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario Outline: 验证新建
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I click the "Create" button
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    And I wait for "1000" millsecond
    Then I logout current user

    Examples:
      | name     | alias |
      | AutoAuth | auth  |

  Scenario: 不授权任何权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'数据集'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "AutoAuth" in auth table
    And I "unchecked" the checkbox which name is "AutoAuth" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario: 验证无任何权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    Then I will see the search result "{'column':'0','name':'AutoAuth','contains':'no'}"
    Then I logout current user

  Scenario Outline: 仅授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'数据集'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button

    Examples:
      | name     |
      | AutoAuth |

  Scenario Outline: 验证读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    Then the data name is "<name>" then i will see "设为默认查看授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

    Examples:
      | name     |
      | AutoAuth |

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'数据集'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button

    Examples:
      | name     |
      | AutoAuth |

  Scenario Outline: 验证读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认编辑标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    And I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    And I click the "EditEvent" button
    And I set the parameter "EditName" with value "AutoAuthEdit"
    And I click the "Save" button
    Then I logout current user

    Examples:
      | name     |
      | AutoAuth |

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'数据集'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name         |
      | AutoAuthEdit |

  Scenario Outline: 验证读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认编辑标签删除授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "dataset.DetailPage" page
    And I click the "EditEvent" button
    And I set the parameter "EditName" with value "AutoAuth"
    And I click the "Save" button
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "AutoAuth" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除数据集成功"
    Then I logout current user

    Examples:
      | name         |
      | AutoAuthEdit |

  Scenario: 新建以测试读取+删除
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I click the "Create" button
    And I set the parameter "Name" with value "AutoAuth"
    And I set the parameter "Alias" with value "auth"
    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    Then I wait for "1000" millsecond

  Scenario Outline: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'数据集'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name     |
      | AutoAuth |

  Scenario Outline: 验证读取+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认查看删除授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除数据集成功"
    Then I logout current user

    Examples:
      | name     |
      | AutoAuth |

  Scenario: 新建以测试读取+授权
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I click the "Create" button
    And I set the parameter "Name" with value "AutoAuth"
    And I set the parameter "Alias" with value "auth"
    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    Then I wait for "1000" millsecond

  Scenario Outline: 授权读取+授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'数据集'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button

    Examples:
      | name     |
      | AutoAuth |

  Scenario Outline: 验证读取+授权
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "设为默认查看授权" button
    Then I logout current user

    Examples:
      | name     |
      | AutoAuth |

  Scenario Outline: 授权读取+编辑+授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'数据集'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name     |
      | AutoAuth |

  Scenario Outline: 验证读取+编辑+授权
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认编辑标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "编辑标签授权" button
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    And I click the "EditEvent" button
    And I set the parameter "EditName" with value "AutoAuthEdit"
    And I click the "Save" button
    Then I logout current user

    Examples:
      | name     |
      | AutoAuth |

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'数据集'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "AutoAuthEdit" in auth table
    When the data name is "AutoAuthEdit" then I click the "无限期" button in auth table
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button

  Scenario: 新建数据集
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I click the "Create" button
    And I set the parameter "Name" with value "AutoAuth"
    And I set the parameter "Alias" with value "AutoAuth"
    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    Then I wait for "1000" millsecond

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'数据集'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name     |
      | AutoAuth |

  Scenario Outline: 验证所有权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认编辑标签删除授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "编辑标签删除授权" button
    When the data name is "<name>" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "dataset.DetailPage" page
    And I click the "EditEvent" button
    And I set the parameter "EditName" with value "AutoAuthForEdit"
    And I click the "Save" button
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "AutoAuthForEdit" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除数据集成功"
    Then I logout current user

    Examples:
      | name     |
      | AutoAuth |

  Scenario: 新建
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I click the "Create" button
    And I set the parameter "Name" with value "测试二次授权"
    And I set the parameter "Alias" with value "testTwice"
    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    Then I wait for "1000" millsecond

  Scenario: 给AutoTest用户授权
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "测试二次授权" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"

  Scenario Outline: 二次授权读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
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
    Given open the "dataset.ListPage" page for uri "/dataset/"
    Then the data name is "<name>" then i will see "设为默认查看授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled

    Examples:
      | authRole | authName | function | name   |
      | 用户       | 验证授权用户   | 读取       | 测试二次授权 |

  Scenario Outline: 二次授权读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认编辑标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    And I wait for loading invisible
    And I will see the "dataset.DetailPage" page
    And I click the "EditEvent" button
    And I set the parameter "EditName" with value "<name>Edit"
    And I click the "Save" button

    Examples:
      | authRole | authName        | function | name   |
      | 角色       | __user_验证授权用户__ | 编辑       | 测试二次授权 |

  Scenario Outline: 二次授权读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认编辑标签删除授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    And I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    And I click the "EditEvent" button
    And I set the parameter "EditName" with value "测试二次授权EditAgain"
    And I click the "Save" button
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "测试二次授权EditAgain" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除数据集成功"

    Examples:
      | authRole | authName | function | name       |
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | 测试二次授权Edit |

  Scenario: 验证有效期限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoAuthEdit','contains':'no'}"
    Then I logout current user

  Scenario Outline: 授权读取+删除+授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'数据集'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name         |
      | AutoAuthEdit |

  Scenario Outline: 授权读取+删除+授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'数据集'}" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name         |
      | AutoAuthEdit |

  Scenario Outline: 验证读取+删除+授权
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "删除授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "设为默认查看删除授权" button
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除数据集成功"
    Then I logout current user

    Examples:
      | name         |
      | AutoAuthEdit |