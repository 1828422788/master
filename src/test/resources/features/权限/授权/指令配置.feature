#@authtest
Feature: 权限-指令配置

  Scenario Outline: 勾选功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    Given I wait for loading complete
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Given I wait for loading complete
    And I click the "Resource" button
    And I wait for "1500" millsecond
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看指令配置,可查看仪表盘,新建仪表盘"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario: 验证无新建权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    And open the "customcommand.ListPage" page for uri "/customcommand/"
    Given I wait for loading complete
    Then I will see the "Create" doesn't exist
    Then I logout current user

  Scenario: 授权新建指令配置权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    Given I wait for loading complete
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Given I wait for loading complete
    And I click the "Resource" button
    And I "checked" the checkbox which name is "新建指令配置"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario: 上传程序
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    And I wait for "ProcessManger" will be visible
    And I click the "ProcessManger" button
    Then I wait for loading invisible
    Then I will see the "customcommand.CreatePage" page
    Then I wait for loading invisible
    And I click the "Upload" button
    And I wait for "2000" millsecond
    When I upload a file "LocalUpload" with name "/target/test-classes/testdata/app/caculate3.tgz"
    And I will see the element "VerifyText" name is "上传完成"
    And I set the parameter "Name" with value "caculate3"
    And I set the parameter "ScriptName" with value "caculate"
    Then I click the "confirmUpload" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"


  Scenario: 验证新建指令配置
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    And I wait for "Create" will be visible
    And I click the "Create" button
    And I set the parameter "CommandName" with value "caculate"
    And I choose the "caculate3.tgz" from the "ProcessName"
    And I wait for "1000" millsecond
    Then I choose the "集中处理命令" from the "CommandType"
    And I wait for "2000" millsecond
    Then I click the "Apply" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"
    Then I logout current user


  Scenario Outline: 不授予任何权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    Given I wait for loading complete
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Given I wait for loading complete
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'指令配置'}" button
    Given I wait for loading complete
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name     |
      | caculate |

  Scenario Outline: 验证无任何权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    Given I wait for loading complete
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"
    Then I logout current user

    Examples:
      | name     |
      | caculate |

  Scenario Outline: 仅授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    Given I wait for loading complete
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Given I wait for loading complete
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'指令配置'}" button
    Given I wait for loading complete
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

    Examples:
      | name     |
      | caculate |

  Scenario Outline: 验证读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    Given I wait for loading invisible
    Then the data name is "<name>" then i will see "授权" button
    And I wait for "2000" millsecond
    Then the data name is "<name>" then i click the "授权" button
    And I wait for "2000" millsecond
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

    Examples:
      | name     |
      | caculate |

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    Given I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Given I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'指令配置'}" button
    Given I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取,编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name         |
      | caculate |

  Scenario Outline: 验证读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    Given I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "编辑" button
    And I wait for "1000" millsecond
    Then I set the parameter "CommandName" with value "caculate"
    And I wait for "1000" millsecond
    And I click the "Save" button
    Then I will see the success message "更新成功"
    Then I click the "Confirm" button
    And I wait for "2000" millsecond
    Then the data name is "<name>" then i click the "授权" button
    And I wait for "2000" millsecond
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

    Examples:
      | name         |function|
      | caculate |编辑\n授权     |

  Scenario Outline: 授权读取+编辑+删除+有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    Given I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Given I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'指令配置'}" button
    Given I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取,编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name         |
      | caculate |

 # Scenario: 授权有效期限
 #   Given open the "roles.ListPage" page for uri "/account/roles/"
 #   And I wait for loading invisible
 #   And the data name is "__user_AutoTest__" then i click the "授权" button
 #   And I will see the "roles.AuthorizationPage" page
 #   And I wait for loading invisible
 #   And I click the "ResourceAuth" button
 #   And I wait for "1000" millsecond
 #   Then I click the "{'TabButton':'趋势图'}" button
 #   And I wait for loading invisible
 #   When the data name is "AutoTest" then I click the "无限期" button in auth table
 #   And I click the "Customize" button
 #   And I click the "DateEditor" button
 #   And I set the time input "TimeInput" to "1" minutes later
 #   And I click the "EnsureTime" button
 #   And I click the "SaveButton" button
 #   And I wait for "SuccessMessage" will be visible
 #   And I will see the success message "更新成功"



  Scenario Outline: 验证读取+编辑+删除+有效期限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    Given I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "编辑" button
    And I wait for "1000" millsecond
    Then I set the parameter "CommandName" with value "caculate"
    And I click the "Save" button
    Then I will see the success message "更新成功"
    Then I click the "Confirm" button
    And I wait for "2000" millsecond
    Then the data name is "<name>" then i click the "授权" button in more menu
    And I wait for "2000" millsecond
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    Given I wait for loading invisible
    Then the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Confirm" will be visible
    And I click the "Confirm" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "删除成功"
    Then I logout current user

    Examples:
      | name         |function|
      | caculate |编辑\n更多    |

  Scenario: 新建指令配置支持后续测试
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    And I wait for "Create" will be visible
    And I click the "Create" button
    And I set the parameter "CommandName" with value "caculate"
    And I choose the "caculate3.tgz" from the "ProcessName"
    And I wait for "1000" millsecond
    Then I choose the "集中处理命令" from the "CommandType"
    And I wait for "2000" millsecond
    Then I click the "Apply" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"
    Then I logout current user

  Scenario Outline: 授权读取+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'指令配置'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name         |
      | caculate |

  Scenario Outline: 验证读取+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "授权" button
    When the data name is "<name>" then i click the "授权" button
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for "1500" millsecond
    Then I logout current user

    Examples:
      | name         |
      | caculate |

  Scenario: 授权读取+编辑+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'指令配置'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "caculate" in auth table
    When I "unchecked" function "删除" from the auth table which name is "caculate"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user


  Scenario Outline: 验证读取+编辑+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "编辑" button
    And I wait for "1000" millsecond
    Then I set the parameter "CommandName" with value "caculate"
    And I click the "Save" button
    Then I will see the success message "更新成功"
    Then I click the "Confirm" button
    And I wait for "2000" millsecond
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "uncheck" the checkbox which name is "验证授权用户" in tiny table
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "编辑" button
    And I wait for "1000" millsecond
    Then I set the parameter "CommandName" with value "caculate"
    And I click the "Save" button
    Then I will see the success message "更新成功"
    Then I click the "Confirm" button
    And I wait for "2000" millsecond

    Examples:
      | name         |function|
      | caculate |编辑\n授权    |

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "ResourceAuth" button
    And I wait for "1000" millsecond
    Then I click the "{'TabButton':'指令配置'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name             |
      | caculate |

  Scenario Outline: 验证所有权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "编辑" button
    And I wait for "1000" millsecond
    Then I set the parameter "CommandName" with value "caculate"
    And I click the "Save" button
    Then I will see the success message "更新成功"
    Then I click the "Confirm" button
    And I wait for "2000" millsecond
    When the data name is "<name>" then i click the "授权" button in more menu
    And I wait for loading invisible
    And I "uncheck" the checkbox which name is "验证授权用户" in tiny table
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "<function>" button
    When the data name is "<name>" then i click the "编辑" button
    And I wait for "1000" millsecond
    Then I set the parameter "CommandName" with value "caculate"
    And I click the "Save" button
    Then I will see the success message "更新成功"
    Then I click the "Confirm" button
    And I wait for "2000" millsecond
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    Given I wait for loading invisible
    Then the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Confirm" will be visible
    And I click the "Confirm" button
    And I wait for "2000" millsecond
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "删除成功"

    Examples:
      | name             |function|
      | caculate |编辑\n更多    |

 # Scenario: 验证有效期限生效
 #   Given I login user "AutoTest" with password "All#123456"
 #   Given open the "trend.ListPage" page for uri "/trend/"
 #   And I wait for loading invisible
 #   Then I will see the search result "{'column':'0','name':'AutoTest','contains':'no'}"
 #   Then I logout current user
