@auth
Feature: 权限-字典

#  Scenario: 验证无新建权限
#    Given open the "roles.ListPage" page for uri "/account/roles/"
#    And the data name is "__user_AutoTest__" then i click the "授权" button
#    And I will see the "roles.AuthorizationPage" page
#    Then I click the "{'TabButton':'功能'}" button
#    And I wait for "Loading" will be invisible
#    When I "checked" the checkbox which name is "全选"
#    When I "unchecked" the checkbox which name is "新建字典"
#    And I click the "SaveButton" button
#    And I will see the success message "保存成功"
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
#    And I logout current user
#    And I wait for title change text to "登录"
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "All#123456"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "dictionary.ListPage" page for uri "/dictionary/"
#    Then I will see the "UploadButton" doesn't exist
#
#  Scenario: 验证告警插件有效期限生效
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
#    And I wait for loading invisible
#    And I logout current user
#    And I wait for title change text to "登录"
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "All#123456"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "alert.PluginPage" page for uri "/plugins/"
#    Then I will see the search result "{'column':'0','name':'sendsms','contains':'no'}"
#
#  Scenario: 验证可新建字典
#    Given open the "roles.ListPage" page for uri "/account/roles/"
#    And the data name is "__user_AutoTest__" then i click the "授权" button
#    And I will see the "roles.AuthorizationPage" page
#    Then I click the "{'TabButton':'功能'}" button
#    And I wait for "Loading" will be invisible
#    When I "checked" the checkbox which name is "全选"
#    And I "unchecked" the checkbox which name is "全选"
#    And I "checked" the checkbox which name is "可使用字典管理,新建字典"
#    And I click the "SaveButton" button
#    And I will see the success message "保存成功"
#    Then I click the "{'TabButton':'告警插件'}" button
#    And I wait for "Loading" will be invisible
#    And I "checked" the label before "sendsms"
#    And I "unchecked" the label before "sendsms"
#    And I "checked" the label before "sendsms"
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
#    And I logout current user
#    And I wait for title change text to "登录"
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "All#123456"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "dictionary.ListPage" page for uri "/dictionary/"
#    When I click the "UploadButton" button
#    And I upload a file with name "/src/test/resources/testdata/dictionary/AutoTestUserCreate.csv"
#    And I wait for "FileName" will be visible
#    And I click the "EnsureUpload" button
#    Then I will see the success message "创建字典成功"
#
#  Scenario: 授权无读取权限
#    Given open the "roles.ListPage" page for uri "/account/roles/"
#    And the data name is "__user_AutoTest__" then i click the "授权" button
#    And I will see the "roles.AuthorizationPage" page
#    Then I click the "{'TabButton':'字典'}" button
#    And I wait for "Loading" will be invisible
#    And I "checked" the label before "AutoTestUserCreate.csv"
#    And I "unchecked" the label before "AutoTestUserCreate.csv"
#    And I click the "SaveButton" button
#    And I will see the success message "保存成功"
#    Then I click the "{'TabButton':'功能'}" button
#    And I wait for "Loading" will be invisible
#    When I "checked" the checkbox which name is "全选"
#    And I click the "SaveButton" button
#
#  Scenario: 验证无读取权限
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "2000" millsecond
#    And I wait for loading invisible
#    And I logout current user
#    And I wait for title change text to "登录"
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "All#123456"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "dictionary.ListPage" page for uri "/dictionary/"
#    Then I will see the search result "{'column':'0','name':'AutoTestUserCreate.csv','contains':'no'}"

  Scenario: 授权有读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestUserCreate.csv"
    And I "unchecked" the label before "AutoTestUserCreate.csv"
    When I "checked" function "读取" from the auth table which name is "AutoTestUserCreate.csv"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

  Scenario: 验证有读取权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "AutoTestUserCreate.csv" then i will see "授权" button
    When the data name is "AutoTestUserCreate.csv" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

  Scenario Outline: 授权读取+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestUserCreate.csv"
    When I "unchecked" function "删除,转授" from the auth table which name is "AutoTestUserCreate.csv"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given delete file "/target/download-files/<name>"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "下载编辑标签授权" button
    Given delete file "/target/download-files/<name>"
    And the data name is "<name>" then i click the "下载" button
    When the data name is "<name>" then i click the "编辑" button
    And I set the parameter "GroupInput" with value "字典分组AutoTest"
    And I choose the "字典分组AutoTest" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
    And I wait for "FileName" will be visible
    And I click the "Save" button
    Then I will see the success message "更新字典内容成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

    Examples:
      | name                   |
      | AutoTestUserCreate.csv |

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoTestUserCreate.csv"
    When the data name is "AutoTestUserCreate.csv" then I click the "无期限" button without total page
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario Outline: 新建字典
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
    And I wait for "FileName" will be visible
    And I click the "EnsureUpload" button
    Then I will see the success message "创建字典成功"

    Examples:
      | name         |
      | AutoTest.csv |

  Scenario: 功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    Then I click the "SaveButton" button

  Scenario: 验证有效期限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then I will see the search result "{'column':'0','name':'AutoTestUserCreate.csv','contains':'no'}"

  Scenario Outline: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字典'}" button
    And I wait for "Loading" will be invisible
    And I "unchecked" the label before "<name>"
    When I "checked" function "读取,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "删除授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "EnsureButton" will be visible
    And I click the "EnsureButton" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

    Examples:
      | name                   |
      | AutoTestUserCreate.csv |

  Scenario Outline: 读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "下载编辑标签删除授权" button
    Given delete file "/target/download-files/<name>"
    When the data name is "<name>" then i click the "下载" button
    When the data name is "<name>" then i click the "编辑" button
    And I set the parameter "GroupInput" with value "字典分组AutoTest"
    And I choose the "字典分组AutoTest" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
    And I wait for "FileName" will be visible
    And I click the "Save" button
    Then I will see the success message "更新字典内容成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "EnsureButton" will be visible
    And I click the "EnsureButton" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

    Examples:
      | name         |
      | AutoTest.csv |

  Scenario Outline: 授权读取+转授
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
    And I wait for "FileName" will be visible
    And I click the "EnsureUpload" button
    Then I will see the success message "创建字典成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name                   |
      | AutoTestUserCreate.csv |

  Scenario: 验证读取+转授
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "AutoTestUserCreate.csv" then i will see "授权" button
    When the data name is "AutoTestUserCreate.csv" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "AutoTestUserCreate.csv" then i will see "授权" button

  Scenario Outline: 授权读取+编辑+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    When I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name                   |
      | AutoTestUserCreate.csv |

  Scenario Outline: 验证读取+编辑+转授
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "AutoTestUserCreate.csv" then i will see "下载编辑标签授权" button
    Given delete file "/target/download-files/<name>"
    When the data name is "<name>" then i click the "下载" button
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AutoTestUserCreate.csv" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "AutoTestUserCreate.csv" then i will see "下载编辑标签授权" button
    When the data name is "<name>" then i click the "编辑" button
    And I set the parameter "GroupInput" with value "字典分组AutoTest"
    And I choose the "字典分组AutoTest" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
    And I wait for "FileName" will be visible
    And I click the "Save" button
    Then I will see the success message "更新字典内容成功"

    Examples:
      | name                   |
      | AutoTestUserCreate.csv |

  Scenario Outline: 授权读取+删除+转授
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
    And I wait for "FileName" will be visible
    And I click the "EnsureUpload" button
    Then I will see the success message "创建字典成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name                   |
      | AutoTestUserCreate.csv |

  Scenario: 验证读取+删除+转授
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "AutoTestUserCreate.csv" then i will see "删除授权" button
    When the data name is "AutoTestUserCreate.csv" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "AutoTestUserCreate.csv" then i will see "删除授权" button
    When the data name is "AutoTestUserCreate.csv" then i click the "删除" button
    And I wait for "EnsureButton" will be visible
    And I click the "EnsureButton" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

  Scenario Outline: 授权所有权限
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
    And I wait for "FileName" will be visible
    And I click the "EnsureUpload" button
    Then I will see the success message "创建字典成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字典'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name                   |
      | AutoTestUserCreate.csv |

  Scenario Outline: 验证所有权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "AutoTestUserCreate.csv" then i will see "下载编辑标签删除授权" button
    Given delete file "/target/download-files/<name>"
    When the data name is "<name>" then i click the "下载" button
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AutoTestUserCreate.csv" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "AutoTestUserCreate.csv" then i will see "下载编辑标签删除授权" button
    When the data name is "<name>" then i click the "编辑" button
    And I set the parameter "GroupInput" with value "字典分组AutoTest"
    And I choose the "字典分组AutoTest" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
    And I wait for "FileName" will be visible
    And I click the "Save" button
    Then I will see the success message "更新字典内容成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When the data name is "AutoTestUserCreate.csv" then i click the "删除" button
    And I wait for "EnsureButton" will be visible
    And I click the "EnsureButton" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

    Examples:
      | name                   |
      | AutoTestUserCreate.csv |

  Scenario: 新建
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I upload a file with name "/src/test/resources/testdata/dictionary/AuthTest.csv"
    And I wait for "FileName" will be visible
    And I click the "EnsureUpload" button
    Then I will see the success message "创建字典成功"

  Scenario: 授权用户读取权限
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "AuthTest.csv" then i click the "授权" button
    When I "check" the function "读取" which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

  Scenario: 验证用户读取权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "AuthTest.csv" then i will see "授权" button
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

  Scenario: 授权对应角色的读取权限
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I "uncheck" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I choose the "角色" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "读取" which name is "__user_AutoTest__" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  Scenario: 验证角色读取权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "AuthTest.csv" then i will see "授权" button
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

  Scenario: 授权对应用户分组的读取权限
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I choose the "角色" from the "AuthDropdown"
    And I wait for loading invisible
    And I "check" the checkbox which name is "__user_AutoTest__" in tiny table
    And I "uncheck" the checkbox which name is "__user_AutoTest__" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I choose the "用户分组" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "读取" which name is "AutoTestGroup" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  Scenario: 验证用户分组读取权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "AuthTest.csv" then i will see "授权" button
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

  Scenario: 给用户授权所有权限
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

  Scenario Outline: 二次授权读取
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "AuthTest.csv" then i will see "授权" button
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled

    Examples:
      | authRole | authName | function |
      | 用户       | 验证授权用户   | 读取       |

  Scenario Outline: 二次授权读取+编辑
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "下载编辑标签授权" button
    Given delete file "/target/download-files/<name>"
    And the data name is "<name>" then i click the "下载" button
    When the data name is "<name>" then i click the "编辑" button
    And I set the parameter "GroupInput" with value "字典分组AutoTest"
    And I choose the "字典分组AutoTest" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
    And I wait for "FileName" will be visible
    And I click the "Save" button
    Then I will see the success message "更新字典内容成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled

    Examples:
      | authRole | authName        | function | name         |
      | 角色       | __user_验证授权用户__ | 编辑       | AuthTest.csv |

  Scenario Outline: 二次授权读取+编辑+删除
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "AuthTest.csv" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "下载编辑标签删除授权" button
    Given delete file "/target/download-files/<name>"
    And the data name is "<name>" then i click the "下载" button
    When the data name is "<name>" then i click the "编辑" button
    And I set the parameter "GroupInput" with value "字典分组AutoTest"
    And I choose the "字典分组AutoTest" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
    And I wait for "FileName" will be visible
    And I click the "Save" button
    Then I will see the success message "更新字典内容成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "test"
    And I choose the "test" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "AuthTest.csv" then i click the "删除" button
    And I wait for "EnsureButton" will be visible
    And I click the "EnsureButton" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

    Examples:
      | authRole | authName | function | name         |
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除       | AuthTest.csv |
