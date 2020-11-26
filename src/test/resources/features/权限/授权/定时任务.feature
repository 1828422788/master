@authtest1
Feature: 权限-定时任务


  Scenario Outline: 授权功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可查看搜索页"
    And I click the "Resource" button
    When I "checked" the checkbox which name is "可查看定时任务"
    And I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  @logout
  Scenario: 验证无新建权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "tag:sample04061424_chart | bucket timestamp span=1h as ts | stats count(apache.clientip) as c_ip by ts"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    Then I will see the "TimedTask" doesn't exist

  @logout
  Scenario: 授权新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "新建定时任务"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario: 验证新建权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "tag:sample04061424_chart | bucket timestamp span=1h as ts | stats count(apache.clientip) as c_ip by ts"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I wait for element "SelectedUser" change text to "AutoTest"
    And I set the parameter "TaskName" with value "AutoTestCreate"
    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

  @logout
  Scenario: 验证无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    Then I click the "{'TabButton':'定时任务'}" button
    And I "checked" the checkbox which name is "AutoTestCreate" in auth table
    And I "unchecked" the checkbox which name is "AutoTestCreate" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario: 授权无读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then I will see the search result "{'column':'1','name':'AutoTestCreate','contains':'no'}"

  @logout
  Scenario: 授权有读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    Then I click the "{'TabButton':'定时任务'}" button
    And I "checked" the checkbox which name is "AutoTestCreate" in auth table
    And I "unchecked" the checkbox which name is "AutoTestCreate" in auth table
    When I "checked" function "读取" from the auth table which name is "AutoTestCreate"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario: 验证有读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "{'column':'1','name':'AutoTestCreate'}" then i will see "查看复制授权" button
    When the data name is "{'column':'1','name':'AutoTestCreate'}" then i click the "查看" button
    And I will see the "timedTask.EditPage" page
    Then I will see the "SaveButton" doesn't exist
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And the data name is "{'column':'1','name':'AutoTestCreate'}" then i click the "复制" button
    And I wait for "SuccessMessage" will be visible
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'AutoTestCreate'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

  @logout
  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    Then I click the "{'TabButton':'定时任务'}" button
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name               |
      | AutoTestCreate(副本) |

  Scenario Outline: 验证读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑复制标签授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to "AutoTest"
    And I set the parameter "Name" with value "AutoTestRename"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

    Examples:
      | name               |
      | AutoTestCreate(副本) |

  @logout
  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    Then I click the "{'TabButton':'定时任务'}" button
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name           |
      | AutoTestRename |

  Scenario Outline: 验证读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑复制标签授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to "AutoTest"
    And I set the parameter "Name" with value "AutoTest重命名"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'1','name':'AutoTest重命名'}" then i click the "删除" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

    Examples:
      | name           |
      | AutoTestRename |

  @logout
  Scenario Outline: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    Then I click the "{'TabButton':'定时任务'}" button
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 授权读取+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看复制授权删除" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    And I will see the "timedTask.EditPage" page
    Then I will see the "SaveButton" doesn't exist
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "复制" button
    Then I will see the success message "复制成功"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

    Examples:
      | name           |
      | AutoTestCreate |

  @logout
  Scenario Outline: 授权读取+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    Then I click the "{'TabButton':'定时任务'}" button
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name               |
      | AutoTestCreate(副本) |

  Scenario Outline: 授权读取+转授
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看复制授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    And I will see the "timedTask.EditPage" page
    Then I will see the "SaveButton" doesn't exist
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "复制" button
    Then I will see the success message "复制成功"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看复制授权" button

    Examples:
      | name               |
      | AutoTestCreate(副本) |

  @logout
  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    Then I click the "{'TabButton':'定时任务'}" button
    And I "checked" the checkbox which name is "AutoTestCreate(副本)" in auth table
    When the data name is "AutoTestCreate(副本)" then I click the "无限期" button in auth table
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  @logout
  Scenario Outline: 授权读取+删除+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    Then I click the "{'TabButton':'定时任务'}" button
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name                   |
      | AutoTestCreate(副本)(副本) |

  Scenario Outline: 授权读取+删除+转授
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看复制授权删除" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    And I will see the "timedTask.EditPage" page
    Then I will see the "SaveButton" doesn't exist
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看复制授权删除" button
    And the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name                   |
      | AutoTestCreate(副本)(副本) |

  Scenario: 修改定时任务名称
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTestCreate(副本)'}" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    And I set the parameter "Name" with value "验证有效期限"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  @logout
  Scenario: 验证有效期限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'验证有效期限','contains':'no'}"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'验证有效期限'}"

  @logout
  Scenario Outline: 授权读取+编辑+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Schedule" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑复制标签授权" button
    When the data name is "{'column':'1','name':'<name>'}" then I "open" the switch
    And I wait for "SuccessMessage" will be visible
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "uncheck" the checkbox which name is "验证授权用户" in tiny table
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑复制标签授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to "AutoTest"
    And I set the parameter "Name" with value "AutoTestRename"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

    Examples:
      | name   |
      | 验证有效期限 |

  @logout
  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Schedule" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑复制标签授权删除" button
    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "uncheck" the checkbox which name is "验证授权用户" in tiny table
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑复制标签授权删除" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to "AutoTest"
    And I set the parameter "Name" with value "AutoTestEdit"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

    Examples:
      | name           |
      | AutoTestRename |

  @logout
  Scenario: 给AutoTest授权
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'1','name':'AutoTestEdit'}" then i click the "授权" button
    And I wait for loading invisible
    And I "uncheck" the checkbox which name is "AutoTest" in tiny table
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I "uncheck" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  @logout
  Scenario Outline: 二次授权读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'1','name':'AutoTestEdit'}" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "{'column':'1','name':'AutoTestEdit'}" then i will see "查看复制授权" button
    When the data name is "{'column':'1','name':'AutoTestEdit'}" then i click the "查看" button
    And I will see the "timedTask.EditPage" page
    Then I will see the "SaveButton" doesn't exist
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And the data name is "{'column':'1','name':'AutoTestEdit'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled

    Examples:
      | authRole | authName | function |
      | 用户       | 验证授权用户   | 读取       |

  @logout
  Scenario Outline: 二次授权读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑复制标签授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to "AutoTest"
    And I set the parameter "Name" with value "AutoTestRename"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

    Examples:
      | authRole | authName        | function | name         |
      | 角色       | __user_验证授权用户__ | 编辑       | AutoTestEdit |

  @logout
  Scenario Outline: 二次授权读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑复制标签授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to "AutoTest"
    And I set the parameter "Name" with value "AutoTest重命名"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'1','name':'AutoTest重命名'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | authRole | authName | function | name           |
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | AutoTestRename |