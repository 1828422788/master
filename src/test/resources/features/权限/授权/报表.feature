#@auth
Feature: 权限-报表

  Scenario Outline: 新建所需趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | name        | spl                                                                                             |
      | ForAutoTest | tag:*hide \| stats avg(apache.status) as a_\|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\") |

  Scenario: 验证无新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "新建报表"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then I will see the "Create" doesn't exist

  Scenario: 验证有新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "Trend" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "ForAutoTest" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
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
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "Create" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoTestCreate"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I choose the "ForAutoTest" from the "ChartList"
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario: 取消读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Report" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "AutoTestCreate" in auth table
    And I "unchecked" the checkbox which name is "AutoTestCreate" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
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
    Given open the "report.ListPage" page for uri "/reports/"
    Then I will see the search result "{'column':'1','name':'AutoTestCreate','contains':'no'}"

  Scenario Outline: 授权读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Report" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
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
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看授权" button
    Then I will see the switch button before "{'column':'1','name':'<name>'}" is disabled
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "report.ListPage" page for uri "/reports/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoCreate"
    And I click the "NextButton" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "没有相关资源权限"

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 授权读取+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Report" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
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
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签授权" button
    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
#    Then I will see the message "禁用成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "LastDropdownList"
    And I click the "Ensure" button
    Then I will see the message "修改成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "DefaultReportType" change text to "PDF"
    And I set the parameter "Name" with value "AutoTestRename"
    And I click the "NextButton" button
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTestRename'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Report" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
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
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签删除授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoTestCreate"
    And I click the "NextButton" button
    And I click the "Save" button
    Then I will see the success message "保存成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTestCreate'}" then I "open" the switch
#    Then I will see the message "开启成功"
    When the data name is "{'column':'1','name':'AutoTestCreate'}" then i click the "标签" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "LastDropdownList"
    And I click the "Ensure" button
    Then I will see the message "修改成功"
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "{'column':'1','name':'AutoTestCreate'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "{'column':'1','name':'AutoTestCreate'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"

    Examples:
      | name           |
      | AutoTestRename |

  Scenario Outline: 授权读取+删除
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "Create" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I choose the "ForAutoTest" from the "ChartList"
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Report" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
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
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看删除授权" button
    Then I will see the switch button before "{'column':'1','name':'<name>'}" is disabled
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "report.ListPage" page for uri "/reports/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoCreate"
    And I click the "NextButton" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "没有相关资源权限"
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 授权读取+转授权限
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "Create" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I choose the "ForAutoTest" from the "ChartList"
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Report" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Report" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
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
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看授权" button
    Then I will see the switch button before "{'column':'1','name':'<name>'}" is disabled
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看授权" button
    And the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoCreate"
    And I choose the "PDF" from the "ReportType"
    And I click the "NextButton" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "没有相关资源权限"

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 授权读取+编辑+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Report" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Report" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
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
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签授权" button
    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
#    Then I will see the message "禁用成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for element "Message" change text to "修改成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoTestRename"
    And I click the "NextButton" button
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Then I click the "Report" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "AutoTestRename" in auth table
    When the data name is "AutoTestRename" then I click the "无限期" button in auth table
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario: 新建
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "Create" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoTestCreate"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I choose the "ForAutoTest" from the "ChartList"
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario: 验证有效期限
    When I wait for "2000" millsecond
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then I will see the search result "{'column':'1','name':'AutoTestRename','contains':'no'}"

  Scenario Outline: 授权读取+删除+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Report" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Report" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
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
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看删除授权" button
    Then I will see the switch button before "{'column':'1','name':'<name>'}" is disabled
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看删除授权" button
    And the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoCreate"
    And I click the "NextButton" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "没有相关资源权限"
    Given open the "report.ListPage" page for uri "/reports/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"

    Examples:
      | name           |
      | AutoTestRename |

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Report" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Report" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
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
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签删除授权" button
    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
#    Then I will see the message "禁用成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for element "Message" change text to "修改成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签删除授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoTestRename"
    And I click the "NextButton" button
    And I click the "Save" button
    Then I will see the message "保存成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'AutoTestRename'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario: 新建报表用来测试二次授权
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "Create" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "测试二次授权"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I choose the "ForAutoTest" from the "ChartList"
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario: 给AutoTest用户授权
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "{'column':'1','name':'测试二次授权'}" then i click the "授权" button
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  Scenario Outline: 二次授权读取
    When I wait for "2000" millsecond
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "{'column':'1','name':'测试二次授权'}" then i click the "授权" button
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "{'column':'1','name':'测试二次授权'}" then i will see "授权" button
    When the data name is "{'column':'1','name':'测试二次授权'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled

    Examples:
      | authName | function |
      | 验证授权用户   | 读取       |

  Scenario Outline: 二次授权读取+编辑
    When I wait for "2000" millsecond
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "{'column':'1','name':'测试二次授权'}" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "DefaultReportType" change text to "PDF"
    And I set the parameter "Name" with value "测试权限重命名"
    And I click the "NextButton" button
    And I click the "Save" button
    Then I will see the success message "保存成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'测试权限重命名'}" then I "close" the switch
#    Then I will see the message "禁用成功"
    When the data name is "{'column':'1','name':'测试权限重命名'}" then i click the "标签" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    When the data name is "{'column':'1','name':'测试权限重命名'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled

    Examples:
      | authRole | authName        | function | name   |
      | 角色       | __user_验证授权用户__ | 编辑       | 测试二次授权 |

  Scenario Outline: 二次授权读取+编辑+删除
    When I wait for "2000" millsecond
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签删除授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "DefaultReportType" change text to "PDF"
    And I set the parameter "Name" with value "测试二次授权"
    And I click the "NextButton" button
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'测试二次授权'}" then I "open" the switch
#    Then I will see the message "开启成功"
    When the data name is "{'column':'1','name':'测试二次授权'}" then i click the "标签" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "LastDropdownList"
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "{'column':'1','name':'测试二次授权'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "{'column':'1','name':'测试二次授权'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I wait for element "Message" change text to "删除成功"

    Examples:
      | authRole | authName | function | name    |
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | 测试权限重命名 |