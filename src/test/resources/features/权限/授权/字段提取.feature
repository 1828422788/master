@authtest
Feature: 权限-字段提取

  Scenario Outline: 授权功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可查看字段提取"
    And I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "Search" button
    When I "checked" the checkbox which name is "可查看搜索页"
    And I click the "SaveButton" button
    Then I logout current user

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario: 验证无新建权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then I will see the "CreateButton" doesn't exist
    Then I logout current user

  Scenario Outline: 授权新建
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    When I "checked" the checkbox which name is "新建字段提取"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name              |
      | __user_AutoTest__ |

  Scenario: 验证有新建权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "CSV解析" from the "ParseRule"
    And I wait for "1500" millsecond
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Separate" with value ","
    And I set the parameter "FieldList" with value "1,2,3,4,5"
    And I click the "EnsureAddParseRule" button
    And I wait for "1000" millsecond
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "AutoTestUserCreate"
    And I set the parameter "Logtype" with value "other"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Then I logout current user

  Scenario: 取消读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "AutoTestUserCreate" in auth table
    And I "unchecked" the checkbox which name is "AutoTestUserCreate" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证无读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoTestUserCreate','contains':'no'}"
    Then I logout current user

  Scenario Outline: 授权读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 验证读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "disabled" in configs
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    Then I will see the element "Done" attribute is "disabled"
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    Then I wait for "1000" millsecond
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

    Examples:
      | name               |function|
      | AutoTestUserCreate |查看\n更多    |

  Scenario: 授权读取+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "AutoTestUserCreate" in auth table
    When I "unchecked" function "删除,转授" from the auth table which name is "AutoTestUserCreate"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario Outline: 验证读取+编辑权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'AutoTestUserCreate'}" then i will see "<function>" button
    Then I will see the checkbox in list before "{'column':'1','name':'AutoTestUserCreate'}" is "enabled" in configs
    When the data name is "{'column':'1','name':'AutoTestUserCreate'}" then i click the "更多" button
    And I click the "Copy" button
    Then I wait for "SuccessMessage" will be visible
    Then I will see the success message "复制成功"
    When the data name is "{'column':'1','name':'AutoTestUserCreate'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "AutoTestUserRename"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTestUserRename'}" then i click the "更多" button
    And I click the "Label" button
    And I click the "TagToInput" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    #And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"
    And the data name is "{'column':'1','name':'AutoTestUserRename'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

    Examples:
      |function|
      |编辑\n更多    |

  Scenario Outline: 授权读取+编辑+删除权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for "1500" millsecond
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name                   |
      | AutoTestUserCreate(副本) |

  Scenario Outline: 验证读取+编辑+删除权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "enabled" in configs
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Copy" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "复制成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "副本"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'副本'}" then i click the "更多" button
    And I click the "Label" button
    And I click the "TagToInput" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    #And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'副本'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'副本'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    Then I logout current user

    Examples:
      | name                   |function|
      | AutoTestUserCreate(副本) |编辑\n更多    |

  Scenario Outline: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "disabled" in configs
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    Then I will see the element "Done" attribute is "disabled"
    Then I logout current user

    Examples:
      | name                       |function|
      | AutoTestUserCreate(副本)(副本) |查看\n更多    |

  Scenario: 验证读取+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTestUserCreate(副本)(副本)'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    Then I logout current user

  Scenario Outline: 授权读取+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    And I wait for loading invisible
    When I "checked" the checkbox which name is "新建字段提取"
    And I click the "SaveButton" button
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "1000" millsecond
    And I will see the success message "更新成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name               |
      | AutoTestUserRename |

  Scenario Outline: 验证读取+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "disabled" in configs
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I wait for "1000" millsecond
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<userfunction>" button
    Then I logout current user

    Examples:
      | name               |function|userfunction|
      | AutoTestUserRename |查看\n更多    |查看\n授权      |

  Scenario Outline: 授权读取+编辑+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name               |
      | AutoTestUserRename |

  Scenario Outline: 验证读取+编辑+转授
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    And I click the "Ensure" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the error message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "Auto副本"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Then I logout current user

    Examples:
      | name               |function|
      | AutoTestUserRename |编辑\n更多    |


  Scenario Outline: 授权读取+删除+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for "1500" millsecond
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for "1500" millsecond
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name   |
      | Auto副本 |

  Scenario Outline: 验证读取+删除+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "disabled" in configs
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button
    Then I will see the element "Done" attribute is "disabled"
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the error message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<userfunction>" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    Then I logout current user

    Examples:
      | name   |function|userfunction|
      | Auto副本 |查看\n更多    |查看\n更多      |

  Scenario: 新建字段提取测试所有权限
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "CSV解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Separate" with value ","
    And I set the parameter "FieldList" with value "1,2,3,4,5"
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "副本(副本)"
    And I set the parameter "Logtype" with value "other"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name   |
      | 副本(副本) |

  Scenario Outline: 验证所有权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then I "open" the switch
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    And I click the "Ensure" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the error message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "副本"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Then I logout current user

    Examples:
      | name   |function|
      | 副本(副本) |编辑\n更多    |

 # Scenario: 有效期限
 #   Given open the "roles.ListPage" page for uri "/account/roles/"
 #   And I wait for loading invisible
 #   And the data name is "__user_AutoTest__" then i click the "授权" button
 #   And I will see the "roles.AuthorizationPage" page
 #   And I wait for loading invisible
 #   And I click the "ResourceAuth" button
 #   And I wait for loading invisible
 #   Then I click the "{'TabButton':'字段提取'}" button
 #   And I wait for loading invisible
 #   And I "checked" the checkbox which name is "副本" in auth table
 #   When the data name is "副本" then I click the "无限期" button in auth table
 #   And I click the "Customize" button
 #   And I click the "DateEditor" button
 #   And I set the time input "TimeInput" to "1" minutes later
 #   And I click the "EnsureTime" button
 #   And I click the "SaveButton" button

  Scenario Outline: 修改字段提取名称
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "测试有效期限"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Then I logout current user

    Examples:
      | name |
      | 副本   |

  Scenario: 新建字段提取测试二次授权
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "CSV解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Separate" with value ","
    And I set the parameter "FieldList" with value "1,2,3,4,5"
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "测试Auth相关"
    And I set the parameter "Logtype" with value "other"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

  Scenario Outline: 验证二次授权读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for "1000" millsecond
    And I choose the "<authRole>" from the "AuthDropdown"
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<userfunction>" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "disabled" in configs
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button
    Then I will see the element "Done" attribute is "disabled"
    Then I logout current user

    Examples:
      | authRole | authName | function | name     |userfunction|
      | 用户       | 验证授权用户   | 读取       | 测试Auth相关 |查看\n授权        |

  Scenario Outline: 验证二次授权读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for "1000" millsecond
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<userfunction>" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "enabled" in configs
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "TagInput" with value "自动化测试标签"
   # And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button under some element
    Then I will see the success message "修改成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "测试AuthRename"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Then I logout current user

    Examples:
      | authRole | authName        | function | name     |userfunction|
      | 角色       | __user_验证授权用户__ | 编辑       | 测试Auth相关 |编辑\n更多        |

  Scenario Outline: 验证二次授权读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for "1000" millsecond
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<userfunction>" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "enabled" in configs
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Label" button
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "TagInput" with value "自动化测试标签"
   # And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button under some element
    Then I will see the success message "修改成功"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Auth" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "副本"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'副本'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    Then I logout current user

    Examples:
      | authRole | authName | function | name         |userfunction|
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | 测试AuthRename |编辑\n更多        |

  #Scenario: 验证有效期限生效
  #  Given I login user "AutoTest" with password "All#123456"
  #  And I wait for "2000" millsecond
  #  Given open the "configs.ListPage" page for uri "/configs/"
  #  Then I will see the search result "{'column':'1','name':'测试有效期限','contains':'no'}"
  #  Then I logout current user

  Scenario Outline: 删除字段提取
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

    Examples:
      | name   |
      | 测试有效期限 |