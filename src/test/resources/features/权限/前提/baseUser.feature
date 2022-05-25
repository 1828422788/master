@baseUser
Feature: 基础用户创建

  Scenario Outline: 所需用户分组
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I click the "Create" button
    Then I will see the "userGroups.CreatePage" page
    And I wait for "UserGroupName" will be visible
    When I set the parameter "UserGroupName" with value "<groupProperty>"
    When I set the parameter "UserGroupDes" with value "<UserGroupDes>"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建成功"

    Examples:
      | groupProperty    | UserGroupDes |
      | AutoTestGroup    | des1         |
      | 验证授权用户分组 | des1         |

  Scenario Outline: 添加基本用户
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    And I wait for "UserName" will be visible
    When I set the parameter "UserName" with value "<name>"
    And I set the parameter "Email" with value "<email>"
    And I set the parameter "Password" with value "All!123456"
    And I choose the "<group>" from the "UserGroups"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

    Examples:
      | name     | email                     | group         |
      | AutoTest | autoFullName@yottabyte.cn | AutoTestGroup |
      | 验证授权用户   | testAuthGroup@autotest.cn | 验证授权用户分组      |
      | wym      | 123@rizhiyi.com           | 验证授权用户分组          |

  Scenario Outline: 修改密码（首次登录需修改）
    Given I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    And I wait for title change text to "登录"
    When I set the parameter "Username" with value "<name>"
    And I set the parameter "Password" with value "All!123456"
    And I click the "LoginButton" button
    And I wait for "Modify" will be visible
    And I click the "Modify" button
    And I set the parameter "NewPassword" with value "All#123456"
    And I set the parameter "RepeatPassword" with value "All#123456"
    And I click the "Update" button

    Examples:
      | name     |
      | AutoTest |
      | 验证授权用户   |
      | wym      |

  Scenario: 新建搜索权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I click the "Create" button
    And I set the parameter "Name" with value "SearchAuth"
    And I set the parameter "Appname" with value "*"
    And I click the "Ensure" button
    Then I will see the success message "操作成功"

  Scenario: 分配搜索权限给AutoTest
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    When the data name is "SearchAuth" then i click the "授权" button in more menu
    And I wait for "2000" millsecond
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  Scenario Outline:关闭隐藏内置角色
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for loading complete
    And I close all tabs except main tab
    Then I click the "HiddenRole" button
    And I will see the message "更新成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    Then the data name is "<name>" then i will see "<function>" button

    Examples:
      | name                   |function|
      | __user_AutoTest__ |授权    |


  Scenario: 授权索引配置
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'索引'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "yotta" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"