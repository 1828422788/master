@auth
Feature: 权限-资源列表

  Scenario: 取消勾选可查看资源列表
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "unchecked" the checkbox which name is "可查看资源列表"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario: 验证无可查看资源列表权限
    Given I login user "AutoTest" with password "All#123456"
    When open the "roles.ListPage" page for uri "/resource/"
    Then the page's title will be "403 Permission Denied"

  Scenario: 勾选可查看资源列表权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "可查看资源列表"
    And I "unchecked" the checkbox which name is "可使用资源包导入、导出"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario: 验证无导入导出功能
    Given I login user "AutoTest" with password "All#123456"
    When open the "resourceGroups.ListPage" page for uri "/resource/"
    Then I will see the "ImportAndExportButton" doesn't exist

  Scenario: 勾选导入导出权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "可查看资源列表"
    And I "checked" the checkbox which name is "可使用资源包导入、导出"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario: 验证有导入导出权限
    Given I login user "AutoTest" with password "All#123456"
    When open the "resourceGroups.ListPage" page for uri "/resource/"
    Then I wait for "ImportAndExportButton" will be visible
