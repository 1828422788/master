Feature: 权限-报表

  Scenario: 验证无新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "新建报表"
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
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    Then I will see the "Create" doesn't exist

  Scenario Outline: 新建所需趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | name        | spl                                                                                             |
      | ForAutoTest | tag:*hide \| stats avg(apache.status) as a_\|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\") |

  Scenario: 验证有新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the label before "ForAutoTest"
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
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "Create" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoTestCreate"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    And I choose the "ForAutoTest" from the "ChartList"
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario: 取消读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'报表'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestCreate"
    And I "unchecked" the label before "AutoTestCreate"
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
    Given open the "report.ListPage" page for uri "/reports/"
    Then I will see the search result "{'column':'1','name':'AutoTestCreate','contains':'no'}"

  Scenario: 授权读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'报表'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestCreate"
    And I "unchecked" the label before "AutoTestCreate"
    When I "checked" function "读取" from the auth table which name is "AutoTestCreate"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 验证读取权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "{'column':'1','name':'AutoTestCreate'}" then i will see "查看授权" button
    And the data name is "{'column':'1','name':'AutoTestCreate'}" then i click the "授权" button
    Then I wait for "NoAuth" will be visible

  Scenario: 授权读取+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'报表'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestCreate"
    When I "unchecked" function "删除,转授" from the auth table which name is "AutoTestCreate"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 验证读取+编辑权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "{'column':'1','name':'AutoTestCreate'}" then i will see "编辑标签授权" button
    When the data name is "{'column':'1','name':'AutoTestCreate'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoTestRename"
    And I click the "NextButton" button
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario: 授权读取+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'报表'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestRename"
    When I "unchecked" function "编辑,删除" from the auth table which name is "AutoTestRename"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

#    Scenario: 验证读取+转授

  Scenario: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'报表'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestRename"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 验证所有权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "{'column':'1','name':'AutoTestRename'}" then i will see "编辑标签删除授权" button
    When the data name is "{'column':'1','name':'AutoTestRename'}" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
