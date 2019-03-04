@authorization @all @smoke
Feature: 角色授权用户分组

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'用户分组'}" button

  Scenario Outline: 无任何授权（RZY-563）
    When I "unchecked" the label before "AutoTestGroup"
    And I click the "SaveButton" button
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

  Scenario Outline: 授权用户分组的读取并验证无编辑权限（RZY-564）
    When I check "<CheckBoxes>" from the "{'GroupManagement':['<GroupName>']}"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I will see the search result "{'column':'1','name':'<GroupName>'}"
    And the data name is "{'column':'1','name':'<GroupName>'}" then i click the "编辑" button
    And I wait for "DisabledInput" will be visible
    And I click the "EnsureButton" button
    Then I will see the error message "<message>"

    Examples:
      | CheckBoxes | GroupName     | message             |
      | 读取         | AutoTestGroup | 操作者没有权限\n错误码: FE_42 |

  Scenario Outline: 授权读取、编辑（RZY-565）
    When I check "<CheckBoxes>" from the "{'GroupManagement':['<GroupName>']}"
    And I click the "SaveButton" button
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
      | CheckBoxes | GroupName     | message | describe     |
      | 读取,编辑      | AutoTestGroup | 更新成功    | AutoTest用户修改 |

  Scenario Outline: 授权分组管理的读取、编辑、删除权限（RZY-562、RZY-567）
    When I check "<CheckBoxes>" from the "{'GroupManagement':['<GroupName>']}"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And the data name is "{'column':'1','name':'<GroupName>'}" then i click the "编辑" button
    And I will see the element "Title" name is "*角色"
    And I click the "ReturnList" button
    And the data name is "{'column':'1','name':'<GroupName>'}" then i click the "删除" button

    Examples:
      | CheckBoxes | GroupName     |
      | 读取,编辑,删除   | AutoTestGroup |

  Scenario: 授权新建用户分组以及新建用户权限（RZY-560、RZY-561）
    When I "checked" the checkbox which name is "新建用户分组,新建用户"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "userGroups.ListPage" page for uri "/account/usergroups/"
    Then I wait for "CreateUserGroup" will be visible
    And open the "users.ListPage" page for uri "/account/users/"
    Then I wait for "CreateUser" will be visible

  Scenario Outline: 授权组内读取权限
    When I check "读取" from the "{'IntraGroupManagement':['<name>']}"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    Then I will see the "AddMemberButtonStatus" is "disabled"

    Examples:
      | name          |
      | AutoTestGroup |