Feature: 权限-字典

  Scenario: 验证无新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用字典管理"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then I will see the "UploadButton" doesn't exist

  Scenario: 验证可新建字典
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用字典管理,新建字典"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I set the parameter "GroupInput" with value "字典标签"
    And I choose the "字典标签" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/AutoTestUserCreate.csv"
    And I wait for "FileName" will be visible
    And I click the "EnsureUpload" button
    Then I will see the success message "创建字典成功"

  Scenario: 授权无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用字典管理,新建字典"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoTestUserCreate.csv"
    And I "unchecked" the label before "AutoTestUserCreate.csv"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 验证无读取权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then I will see the search result "{'column':'0','name':'AutoTestUserCreate.csv','contains':'no'}"

  Scenario: 授权有读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "可使用字典管理,新建字典"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoTestUserCreate.csv"
    And I "unchecked" the label before "AutoTestUserCreate.csv"
    When I "checked" function "读取" from the auth table which name is "AutoTestUserCreate.csv"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 验证有读取权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'AutoTestUserCreate.csv'}" then i will see "授权" button
    When the data name is "AutoTestUserCreate.csv" then i click the "授权" button
    Then I wait for "NoAuth" will be visible

  Scenario: 授权读取+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "可使用字典管理,新建字典"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoTestUserCreate.csv"
    When I "unchecked" function "删除,转授" from the auth table which name is "AutoTestUserCreate.csv"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 验证读取+编辑权限
    Given delete file "/target/download-files/AutoTestUserCreate.csv"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'AutoTestUserCreate.csv'}" then i will see "下载编辑授权" button
    And the data name is "AutoTestUserCreate.csv" then i click the "下载" button
    When the data name is "AutoTestUserCreate.csv" then i click the "编辑" button
    And I set the parameter "GroupInput" with value "字典分组AutoTest"
    And I choose the "字典分组AutoTest" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/AutoTestUserCreate.csv"
    And I wait for "FileName" will be visible
    And I click the "EnsureUpload" button
    Then I will see the success message "更新字典内容成功"

  Scenario: 授权读取+编辑+转授功能
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "可使用字典管理,新建字典,可查看角色页"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoTestUserCreate.csv"
    When I "unchecked" function "删除" from the auth table which name is "AutoTestUserCreate.csv"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用字典管理"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'仪表盘'}" button
    And I wait for loading invisible
    And I "unchecked" the label before "AutoTestUserCreate.csv"
    And I "checked" the label before "AutoTestUserCreate.csv"
    When the data name is "AutoTestUserCreate.csv" then I click the "无期限" button without total page
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

#  Scenario: 验证读取+编辑+转授功能
#    Given delete file "/target/download-files/AutoTestUserCreate.csv"
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
#    And I logout current user
#    And I wait for title change text to "登录"
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "all123456"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "dictionary.ListPage" page for uri "/dictionary/"
#    Then the data name is "{'column':'0','name':'AutoTestUserCreate.csv'}" then i will see "下载编辑授权" button
#    When the data name is "AutoTestUserCreate.csv" then i click the "授权" button

  Scenario: 验证有效期限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then I will see the search result "{'column':'0','name':'AutoTestUserCreate.csv','contains':'no'}"

  Scenario: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "可使用字典管理,新建字典"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'字典'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoTestUserCreate.csv"
    When I "unchecked" function "编辑,转授" from the auth table which name is "AutoTestUserCreate.csv"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 验证删除
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "AutoTestUserCreate.csv" then i click the "删除" button
    And I click the "EnsureButton" button

  Scenario: 验证是否删除成功
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then I will see the search result "{'column':'0','name':'AutoTestUserCreate.csv','contains':'no'}"

