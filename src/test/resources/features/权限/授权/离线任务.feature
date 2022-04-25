#@authtest
Feature: 权限-离线任务

  @testlogin
  Scenario: 无离线任务页面访问权限
    Given I login user "admin" with password "admin@rizhiyi.com"
    Then I wait for loading invisible
    Then I logout current user

  Scenario Outline: 取消离线任务
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可查看搜索页"
    And I click the "Resource" button
    And I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name              |
      | __user_AutoTest__ |

  Scenario: 验证无离线任务权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    Then I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the "OfflineTask" doesn't exist

  Scenario: 无离线任务页面访问权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.OfflineTaskPage" page for uri "/offlinetask/"
    And I wait for loading invisible
    Then the page's title will be "403 Permission Denied"
    Then I logout current user

  Scenario Outline: 勾选离线任务
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    When I "checked" the checkbox which name is "可使用离线任务"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name              |
      | __user_AutoTest__ |

  Scenario: 验证可使用离线任务
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    Then I wait for "OfflineTask" will be visible
    Then I logout current user
