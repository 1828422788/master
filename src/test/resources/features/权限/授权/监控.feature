#@authtest
Feature: 权限-监控

  Scenario Outline: 勾选所需功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I click the "Resource" button
    And I wait for "1000" millsecond
    When I "checked" the checkbox which name is "可查看监控,可查看仪表盘"
    When I "unchecked" the checkbox which name is "新建监控"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario: 验证无新建监控的权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then I will see the "CreateAlert" doesn't exist
    Then I logout current user

  Scenario: 授权可新建监控
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "新建监控"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证可新建监控
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    And I click the "CreateAlert" button
    Then I will see the "alert.CreatePage" page
    And I set the parameter "AlertName" with value "AutoTest用户创建"
    And I choose the "username" from the "AlertUsers" with property
    And I set the parameter "SearchContent" with value "*"
    And I set the parameter "TimeInput" with value "100000"
    And I set the parameter "TriggerInput" with value "10000000"
    And I set the parameter "TriggerLevel" with value "1000000000"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"
    Then I logout current user

  Scenario Outline: 授权无任何权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'监控'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name         |
      | AutoTest用户创建 |

  Scenario Outline: 验证无任何权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'<name>','contains':'no'}"
    Then I logout current user

    Examples:
      | name         |
      | AutoTest用户创建 |

  Scenario Outline: 授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'监控'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name         |
      | AutoTest用户创建 |

  Scenario Outline: 验证读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the switch button before "{'column':'1','name':'<name>'}" is disabled
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    Then I will see the "SaveButton" doesn't exist
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    #When the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

    Examples:
      | name         |function|
      | AutoTest用户创建 |查看\n更多    |

  Scenario Outline: 授权有读取+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'监控'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I logout current user

    Examples:
      | name         |
      | AutoTest用户创建 |

  Scenario Outline: 验证有读取+编辑权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    #Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
    And I wait for "SuccessMessage" will be invisible
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "2000" millsecond
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    And I set the parameter "AlertName" with value "AutoTest权限验证修改名称"
    And I set the parameter "TimeInput" with value "20"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name         |function|
      | AutoTest用户创建 |编辑\更多    |

  Scenario Outline: 授权读取+编辑+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'监控'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name             |
      | AutoTest权限验证修改名称 |

  Scenario Outline: 验证有读取+编辑+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then I "open" the switch
#    Then I will see the success message "启用成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "2000" millsecond
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I wait for "Tag" will be visible
 #   And I set the parameter "Tag" with value "test"
 #   And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    And I set the parameter "AlertName" with value "AutoTestAuth"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name             |function|
      | AutoTest权限验证修改名称 |编辑\n更多    |

  Scenario Outline: 授权有读取+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'监控'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible

    Examples:
      | name         |
      | AutoTestAuth |

  Scenario Outline: 授权有读取+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'监控'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I logout current user

    Examples:
      | name         |
      | AutoTestAuth |

  Scenario Outline: 验证有读取+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the switch button before "{'column':'1','name':'<name>'}" is disabled
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    And I wait for "LoadingElement" will be invisible
    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    Then I will see the "SaveButton" doesn't exist
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "uncheck" the checkbox which name is "验证授权用户" in tiny table
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<userfunction>" button
    Then I logout current user

    Examples:
      | name         |function|userfunction|
      | AutoTestAuth |查看\n更多    |查看\n授权    |

  Scenario Outline: 授权读取+删除权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'监控'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I logout current user

    Examples:
      | name         |
      | AutoTestAuth |

  Scenario Outline: 验证有读取+删除权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the switch button before "{'column':'1','name':'<name>'}" is disabled
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    Then I will see the "SaveButton" doesn't exist
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Copy" button
    Then I will see the success message "复制成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
    Then I logout current user

    Examples:
      | name         |function|
      | AutoTestAuth |查看\n更多    |

  Scenario Outline: 授权有读取+编辑+删除权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'监控'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I logout current user

    Examples:
      | name             |
      | AutoTestAuth(副本) |

  Scenario Outline: 验证有读取+编辑+删除权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "2000" millsecond
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I wait for "Tag" will be visible
    #And I set the parameter "Tag" with value "test"
    #And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Copy" button
    Then I will see the success message "复制成功"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    And I set the parameter "AlertName" with value "AutoTest权限验证修改名称"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTest权限验证修改名称'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    Then I logout current user

    Examples:
      | name             |function|
      | AutoTestAuth(副本) |编辑\n更多    |

  Scenario Outline: 授权读取+删除+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'监控'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    Then I click the "{'TabButton':'监控'}" button
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I logout current user

    Examples:
      | name                 |
      | AutoTestAuth(副本)(副本) |

  Scenario Outline: 验证读取+删除+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the switch button before "{'column':'1','name':'<name>'}" is disabled
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Copy" button
    Then I will see the success message "复制成功"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    And I wait for "LoadingElement" will be invisible
    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    Then I will see the "SaveButton" doesn't exist
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
    Then I logout current user

    Examples:
      | name                 |function|
      | AutoTestAuth(副本)(副本) |查看\n更多    |

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'监控'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I logout current user

    Examples:
      | name                     |
      | AutoTestAuth(副本)(副本)(副本) |

  Scenario Outline: 验证所有权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
#    Then I will see the success message "禁用成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "2000" millsecond
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I wait for "Tag" will be visible
    #And I set the parameter "Tag" with value "test"
    #And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    And I set the parameter "AlertName" with value "AutoTest权限验证修改名称"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name                     |function|
      | AutoTestAuth(副本)(副本)(副本) |编辑\n更多    |

 # Scenario: 有效期限
 #   Given open the "roles.ListPage" page for uri "/account/roles/"
 #   And I wait for loading invisible
 #   And the data name is "__user_AutoTest__" then i click the "授权" button
 #   And I will see the "roles.AuthorizationPage" page
 #   And I wait for loading invisible
 #   And I click the "ResourceAuth" button
 #   And I wait for "1000" millsecond
 #   Then I click the "{'TabButton':'监控'}" button
 #   And I wait for loading invisible
 #   And I "checked" the checkbox which name is "AutoTest权限验证修改名称" in auth table
 #   When the data name is "AutoTest权限验证修改名称" then I click the "无限期" button in auth table
 #   And I click the "Customize" button
 #   And I click the "DateEditor" button
 #   And I set the time input "TimeInput" to "1" minutes later
 #   And I click the "EnsureTime" button
 #   And I click the "SaveButton" button
 #   And I wait for "SuccessMessage" will be visible
 #   And I will see the success message "更新成功"

  Scenario: 新建监控以测试二次授权
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    And I click the "CreateAlert" button
    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    And I set the parameter "AlertName" with value "测试二次授权"
    And I choose the "username" from the "AlertUsers" with property
    And I set the parameter "SearchContent" with value "*"
    And I set the parameter "TimeInput" with value "100000"
    And I set the parameter "TriggerInput" with value "10000000"
    And I set the parameter "TriggerLevel" with value "1000000000"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"

  Scenario: 给AutoTest用户授权
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'测试二次授权'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Then I logout current user

  Scenario Outline: 二次授权读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<userfunction>" button
    Then I will see the switch button before "{'column':'1','name':'<name>'}" is disabled
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    Then I will see the "SaveButton" doesn't exist
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled

    Examples:
      | authRole | authName | function | name   |userfunction|
      | 用户       | 验证授权用户   | 读取       | 测试二次授权 |查看\n授权        |

  Scenario Outline: 二次授权读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<userfunction>" button
    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
#    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "2000" millsecond
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "alert.CreatePage" page
    And I set the parameter "AlertName" with value "<name>"
    And I set the parameter "TimeInput" with value "100000"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

    Examples:
      | authRole | authName        | function | name   |userfunction|
      | 角色       | __user_验证授权用户__ | 编辑       | 测试二次授权 |编辑\n更多        |

  Scenario Outline: 二次授权读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<userfunction>" button
    When the data name is "{'column':'1','name':'<name>'}" then I "open" the switch
    Then I will see the success message "启用成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "2000" millsecond
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    #And I wait for "Tag" will be visible
    #And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "alert.CreatePage" page
    And I set the parameter "AlertName" with value "AutoTest权限验证修改名称"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTest权限验证修改名称'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | authRole | authName | function | name   |userfunction|
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | 测试二次授权 |编辑\n更多        |

  Scenario: 修改名称
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTest权限验证修改名称'}" then i click the "编辑" button
    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    And I set the parameter "AlertName" with value "未删除则证明有bug"
    And I click the "SaveButton" button
    Then I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I logout current user

 # Scenario: 验证有效期限
 #   Given I login user "AutoTest" with password "All#123456"
 #   And I wait for "2000" millsecond
 #   Given open the "alert.ListPage" page for uri "/alerts/"
 #   And I wait for loading invisible
 #   Then I will see the search result "{'column':'1','name':'未删除则证明有bug','contains':'no'}"

  Scenario: 删除监控
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'未删除则证明有bug'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
    Then I logout current user
