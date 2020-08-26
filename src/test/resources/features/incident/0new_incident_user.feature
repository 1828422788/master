  Feature: 创建接收告警邮件用户、用户组

    Background:
      Given open the "users.ListPage" page for uri "/account/users/"

    @incident @incident1
    Scenario Outline: 添加普通用户
      And I click the "CreateUser" button
      And I will see the "users.CreatePage" page
      When I set the parameter "UserName" with value "<UserName>"
      And I set the parameter "FullName" with value "<FullName>"
      And I set the parameter "Email" with value "<Email>"
      And I set the parameter "Password" with value "<Password>"
      And I click the "CreateButton" button
      Then I will see the <Result>

      Examples:
        | UserName        | FullName         | Email                        | Password   | Result |
        | ctest | ctest | chen.shuang@yottabyte.cn | All#123456 | success message "创建成功" |
        | Derek | Derek Parfit  | 2312200836@qq.com | All#123456 | success message "创建成功" |
        | Leibniz | Gottfried Wilhelm Leibniz | Leibniz@qq.cn | All#123456 | success message "创建成功" |
        | kongfeili | kongfeili | kongfeili@qq.cn | All#123456 | success message "创建成功" |

    @incident @incident2
    Scenario Outline: 新建用户分组样例1个
      Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
      And I click the "Create" button
      Then I will see the "userGroups.CreatePage" page
      When I set the parameter "UserGroupName" with value "<UserGroupName>"
      When I set the parameter "UserGroupDes" with value "<UserGroupDes>"

      And I click the "AddMember" button
      And I "check" the checkbox which name is "ctest" in tiny table
      And I "check" the checkbox which name is "Leibniz" in tiny table
      And I "check" the checkbox which name is "kongfeili" in tiny table
      And I click the "Ensure" button

      And I click the "AddAdmin" button
      And I "check" the checkbox which name is "Derek" in tiny table
      And I click the "Ensure" button

      And I click the "SaveMember" button
      Then I will see the success message "<message>"
      And I click the "OkButton" button

      Examples:
        | UserGroupName     | UserGroupDes    | message |
        | 日志易用户体验组    | 测试incident策略 | 创建成功  |

    @incidentdel @delcruusers
    Scenario Outline: 删除4个事件管理体验用户
      Given open the "users.ListPage" page for uri "/account/users/"
      When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
      And I click the "EnsureButton" button
      And I wait for "SuccessMessage" will be visible
      And I refresh the website
      Then I will see the search result "{'column':'1','name':'<name>','contains':'no'}"

      Examples:
        | name  |
        | ctest |
        | Derek |
        | Leibniz |
        | kongfeili |

    @incidentdel @delcruusergroup
    Scenario Outline: 删除用户分组
      Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
      And the data name is "{'column':'1','name':'<UserGroupName>'}" then i click the "删除" button
      And I click the "Ensure" button

      Examples:
        | UserGroupName     |
        | 日志易用户体验组    |
