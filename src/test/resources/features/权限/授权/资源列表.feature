#@authtest
Feature: 权限-资源列表

  Scenario: 取消勾选可查看资源列表
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    And I "unchecked" the checkbox which name is "可查看资源列表"
    And I click the "Resource" button
    And I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证无可查看资源列表权限
    Given I login user "AutoTest" with password "All#123456"
    When open the "roles.ListPage" page for uri "/resource/"
    And I wait for loading invisible
    Then the page's title will be "403 Permission Denied"
    Then I logout current user

  Scenario: 勾选可查看资源列表权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I click the "Resource" button
    And I "checked" the checkbox which name is "可查看资源列表"
    And I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证无导入导出功能
    Given I login user "AutoTest" with password "All#123456"
    When open the "resourceGroups.ListPage" page for uri "/resource/"
    And I wait for loading invisible
    Then I will see the "ImportAndExportButton" doesn't exist
    Then I logout current user

  Scenario: 勾选导入导出权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    And I "checked" the checkbox which name is "可使用资源包导入、导出"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证有导入导出权限
    Given I login user "AutoTest" with password "All#123456"
    When open the "resourceGroups.ListPage" page for uri "/resource/"
    And I wait for loading invisible
    Then I wait for "ImportAndExportButton" will be visible
    Then I logout current user
