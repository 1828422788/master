@auth
Feature: 权限-功能（URL校验）

  Scenario: 无任何权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario Outline: 验证无任何权限
    Given I login user "AutoTest" with password "All#123456" without permission
    And I wait for "2000" millsecond
    And open the "LoginPage" page for uri "/alerts/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/plugins/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/payments/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/ingestpriority/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/queryscopes/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/search/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/sources/input/agent/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/account/usage/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/dictionary/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/macro/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/macro/new/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/usage/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/reports/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/reports/new/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/trend/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/trend/new/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/schedule/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/backup/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/sources/input/os/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/account/roles/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/account/roles/new/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/account/users/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/account/users/new/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/knowledge/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/knowledge/new/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/dashboard/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/account/usergroups/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/account/usergroups/new/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/app/galaxee/manager/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/app/machine_learning/showcase/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/app/lynxee/overview/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/topology/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/topology/new/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/configs/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/configs/new/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/tokens/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/docs/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/resource/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/dataset/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/apikey/"
    Then the page's title will be "<title>"
    And open the "LoginPage" page for uri "/savedsearches/"
    Then the page's title will be "<title>"

    Examples:
      | title                 |
      | 403 Permission Denied |

  Scenario Outline: 测试运行功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    #Then I click the "{'TabButton':'功能'}" button
    And I click the "Resource" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "System" button
    And I wait for "Loading" will be invisible
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



