@incident @cruxee @incident1
Feature: 创建接收告警邮件用户、用户组

  @incident @incident1
  Scenario Outline: 添加普通用户
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "<UserName>"
    And I set the parameter "FullName" with value "<FullName>"
    And I set the parameter "Email" with value "<Email>"
    And I set the parameter "Password" with value "<Password>"
    And I click the "CreateButton" button
    Then I will see the <Result>

    Examples:
      | UserName  | FullName                  | Email                    | Password   | Result                 |
      | ctest     | ctest                     | chen.shuang@yottabyte.cn | All#123456 | success message "创建成功" |
      | Derek     | Derek Parfit              | 2312200836@qq.com        | All#123456 | success message "创建成功" |
      | Leibniz   | Gottfried Wilhelm Leibniz | Leibniz@qq.cn            | All#123456 | success message "创建成功" |
      | kongfeili | kongfeili                 | kongfeili@qq.cn          | All#123456 | success message "创建成功" |
      | 钟阿城        | 钟阿城                       | zhongacheng@qq.cn        | All#123456 | success message "创建成功" |

  @incident @incident2
  Scenario Outline: 新建用户分组样例1个
    Given open the "incident.UserGroupCreatePage" page for uri "/account/usergroups/"
#    Given open the "userGroups.CreatePage" page for uri "/account/usergroups/"
    And I click the "CreateButton" button
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
#      Then I will see the success message "<message>"
    And I wait for "2000" millsecond
#      And I click the "OkButton" button
    And I click the "Ensure" button

    Examples:
      | UserGroupName | UserGroupDes | message |
      | 日志易用户体验组      | 测试incident策略 | 创建成功    |
