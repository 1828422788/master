@auth
Feature: 权限-全链路

  Scenario Outline: 勾选字段提取所需功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可查看全链路"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario: 验证无新建权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "fulllink.ListPage" page for uri "/fulllink/"
    Then I will see the "Create" doesn't exist

  Scenario Outline: 勾选新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "新建全链路"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |

  Scenario: 验证新建
    Given I login user "AutoTest" with password "All#123456"
    And open the "fulllink.ListPage" page for uri "/fulllink/"
    And I click the "Create" button
    And I set the parameter "Name" with value "权限测试"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"

  Scenario Outline: 授权无任何权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'全链路'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name |
      | 权限测试 |

  Scenario: 验证无任何权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "fulllink.ListPage" page for uri "/fulllink/"
    Then I will see the search result "{'column':'0','name':'权限测试','contains':'no'}"

  Scenario Outline: 授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'全链路'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name |
      | 权限测试 |

  Scenario Outline: 验证读取
    Given I login user "AutoTest" with password "All#123456"
    And open the "fulllink.ListPage" page for uri "/fulllink/"
    Then the data name is "<name>" then i will see "授权" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

    Examples:
      | name |
      | 权限测试 |

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'全链路'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取,编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name |
      | 权限测试 |

  Scenario Outline: 验证读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And open the "fulllink.ListPage" page for uri "/fulllink/"
    Then the data name is "<name>" then i will see "标签重命名授权" button
    When the data name is "<name>" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "Name" with value "权限测试重命名"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

    Examples:
      | name |
      | 权限测试 |

  Scenario Outline: 授权读取+编辑+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'全链路'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取,编辑,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name    |
      | 权限测试重命名 |

  Scenario Outline: 验证读取+编辑+转授
    Given I login user "AutoTest" with password "All#123456"
    And open the "fulllink.ListPage" page for uri "/fulllink/"
    Then the data name is "<name>" then i will see "标签重命名授权" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And open the "fulllink.ListPage" page for uri "/fulllink/"
    Then the data name is "<name>" then i will see "标签重命名授权" button
    Then the data name is "<name>" then i will see "标签重命名授权" button
    When the data name is "<name>" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "Name" with value "权限测试Rename"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"

    Examples:
      | name    |
      | 权限测试重命名 |

  Scenario Outline: 授权有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'全链路'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When the data name is "<name>" then I click the "无限期" button in auth table
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name       |
      | 权限测试Rename |

  Scenario: 新建全链路
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I click the "Create" button
    And I set the parameter "Name" with value "权限AutoTest"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"

  Scenario Outline: 授权读取+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'全链路'}" button
    And I wait for "Loading" will be invisible
    When I "checked" function "读取,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name       |
      | 权限AutoTest |

  Scenario Outline: 验证读取+转授
    Given I login user "AutoTest" with password "All#123456"
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    Then the data name is "<name>" then i will see "授权" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    Then the data name is "<name>" then i will see "授权" button

    Examples:
      | name       |
      | 权限AutoTest |

  Scenario Outline: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'全链路'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name       |
      | 权限AutoTest |

  Scenario Outline: 验证读取+删除
    Given I login user "AutoTest" with password "All#123456"
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    Then the data name is "<name>" then i will see "删除授权" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name       |
      | 权限AutoTest |

  Scenario: 验证有效期限
    Given I login user "AutoTest" with password "All#123456"
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    Then I will see the search result "{'column':'0','name':'权限测试Rename','contains':'no'}"
    Given I login user "验证授权用户" with password "All#123456"
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    Then I will see the search result contains "{'column':'0','name':'权限测试Rename'}"

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'全链路'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name       |
      | 权限测试Rename |

  Scenario Outline: 验证读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    Then the data name is "<name>" then i will see "标签重命名删除授权" button
    When the data name is "<name>" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "Name" with value "权限测试重命名"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for "SuccessMessage" will be invisible
    And the data name is "权限测试重命名" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name       |
      | 权限测试Rename |

  Scenario: 新建
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I click the "Create" button
    And I set the parameter "Name" with value "权限测试"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"

  Scenario Outline: 授权读取+转授+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'全链路'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name |
      | 权限测试 |

  Scenario Outline: 验证读取+转授+删除
    Given I login user "AutoTest" with password "All#123456"
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    Then the data name is "<name>" then i will see "删除授权" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name |
      | 权限测试 |

  Scenario: 新建二次授权
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I click the "Create" button
    And I set the parameter "Name" with value "二次授权测试"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"

  Scenario: 给AutoTest授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'全链路'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "二次授权测试" in auth table
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario Outline: 二次授权读取
    Given I login user "AutoTest" with password "All#123456"
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    When the data name is "<name>" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Examples:
      | authRole | authName | function | name   |
      | 用户       | 验证授权用户   | 读取       | 二次授权测试 |

  Scenario Outline: 验证二次授权读取
    Given I login user "验证授权用户" with password "All#123456"
    And open the "fulllink.ListPage" page for uri "/fulllink/"
    Then the data name is "<name>" then i will see "授权" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled

    Examples:
      | name   |
      | 二次授权测试 |

  Scenario Outline: 二次授权读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    When the data name is "<name>" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

    Examples:
      | authRole | authName        | function | name   |
      | 角色       | __user_验证授权用户__ | 编辑       | 二次授权测试 |

  Scenario Outline: 验证二次授权读取+编辑
    Given I login user "验证授权用户" with password "All#123456"
    And open the "fulllink.ListPage" page for uri "/fulllink/"
    Then the data name is "<name>" then i will see "标签重命名授权" button
    When the data name is "<name>" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "Name" with value "二次授权测试重命名"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And the data name is "二次授权测试重命名" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled

    Examples:
      | name   |
      | 二次授权测试 |

  Scenario Outline: 二次授权读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    When the data name is "<name>" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

    Examples:
      | authRole | authName | function | name      |
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | 二次授权测试重命名 |

  Scenario Outline: 验证二次授权读取+编辑+删除
    Given I login user "验证授权用户" with password "All#123456"
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    Then the data name is "<name>" then i will see "标签重命名删除授权" button
    When the data name is "<name>" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "Name" with value "权限测试重命名"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for "SuccessMessage" will be invisible
    And the data name is "权限测试重命名" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name      |
      | 二次授权测试重命名 |
