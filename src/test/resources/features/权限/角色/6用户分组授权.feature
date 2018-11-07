@authorization @all @smoke @roleSmoke
Feature: 授权角色权限

  Scenario Outline:
    Given I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "<username>"
    And I set the parameter "Password" with value "<password>"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I will see the element value in json "<value>"

    Examples:
      | username | password   | value                |
      | AutoTest | qqqqq11111 | {'EmptyText':'暂无数据'} |

  Scenario Outline: 授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    When the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I click the "{'TabButton':'<Tab>'}" button
    And I check "<CheckBoxes>" from the "{'GroupManagement':['<GroupName>']}"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I will see the search result "{'column':'1','name':'<GroupName>'}"
    And the data name is "{'column':'1','name':'<GroupName>'}" then i click the "编辑" button
    And I click the "EnsureButton" button
    Then I will see the error message "<message>"

    Examples:
      | Tab  | CheckBoxes | GroupName     | message             |
      | 用户分组 | 读取         | AutoTestGroup | 操作者没有权限\n错误码: FE_42 |

  Scenario Outline: 授权读取、编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    When the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I click the "{'TabButton':'<Tab>'}" button
    And I check "<CheckBoxes>" from the "{'GroupManagement':['<GroupName>']}"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I will see the search result "{'column':'1','name':'<GroupName>'}"
    And the data name is "{'column':'1','name':'<GroupName>'}" then i click the "编辑" button
    And I set the parameter "Describe" with value "<describe>"
    And I click the "EnsureButton" button
    Then I will see the success message "<message>"
    And I click the "ReturnList" button
    Then I will see the data "{'column':'1','name':'<GroupName>'}" values "{'column':'3','name':'<describe>'}"

    Examples:
      | Tab  | CheckBoxes | GroupName     | message | describe     |
      | 用户分组 | 读取,编辑      | AutoTestGroup | 更新成功    | AutoTest用户修改 |

  Scenario Outline: 授权读取、编辑、删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    When the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I click the "{'TabButton':'<Tab>'}" button
    And I check "<CheckBoxes>" from the "{'GroupManagement':['<GroupName>']}"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I will see the search result "{'column':'1','name':'<GroupName>'}"
    And the data name is "{'column':'1','name':'<GroupName>'}" then i click the "删除" button

    Examples:
      | Tab  | CheckBoxes | GroupName     |
      | 用户分组 | 读取,编辑,删除   | AutoTestGroup |