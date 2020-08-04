#@auth
Feature: 权限-全链路

  Scenario Outline: 勾选字段提取所需功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可查看全链路"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario: 验证无新建权限
    Given I login user "AutoTest" with password "All#123456"