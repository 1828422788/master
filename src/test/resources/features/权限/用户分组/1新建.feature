@userGroups @all
Feature: 用户分组创建（RZY-545）

  Background:
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"

  Scenario Outline: 用户分组创建
    And I click the "Create" button
    Then I will see the "userGroups.CreatePage" page
    And I wait for "UserGroupName" will be visible
    When I set the parameter "UserGroupName" with value "<UserGroupName>"
    When I set the parameter "UserGroupDes" with value "<UserGroupDes>"
    And I click the "CreateButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "<message>"

    Examples:
      | UserGroupName     | UserGroupDes | message |
      | AutoTestForDelete | des1         | 创建成功    |

    Examples: 创建失败（重名校验）
      | UserGroupName     | UserGroupDes | message                                         |
      | AutoTestForDelete | des          | 创建失败: account_group_name: AutoTestForDelete 已存在 |

  Scenario: 用户分组创建失败（为空校验）
    And I click the "Create" button
    Then I will see the "userGroups.CreatePage" page
    And I click the "CreateButton" button
    And I wait for "ExplainMessage" will be visible
    Then I will see the element "ExplainMessage" name is "请输入名称"
