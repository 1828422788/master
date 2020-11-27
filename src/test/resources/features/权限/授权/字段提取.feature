@authtest12
Feature: 权限-字段提取

  Scenario Outline: 授权功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可查看搜索页"
    And I click the "Resource" button
    When I "checked" the checkbox which name is "可查看字段提取"
    And I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
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
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
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
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Separate" with value ","
    And I set the parameter "FieldList" with value "1,2,3,4,5"
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "AutoTestUserCreate"
    And I set the parameter "Logtype" with value "other"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Then I logout current user

  Scenario: 取消读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "AutoTestUserCreate" in auth table
    And I "unchecked" the checkbox which name is "AutoTestUserCreate" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证无读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I will see the search result "{'column':'0','name':'AutoTestUserCreate','contains':'no'}"
    Then I logout current user

  Scenario Outline: 授权读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
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
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看复制授权" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "disabled"
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
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario: 授权读取+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "AutoTestUserCreate" in auth table
    When I "unchecked" function "删除,转授" from the auth table which name is "AutoTestUserCreate"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证读取+编辑权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'AutoTestUserCreate'}" then i will see "编辑标签复制授权" button
    Then I will see the checkbox in list before "{'column':'1','name':'AutoTestUserCreate'}" is "enabled"
    When the data name is "{'column':'1','name':'AutoTestUserCreate'}" then i click the "复制" button
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
    When the data name is "{'column':'1','name':'AutoTestUserRename'}" then i click the "标签" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"
    And the data name is "{'column':'1','name':'AutoTestUserRename'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

  Scenario Outline: 授权读取+编辑+删除权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
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
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签复制删除授权" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "enabled"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "复制" button
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
    When the data name is "{'column':'1','name':'副本'}" then i click the "标签" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'副本'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'副本'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
    Then I logout current user

    Examples:
      | name                   |
      | AutoTestUserCreate(副本) |

  Scenario Outline: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看复制删除授权" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "disabled"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "configs.ListPage" page for uri "/configs/"
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
      | name                       |
      | AutoTestUserCreate(副本)(副本) |

  Scenario: 读取+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'AutoTestUserCreate(副本)(副本)'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
    Then I logout current user

  Scenario Outline: 授权读取+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "unchecked" the checkbox which name is "新建字段提取"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name               |
      | AutoTestUserRename |

  Scenario Outline: 授权读取+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看授权" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "disabled"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the error message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看复制授权" button
    Then I logout current user

    Examples:
      | name               |
      | AutoTestUserRename |

  Scenario Outline: 授权读取+编辑+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
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
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签授权" button
    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"
    Given open the "configs.ListPage" page for uri "/configs/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the error message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签复制授权" button
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
      | name               |
      | AutoTestUserRename |

  Scenario Outline: 授权读取+删除+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name   |
      | Auto副本 |

  Scenario Outline: 授权读取+删除+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看删除授权" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "disabled"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button
    Then I will see the element "Done" attribute is "disabled"
    Given open the "configs.ListPage" page for uri "/configs/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the error message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看复制删除授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    Then I logout current user

    Examples:
      | name   |
      | Auto副本 |

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
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
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
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签删除授权" button
    When the data name is "{'column':'1','name':'<name>'}" then I "open" the switch
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "修改成功"
    Given open the "configs.ListPage" page for uri "/configs/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the error message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签复制删除授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "副本"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Then I logout current user

    Examples:
      | name   |
      | 副本(副本) |

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "副本" in auth table
    When the data name is "副本" then I click the "无限期" button in auth table
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario Outline: 增加字典管理权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    When I "checked" the checkbox which name is "新建字段提取,可查看字典管理,新建字典"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |

  Scenario: 上传字典
    When I wait for "2000" millsecond
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I upload a file with name "/src/test/resources/testdata/dictionary/TestAuth.csv"
    And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "TestAuth"
    And I click the "EnsureUpload" button
    Then I will see the success message "创建字典成功"

  Scenario Outline: 修改字段提取名称
    Given open the "configs.ListPage" page for uri "/configs/"
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

  Scenario Outline: 新建字段提取关联字典
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "AddRule" button
    And I choose the "自定义字典" from the "ParseRule"
    And I choose the "SourceName" from the "SourceField"
    And I choose the "TestAuth.csv" from the "Dictionary"
    And I choose the "sourcename" from the "BaseField"
    And I choose the "level,source" from the "ExtendField"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "测试Auth相关"
    And I set the parameter "Logtype" with value "json"
    And I set the parameter "AppName" with value "auto_test_auth"
    And I set the parameter "Tag" with value "auto_test_auth"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | Object\nCategory:""\nComputerName:"WIN-999OGBVAHMI"\nEventCode:7036\nEventIdentifier:1073748860\nEventType:3\nLogfile:"System"\nMessage:"Application Experience 服务处于 正在运行 状态。"\nRecordNumber:108343\nSourceName:"Service Control Manager"\nTimeGenerated:"2015-01-04T20:45:09+08:00"\nUser:""\nlevel:"2"\nsource:"sys"\nraw_message:"{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}" | Object\nCategory:""\nComputerName:"WIN-999OGBVAHMI"\nEventCode:7036\nEventIdentifier:1073748860\nEventType:3\nLogfile:"System"\nMessage:"Application Experience 服务处于 正在运行 状态。"\nRecordNumber:108343\nSourceName:"Service Control Manager"\nTimeGenerated:"2015-01-04T20:45:09+08:00"\nUser:""\nraw_message:"{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}" |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I logout current user

    Examples:
      | appName        | log            |
      | auto_test_auth | dictionary.log |

  Scenario Outline: 验证二次授权读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看复制授权" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "disabled"
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button
    Then I will see the element "Done" attribute is "disabled"
    Then I logout current user

    Examples:
      | authRole | authName | function | name     |
      | 用户       | 验证授权用户   | 读取       | 测试Auth相关 |

  Scenario Outline: 验证二次授权读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签复制授权" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "enabled"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button
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
      | authRole | authName        | function | name     |
      | 角色       | __user_验证授权用户__ | 编辑       | 测试Auth相关 |

  Scenario Outline: RZY-3418:在搜索页验证
    Given I login user "AutoTest" with password "All#123456"
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the spl search result "<result>"
    Then I logout current user

    Examples:
      | tag            | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | auto_test_auth | {'json.Category':'json.Category： ','json.ComputerName':'json.ComputerName：WIN-999OGBVAHMI ','json.EventCode':'json.EventCode：7036 ','json.EventIdentifier':'json.EventIdentifier：1073748860 ','json.EventType':'json.EventType：3 ','json.Logfile':'json.Logfile：System ','json.Message':'json.Message：Application Experience 服务处于 正在运行 状态。 ','json.RecordNumber':'json.RecordNumber：108343 ','json.SourceName':'json.SourceName：Service Control Manager ','json.TimeGenerated':'json.TimeGenerated：2015-01-04T20:45:09+08:00 ','json.level':'json.level：2 ','json.source':'json.source：sys '} |

  Scenario Outline: 验证二次授权读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签复制删除授权" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "enabled"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
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
    When the data name is "{'column':'1','name':'副本'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
    Then I logout current user

    Examples:
      | authRole | authName | function | name         |
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | 测试AuthRename |

  Scenario: 验证有效期限生效
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I will see the search result "{'column':'1','name':'测试有效期限','contains':'no'}"
    Then I logout current user

  Scenario Outline: 删除字段提取
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name   |
      | 测试有效期限 |

  Scenario: 删除字典
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "TestAuth.csv" then i click the "删除" button
    And I wait for "EnsureButton" will be visible
    And I click the "EnsureButton" button
    Then I wait for element "SuccessMessage" change text to "删除成功"