@smoke @usersSmoke
Feature: 用户分组申请加入（RZY-1181）

  Background:
    Given I logout current user

  Scenario Outline: 不在当前分组的用户，可以点击查看拥有管理权限的名单，申请加入
    When open the "LoginPage" page for uri "/auth/login/"
    And I set the parameter "Username" with value "<username>"
    And I set the parameter "Password" with value "<password>"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And the data name is "{'column':'1','name':'admin'}" then i click the "申请加入" button
    Then I will see the message contains "请自己联系该分组的管理角色进行授权，可找角色: admin"

    Examples:
      | username | password   |
      | AutoTest | qqqqq11111 |