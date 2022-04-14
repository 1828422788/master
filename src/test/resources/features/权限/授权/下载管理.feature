@authtest
Feature: 权限-下载管理

  Scenario Outline: 取消勾选下载管理
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    When I "checked" the checkbox which name is "可查看搜索页"
    When I "unchecked" the checkbox which name is "可下载搜索结果(download指令)"
    And I click the "Resource" button
    And I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name              |
      | __user_AutoTest__ |

  Scenario: 验证无下载管理页面访问权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "PageTemplate" page for uri "/download/"
    Then the page's title will be "403 Permission Denied"

  Scenario: 验证无法使用download指令
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value " * | chart count() by appname | download filename=\"AutoTest\" fileformat=\"csv\""
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    Then I wait for element "SearchErrorStatus" change text to "0: 无权限的操作 :[download]"
    Then I logout current user

  Scenario Outline: 勾选下载管理
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I "checked" the checkbox which name is "可下载搜索结果(download指令)"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name              |
      | __user_AutoTest__ |

  Scenario: 验证使用download指令
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value " * | chart count() by appname | download filename=\"AutoTestAuthDownload\" fileformat=\"csv\""
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "1000" millsecond
    Then I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario: 验证下载管理页面
    Given I login user "AutoTest" with password "All#123456"
    And open the "ListPageFactory" page for uri "/download/"
    And I wait for loading invisible
    And the data name contains "AutoTestAuthDownload" then i click the "下载" button
    And the data name contains "AutoTestAuthDownload" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

  Scenario: 验证在搜索页下载
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value " * | chart count() by appname"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    Then I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "1000" millsecond
    And I click the "EventButton" button
    Then I wait for "1000" millsecond
    And I click the "DownloadEvent" button
    And I wait for "1500" millsecond
    And I set the parameter "DownloadName" with value "AutoTestAuth"
    And I choose the "CSV" from the "FileType"
    And I click the "EnsureButton" button
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

  Scenario: 验证下载管理
    Given I login user "AutoTest" with password "All#123456"
    And open the "ListPageFactory" page for uri "/download/"
    And I wait for loading invisible
    And the data name contains "AutoTestAuth" then i click the "下载" button
    And the data name contains "AutoTestAuth" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I logout current user
