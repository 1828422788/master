@authtest @authsmoke
Feature: 权限-collect指令

  Scenario: 取消可使用collect指令
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I "checked" the checkbox which name is "全选" in trend page
    And I "unchecked" the checkbox which name is "全选" in trend page
    When I "checked" the checkbox which name is "可查看搜索页"
    And I click the "Resource" button
    And I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "SaveButton" button

  Scenario: 新建索引
    Given open the "index.ListPage" page for uri "/indexsettings/"
    And I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    And I wait for "2000" millsecond
    When I set the parameter "Name" with value "autotestauth"
    And I set the parameter "SavedTime" with value "2"
    And I set the parameter "DivideTime" with value "1"
    And I wait for "2000" millsecond
    And I click the "Next" button
    And I wait for "2000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I wait for "Message" will be visible
    Then I will see the message "索引配置完成!"
    And I logout current user

  Scenario: 验证无法使用collect指令--RZY-7835
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "*|collect index=autotestauth marker=\"appname=\\\"autotestappname\\\", tag=\\\"autotesttag\\\"\""
    And I click the "DateEditor" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I click the "SearchButton" button
    And I will see the "ErrorIcon" is display
   # Then I wait for element "SearchStatus" change text to "权限错误"
    And I logout current user

  Scenario: 勾选collect指令
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    When I "checked" the checkbox which name is "可使用collect指令"
    And I click the "SaveButton" button
    And I logout current user

  Scenario: 验证无写入索引权限--RZY-7835
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "*|collect index=autotestauth marker=\"appname=\\\"autotestappname\\\", tag=\\\"autotesttag\\\"\""
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I will see the "ErrorIcon" is display
   # Then I wait for element "SearchStatus" change text to "权限错误: 没有写索引'autotestauth'的权限"
    And I logout current user

  Scenario Outline: 授权写入索引权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Index" button
    When I "checked" function "读取,编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    And I logout current user

    Examples:
      | name         |
      | autotestauth |

  Scenario: 验证有写入索引权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "*| stats count() by apache.geo.city|collect index=autotestauth marker=\"appname=\\\"autotestappname\\\", tag=\\\"autotesttag\\\"\""
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    Then I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario: 验证写入索引
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "index=autotestauth *"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    Then I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    And I wait for "1500" millsecond
    Then I will see the element "Tag" name is "autotesttag"
    And I logout current user

  Scenario Outline: 删除索引
    Given open the "index.ListPage" page for uri "/indexsettings/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    Then I click the "Ensure" button

    Examples:
      | name         |
      | autotestauth |