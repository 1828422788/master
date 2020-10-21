@authtest @authtest1
Feature: 权限-collect指令

  Scenario: 取消可使用collect指令
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
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
    When I set the parameter "Name" with value "autotestauth"
    And I set the parameter "SavedTime" with value "2"
    And I set the parameter "DivideTime" with value "1"
    And I click the "CreateButton" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"

  Scenario: 验证无法使用collect指令
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "*|collect index=autotestauth marker=\"appname=\\\"autotestappname\\\", tag=\\\"autotesttag\\\"\""
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    Then I wait for element "SearchStatus" change text to "搜索出错!"

  Scenario: 勾选collect指令
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I "checked" the checkbox which name is "全选" in trend page
    And I "unchecked" the checkbox which name is "全选" in trend page
    When I "checked" the checkbox which name is "可使用collect指令"
    And I click the "SaveButton" button

  Scenario: 验证无写入索引权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "*|collect index=autotestauth marker=\"appname=\\\"autotestappname\\\", tag=\\\"autotesttag\\\"\""
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    Then I wait for element "SearchStatus" change text to "搜索出错!"

  Scenario Outline: 授权写入索引权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "Index" button
    When I "checked" function "读取,编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

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
    Then I will see the element "Tag" name is "autotesttag "

  Scenario Outline: 删除索引
    Given open the "index.ListPage" page for uri "/indexsettings/"
    When the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button
    Then I click the "Ensure" button

    Examples:
      | name         |
      | autotestauth |