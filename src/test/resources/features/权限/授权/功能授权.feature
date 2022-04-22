@auth
Feature: 权限-功能（URL校验）

  Scenario: 无任何权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for loading invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario Outline: 验证无任何权限
    Given I login user "AutoTest" with password "All#123456" without permission
    And I wait for "2000" millsecond
    And open the "LoginPage" page for uri "<url>"
    Then the page's title will be "<title>"

    Examples:
      | title                 | url |
      | 403 Permission Denied | /knowledge/new/  |
      | 403 Permission Denied | /knowledge/  |
      | 403 Permission Denied | /account/users/new/  |
      | 403 Permission Denied | /account/users/  |
      | 403 Permission Denied | /account/roles/new/  |
      | 403 Permission Denied | /account/roles/  |
      | 403 Permission Denied | /sources/input/os/  |
      | 403 Permission Denied | /schedule/  |
      | 403 Permission Denied | /trend/new/  |
      | 403 Permission Denied | /trend/  |
      | 403 Permission Denied | /reports/new/  |
      | 403 Permission Denied | /reports/  |
      | 403 Permission Denied | /usage/  |
      | 403 Permission Denied | /reports/  |
      | 403 Permission Denied | /macro/new/ |
      | 403 Permission Denied | /macro/ |
      | 403 Permission Denied | /dictionary/ |
      | 403 Permission Denied | /account/usage/  |
      | 403 Permission Denied | /sources/input/agent/ |
      | 403 Permission Denied | /search/  |
      | 403 Permission Denied | /queryscopes/  |
      | 403 Permission Denied | /ingestpriority/  |
      | 403 Permission Denied | /configs/  |
      | 403 Permission Denied | /topology/new/  |
      | 403 Permission Denied | /topology/  |
      | 403 Permission Denied | /app/lynxee/overview/  |
      | 403 Permission Denied | /app/machine_learning/showcase/  |
      | 403 Permission Denied | /app/galaxee/manager/  |
      | 403 Permission Denied | /account/usergroups/new/  |
      | 403 Permission Denied | /account/usergroups/  |
      | 403 Permission Denied | /dashboard/  |
      | 403 Permission Denied | /alerts/  |
      | 403 Permission Denied | /plugins/  |
      | 403 Permission Denied | /payments/  |
      | 403 Permission Denied | /savedsearches/  |
      | 403 Permission Denied | /apikey/  |
      | 403 Permission Denied | /dataset/  |
      | 403 Permission Denied | /resource/  |
      | 403 Permission Denied | /docs/  |
      | 403 Permission Denied | /tokens/  |
      | 403 Permission Denied | /configs/new/  |


  Scenario Outline: 测试运行功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    #Then I click the "{'TabButton':'功能'}" button
    And I click the "Resource" button
    And I wait for loading invisible
    When I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "System" button
    And I wait for loading invisible
    When I "checked" the checkbox which name is "<function>"
   # When I "checked" the checkbox which name is "<function>,可查看仪表盘"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"
    Given I login user "AutoTest" with password "All#123456"
    Then I will see the "PublicNavBarPage" page
    And I wait for "Running" will be visible
    And I click the "Running" button
    And I wait for "Menu" will be visible
    And I wait for "1000" millsecond
    #################
   # Then I will see the element "Menu" name is "运行 (系统版本: 3.7)<name>语言和地区"
    And open the "PublicNavBarPage" page for uri "<url>"
    Then I wait for title change text to "<title>"

    Examples:
      | function      | name                             | url             | title    |
      | 可查看域使用额度      | \n使用限额\n                         | /account/usage/ | 使用限额     |
      | 可查看域标识        | \n域标识\n使用限额\n                   | /tokens/        | 域标识      |
      | 可使用结算管理       | \n域标识\n使用限额\n结算管理\n              | /payments/      | 结算管理     |
      | 可查看用户搜索用量     | \n使用限额\n域标识\n结算管理\n搜索用量\n        | /usage/         | 搜索用量     |
  ###########
    #  | 可使用 ApiKey 认证 | \n使用限额\n域标识\n结算管理\n搜索用量\nAPI密钥\n | /apikey/        | Apikey密钥 |



