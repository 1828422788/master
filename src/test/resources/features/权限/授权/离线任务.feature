@auth
Feature: 权限-模式学习

  Scenario Outline: 取消离线任务
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "可查看搜索页"
    When I "unchecked" the checkbox which name is "可使用离线任务"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |

  Scenario: 验证无离线任务权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    Then I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the "OfflineTask" doesn't exist

  Scenario: 无离线任务页面访问权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "PageTemplate" page for uri "/offlinetask/"
    Then the page's title will be "403 Permission Denied"

  Scenario Outline: 勾选离线任务
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "可使用离线任务"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |

  Scenario: 新建离线任务
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I click the "OfflineTask" button
    And I set the parameter "OfflineTaskName" with value "AutoAuth"
    And I click the "EnsureButton" button
    Then I will see the message "提交成功，请到设置-离线任务页查看离线任务状态！"

  Scenario: 删除离线任务
    Given I login user "AutoTest" with password "All#123456"
    And open the "ListPageFactory" page for uri "/offlinetask/"
    And the data name contains "AutoAuth" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
